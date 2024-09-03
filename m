Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B76CD343D
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 14:48:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C109410E03F;
	Tue,  3 Sep 2024 14:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kfe0aVPP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C91910E03F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 14:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725374885; x=1756910885;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=N+UCnYKt2q/giiPJmdoGpA93TDlXvWffEe1Nv+gFwyo=;
 b=Kfe0aVPPtPzJkrEpr6SCQC3lqHdvKX0kdeHgRz7Yoi8E0uyeDiXeQC8L
 Qbrl2bhbpSjW63kXczao2AKLExpQCZ1XBlCM2hwnhGYbwYVS1x4e++G9N
 6ssWsE5Pw+qkqCumo2y/z2QrX0DfC8PclIoqLgc+lJj9cMEsMvB5aWCj9
 z6FbVN1QGu3/h9OyJrLOQmx7CmknD0l7SfBKEp0dacceIMhe158PuJlC2
 V4cVdEXT/j3l1lV+3BPbWrv+Gbs5Lm94Gn+RmoooHWizonW3uaa4kpF1/
 U4YR9xsGDXLuoXihETMS2uULkbGYYF7gGRCmu6ALOzdHeV2BSMxDG6yOJ g==;
X-CSE-ConnectionGUID: Ub1V9dUbR3GeZxnALZJccQ==
X-CSE-MsgGUID: P5TUam9cRU2JgVpdDxjAgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="34641586"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208,217";a="34641586"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 07:48:04 -0700
X-CSE-ConnectionGUID: 6/AAkwlpTiCsjsr6DQuDXQ==
X-CSE-MsgGUID: Z3KvmZ3RQP+s/xLUXhzxAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208,217";a="69315287"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.245.80.70])
 ([10.245.80.70])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 07:48:03 -0700
Content-Type: multipart/alternative;
 boundary="------------CkiR0oOuJ1demm9I3Rk5KaeC"
Message-ID: <fdf77e79-3ab4-4209-93d0-d084f31cc27e@intel.com>
Date: Tue, 3 Sep 2024 16:48:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4] tests/intel/xe_exec_fault_mode: Don't return
 early
To: Nirmoy Das <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, Matthew Brost <matthew.brost@intel.com>, 
 Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20240829180051.3286-1-nirmoy.das@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240829180051.3286-1-nirmoy.das@intel.com>
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

This is a multi-part message in MIME format.
--------------CkiR0oOuJ1demm9I3Rk5KaeC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 29.08.2024 20:00, Nirmoy Das wrote:
> Tests that are causing pagefaults should wait for exec to queue
> ban/finish otherwise pending engine resets because of on-going
> pagefaults would cause failure in subsequent tests to fail.
>
> Not all execs will generate page faults and in such case reading ban
> property is not enough but the signal should either -EIO or 0.
> so read that instead.
>
> v2: specify timeout reason and iterate over exec_queues(Andrzej)
> v3: increase timeout
> v4: check for signal status to be -EIO/0.
>
> Cc: Andrzej Hajda<andrzej.hajda@intel.com>
> Cc: Kamil Konieczny<kamil.konieczny@linux.intel.com>
> Cc: Matthew Brost<matthew.brost@intel.com>
> Cc: Tejas Upadhyay<tejas.upadhyay@intel.com>
> Link:https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
> ---
>   tests/intel/xe_exec_fault_mode.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index 1f1f1e50b..fa050d0dc 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -329,6 +329,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   				igt_assert_eq(data[i].data, 0xc0ffee);
>   	}
>   
> +	if ((flags & INVALID_FAULT)) {
> +		for (i = 0; i < n_execs; i++) {
> +			int ret;
> +			int64_t timeout = NSEC_PER_SEC;
> +
> +			ret = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> +					       exec_queues[i % n_exec_queues], &timeout);
> +			igt_assert(ret == -EIO || ret ==0);

"ret ==0" - missing space.

Btw in theory we have n_execs * 1second  (128sec???) total wait time.

> +		}
> +	}
> +

If I placed change correctly in the code it could be replaced by chain:

if ((flags & INVALID_FAULT)) {

     // your change
} else if !(flags & INVALID_VA) { ... } Up to you. Reviewed-by: Andrzej 
Hajda <andrzej.hajda@intel.com> Regards Andrzej
>   	for (i = 0; i < n_exec_queues; i++) {
>   		xe_exec_queue_destroy(fd, exec_queues[i]);
>   		if (bind_exec_queues[i])

--------------CkiR0oOuJ1demm9I3Rk5KaeC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body wd-tech="true" spellcheck="false">
    <br>
    <br>
    <div class="moz-cite-prefix">On 29.08.2024 20:00, Nirmoy Das wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240829180051.3286-1-nirmoy.das@intel.com">
      <pre class="moz-quote-pre" wrap="">Tests that are causing pagefaults should wait for exec to queue
ban/finish otherwise pending engine resets because of on-going
pagefaults would cause failure in subsequent tests to fail.

Not all execs will generate page faults and in such case reading ban
property is not enough but the signal should either -EIO or 0.
so read that instead.

v2: specify timeout reason and iterate over exec_queues(Andrzej)
v3: increase timeout
v4: check for signal status to be -EIO/0.

Cc: Andrzej Hajda <a class="moz-txt-link-rfc2396E" href="mailto:andrzej.hajda@intel.com">&lt;andrzej.hajda@intel.com&gt;</a>
Cc: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
Link: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
---
 tests/intel/xe_exec_fault_mode.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 1f1f1e50b..fa050d0dc 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -329,6 +329,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				igt_assert_eq(data[i].data, 0xc0ffee);
 	}
 
+	if ((flags &amp; INVALID_FAULT)) {
+		for (i = 0; i &lt; n_execs; i++) {
+			int ret;
+			int64_t timeout = NSEC_PER_SEC;
+
+			ret = __xe_wait_ufence(fd, &amp;data[i].exec_sync, USER_FENCE_VALUE,
+					       exec_queues[i % n_exec_queues], &amp;timeout);
+			igt_assert(ret == -EIO || ret ==0);</pre>
    </blockquote>
    <br>
    <pre class="moz-quote-pre" wrap="">"ret ==0" - missing space.

Btw in theory we have n_execs * 1second  (128sec???) total wait time.
</pre>
    <blockquote type="cite"
      cite="mid:20240829180051.3286-1-nirmoy.das@intel.com">
      <pre class="moz-quote-pre" wrap="">
+		}
+	}
+</pre>
    </blockquote>
    <br>
    If I placed change correctly in the code it could be replaced by
    chain:<br>
    <pre class="moz-quote-pre" wrap="">if ((flags &amp; INVALID_FAULT)) {</pre>
        // your change<br>
    } else if <span
      style="background-color:#ffffff;padding:0px 0px 0px 2px;"><span
style="color:#000000;background-color:#ffffff;font-family:&quot;Consolas&quot;;font-size:10pt;white-space:pre;"><span
      style="color:#000000;">!(flags &amp; INVALID_VA) {
  ...
}

Up to you.
Reviewed-by: Andrzej Hajda <a class="moz-txt-link-rfc2396E" href="mailto:andrzej.hajda@intel.com">&lt;andrzej.hajda@intel.com&gt;</a>

Regards
Andrzej
</span></span></span><br>
    <blockquote type="cite"
      cite="mid:20240829180051.3286-1-nirmoy.das@intel.com">
      <pre class="moz-quote-pre" wrap="">
 	for (i = 0; i &lt; n_exec_queues; i++) {
 		xe_exec_queue_destroy(fd, exec_queues[i]);
 		if (bind_exec_queues[i])
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------CkiR0oOuJ1demm9I3Rk5KaeC--
