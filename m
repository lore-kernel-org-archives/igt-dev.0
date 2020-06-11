Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F3A6E8B6
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2020 08:55:42 +0000 (UTC)
Date: Thu, 11 Jun 2020 11:55:40 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200611085540.GL9497@platvala-desk.ger.corp.intel.com>
References: <20200610160417.3402896-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200610160417.3402896-1-lyude@redhat.com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Fix handling of metadata values
 containing spaces
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Lyude <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 10, 2020 at 12:04:17PM -0400, Lyude wrote:
> From: Lyude Paul <lyude@redhat.com>
> 
> Noticed while running some tests that adding any kind of spaces into the
> name of a test run would stop igt_resume from working for said test run.
> Turns out that when we parse test metadata, we accidentally use the
> '%ms' specifier with fscanf() which finishes parsing strings when any
> kind of whitespace is encountered.
> 
> So, fix this by using the proper %m[^\n] specifier, which dynamically
> allocates it's result and doesn't stop reading the string until a
> newline is encountered. Additionally, add a test for this.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Yeah, and running igt_resume breaks in the same way. And it's not
limited to just the name, the file paths are also broken if they have
spaces. Testing just the name field should be enough to cover those
though.

Thanks for the fix,

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  runner/runner_tests.c | 12 ++++++++++++
>  runner/settings.c     |  2 +-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/runner/runner_tests.c b/runner/runner_tests.c
> index 60e00960..48b02107 100644
> --- a/runner/runner_tests.c
> +++ b/runner/runner_tests.c
> @@ -1351,6 +1351,18 @@ igt_main
>  
>  			fclose(f);
>  		}
> +
> +		igt_subtest("metadata-read-spaces") {
> +			char metadata[] = "name : foo bar\n";
> +			FILE *f = fmemopen(metadata, strlen(metadata), "r");
> +			igt_assert(f);
> +
> +			igt_assert(read_settings_from_file(settings, f));
> +
> +			igt_assert_eqstr(settings->name, "foo bar");
> +
> +			fclose(f);
> +		}
>  	}
>  
>  	igt_subtest_group {
> diff --git a/runner/settings.c b/runner/settings.c
> index d18e55d1..25f248ef 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -679,7 +679,7 @@ bool read_settings_from_file(struct settings *settings, FILE *f)
>  
>  	settings->dmesg_warn_level = -1;
>  
> -	while (fscanf(f, "%ms : %ms", &name, &val) == 2) {
> +	while (fscanf(f, "%ms : %m[^\n]", &name, &val) == 2) {
>  		int numval = atoi(val);
>  		PARSE_LINE(settings, name, val, abort_mask, numval);
>  		PARSE_LINE(settings, name, val, test_list, val ? strdup(val) : NULL);
> -- 
> 2.26.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
