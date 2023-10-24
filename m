Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2185110E3C6
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Oct 2023 13:51:10 +0000 (UTC)
Date: Tue, 24 Oct 2023 15:51:05 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Petri Latvala <adrinael@adrinael.net>
Message-ID: <20231024155105.60f3a741@maurocar-mobl2>
In-Reply-To: <20231020133041.58257-1-adrinael@adrinael.net>
References: <20231020133041.58257-1-adrinael@adrinael.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 1/3] runner: Normalize testlist entries that
 don't list subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 20 Oct 2023 16:30:39 +0300
Petri Latvala <adrinael@adrinael.net> wrote:

> As the syntax for "all subtests" and "test that doesn't have subtests"
> is the same, check the subtest listing when building the execution
> plan. Doing that makes it possible to still have "all subtests" in
> testlists (albeit not originally designed to support that) and enables
> blocklisting particular subtests.
> 
> Signed-off-by: Petri Latvala <adrinael@adrinael.net>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/149

That does the job.

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  runner/job_list.c | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/runner/job_list.c b/runner/job_list.c
> index e6ea83631..27cbb10bc 100644
> --- a/runner/job_list.c
> +++ b/runner/job_list.c
> @@ -230,8 +230,28 @@ static bool job_list_from_test_list(struct job_list *job_list,
>  			continue;
>  
>  		if (sscanf(line, "igt@%ms", &binary) == 1) {
> -			if ((delim = strchr(binary, '@')) != NULL)
> +			if ((delim = strchr(binary, '@')) != NULL) {
>  				*delim++ = '\0';
> +			} else {
> +				/*
> +				 * No subtests specified. Check
> +				 * whether the user means "all
> +				 * subtests" or if the test doesn't
> +				 * have any.
> +				 */
> +				if (entry.binary) {
> +					/* First flush the entry we're building for multiple-mode */
> +					add_job_list_entry(job_list, entry.binary, entry.subtests, entry.subtest_count);
> +					memset(&entry, 0, sizeof(entry));
> +					any = true;
> +				}
> +
> +				add_subtests(job_list, settings, binary,
> +					     &settings->include_regexes,
> +					     &settings->exclude_regexes);
> +				any = true;
> +				continue;
> +			}
>  
>  			if (!settings->multiple_mode) {
>  				char **subtests = NULL;
