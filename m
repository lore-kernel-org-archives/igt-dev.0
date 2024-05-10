Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDEBC25B10
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 17:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE2F10E061;
	Fri, 10 May 2024 17:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LnPphtua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9C110E061
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 17:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715362665; x=1746898665;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=V7pm26QPHwDw7ICavTiuma2Y43pfBAr7sd3LnTDeh+k=;
 b=LnPphtua8aDYd1Vvm/shAvB+ZDSJSsttyPVEDCskTDnNmTes1NQViO/6
 FjeytQ5HAffeyhO//3kxFfscGxoKz81rN/doyOTN589Orxf5glJXRurh3
 KPgx9MVl0qQnZmS6RNjHc8BLNdl0Cvjku1QPNhNgvRzkLwGxP8/ynFq0Y
 z4P61kFIcRJOfNE3A7Qb/vcy4ERt5yRsfgoqmZzZ+zA4opo+2VpqZ5At8
 z1DER4FW2OBFllUokwxXjMBv/jn16KM9NuQPjDNd6vbciCAMWNP5WDJph
 s07zM7rwdU9iODQ5lvNRcrSoeHzQc5k+Ui7QS/Duk5ZVO8Ar3MmgfCO8x w==;
X-CSE-ConnectionGUID: PT3QSsbFQuieBqfwWvIvCQ==
X-CSE-MsgGUID: C62pbI9uS6W+QqWOvwK4jg==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11218378"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11218378"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 10:37:44 -0700
X-CSE-ConnectionGUID: FLujJuYGQeauuQOkRWEOqQ==
X-CSE-MsgGUID: R6Lbk58RT++uLfcmoF5dsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="34330794"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 10:37:43 -0700
Date: Fri, 10 May 2024 19:37:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t] runner: Remove useless null check for delim in
 job_list_from_test_list
Message-ID: <20240510173726.sj6ckas5ijzbfyix@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Petri Latvala <adrinael@adrinael.net>
References: <20240430211934.349775-2-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240430211934.349775-2-gustavo.sousa@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Gustavo,
On 2024-04-30 at 18:19:35 -0300, Gustavo Sousa wrote:
> The function job_list_from_test_list() uses a while loop to read entries
> from the testlist.
> 
> The condition ((delim = strchr(binary, '@')) != NULL) checks if the
> current entry specifies a subtest. When no subtest is specified, the
> else clause will cause a jump to the next iteration. That means that we
> are certain any statement executed after that if block has (delim !=
> NULL). As such, all null checks on that variable after that point are
> pointless.
> 
> In fact, certain unnecessary null checks might even cause confusion to
> readers. One example is the block meant to display the "Unexpected test
> without subtests ..." message: it would never happen, since that
> condition is handled earlier in the iteration (i.e. the full set of
> subtests is expanded for that entry in the else clause previously
> mentioned). The following execution (done before this change)
> illustrates that:
> 
>     $ cat <<EOF > /tmp/foo.testlist
>     igt@xe_pm@s2idle-basic
>     igt@xe_pm
>     igt@xe_pm@s2idle-exec-after
>     EOF

I do not know if 'igt@' was always used in tests lists.
Adding Petri to cc.
+Cc: Petri Latvala <adrinael@adrinael.net>

Regards,
Kamil

> 
>     $ ./build/runner/igt_runner -d -m --test-list /tmp/foo.testlist build/tests /tmp/results
>     [36408.109043] Dry run, not executing. Invoke igt_resume if you want to execute.
>     Done.
> 
>     $ cat /tmp/results/joblist.txt | sed 's/^\(.\{50\}\).\+/\1.../'
>     xe_pm s2idle-basic
>     xe_pm s2idle-basic,s2idle-basic-exec,s2idle-exec-a...
>     xe_pm s2idle-exec-after
> 
> Let's remove those unnecessary checks.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  runner/job_list.c | 21 +++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/runner/job_list.c b/runner/job_list.c
> index 27cbb10bce56..aeabb59f49d3 100644
> --- a/runner/job_list.c
> +++ b/runner/job_list.c
> @@ -276,16 +276,7 @@ static bool job_list_from_test_list(struct job_list *job_list,
>  			 * specified, also start a new entry.
>  			 */
>  			if (entry.binary && !strcmp(entry.binary, binary) &&
> -			    (delim == NULL || strchr(delim, '@') == NULL)) {
> -				if (!delim) {
> -					/* ... except we didn't get a subtest */
> -					fprintf(stderr,
> -						"Error: Unexpected test without subtests "
> -						"after same test had subtests\n");
> -					free(binary);
> -					fclose(f);
> -					return false;
> -				}
> +			    strchr(delim, '@') == NULL) {
>  				entry.subtest_count++;
>  				entry.subtests = realloc(entry.subtests,
>  							 entry.subtest_count *
> @@ -303,7 +294,7 @@ static bool job_list_from_test_list(struct job_list *job_list,
>  
>  			memset(&entry, 0, sizeof(entry));
>  
> -			if (delim != NULL && strchr(delim, '@') != NULL) {
> +			if (strchr(delim, '@') != NULL) {
>  				/* Dynamic subtest specified. Add to job list alone. */
>  				char **subtests;
>  
> @@ -314,11 +305,9 @@ static bool job_list_from_test_list(struct job_list *job_list,
>  				any = true;
>  			} else {
>  				entry.binary = strdup(binary);
> -				if (delim) {
> -					entry.subtests = malloc(sizeof(*entry.subtests));
> -					entry.subtests[0] = strdup(delim);
> -					entry.subtest_count = 1;
> -				}
> +				entry.subtests = malloc(sizeof(*entry.subtests));
> +				entry.subtests[0] = strdup(delim);
> +				entry.subtest_count = 1;
>  			}
>  
>  			free(binary);
> -- 
> 2.44.0
> 
