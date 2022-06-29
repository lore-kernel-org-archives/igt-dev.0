Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DF710E81A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jun 2022 16:30:42 +0000 (UTC)
Date: Wed, 29 Jun 2022 18:30:33 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Ryszard Knop <ryszard.knop@intel.com>
Message-ID: <20220629183033.30ca9b33@maurocar-mobl2>
In-Reply-To: <20220628094435.854519-8-ryszard.knop@intel.com>
References: <20220628094435.854519-1-ryszard.knop@intel.com>
 <20220628094435.854519-8-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 7/7] runner: Add help for the
 --environment flag
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 28 Jun 2022 11:44:35 +0200
Ryszard Knop <ryszard.knop@intel.com> wrote:

> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  runner/settings.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/runner/settings.c b/runner/settings.c
> index 1926e197..383e641e 100644
> --- a/runner/settings.c
> +++ b/runner/settings.c
> @@ -286,6 +286,10 @@ static const char *usage_str =
>  	"  -b, --blacklist FILENAME\n"
>  	"                        Exclude all test matching to regexes from FILENAME\n"
>  	"                        (can be used more than once)\n"
> +	"  -e, --environment <KEY or KEY=VALUE>\n"
> +	"                        Set an environment variable for the test process.\n"
> +	"                        If only the key is provided, the current value is read\n"
> +	"                        from the runner's environment (and saved for resumes).\n"
>  	"  -L, --list-all        List all matching subtests instead of running\n"
>  	"  --collect-code-cov    Enables gcov-based collect of code coverage for tests.\n"
>  	"                        Requires --collect-script FILENAME\n"

Looks good to me, but I would also add support for:

		-e 'VAR1=foo, VAR2=bar"

(see my previous comments)

Besides adding help, you also need to place unit tests in order to
check that the new command line parameter is working fine.
See runner/runner_tests.c.

Regards,
Mauro
