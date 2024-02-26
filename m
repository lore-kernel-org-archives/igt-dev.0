Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B88C48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 10:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F9910E6C2;
	Mon, 26 Feb 2024 10:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQmEHQ1P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A554410E6C6
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708942957; x=1740478957;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oNHdeUkv1N40+CG6NDGjZrweQMa0XiI0UjItl1Lm1iQ=;
 b=eQmEHQ1POgL4YXEH8smCFFZW+9n3HNcujV0hvXvt+ghK6aJZK/EX15/9
 iXCPvgi4PWp24rpMYyboPlrZPHyOlDlM5r+fH1mhQ4E5G/KyW6EQ9qi/w
 RVq8kjGMspOMEWxUy5DX3+1Gt9rQjxBX1lQkHSz27r86gYWFKz/M2g5Tf
 VMeConRSFnoU/UdkOGAxqtQOc7/NU0N88vZbI4nDikGINYvgwh53OyJiK
 kHVei5sekByl+ydc5qY9TlhgilhIVzmSDAhcqAxyL9UmumleQllTPqaVG
 tIvEEQNqsJPmqvlJ6b1lH82pj8ppIEeLMMvq0d3K8XaiyhE0aEstnzr5C Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3384249"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3384249"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 02:22:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6823449"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 02:22:36 -0800
Date: Mon, 26 Feb 2024 11:22:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH i-g-t] intel/xe_test_config.json: add sriov_basic.c
Message-ID: <20240226102209.gh5osbwq55dmwk42@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240222074337.173747-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240222074337.173747-1-mauro.chehab@linux.intel.com>
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

Hi Mauro,
On 2024-02-22 at 08:43:37 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> The tests there are currently not included as part of Xe scope.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_test_config.json | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
> index 3944a9c8028b..22b43ffac2e1 100644
> --- a/tests/intel/xe_test_config.json
> +++ b/tests/intel/xe_test_config.json
> @@ -2,7 +2,7 @@
>      "description": "JSON file to be used to parse Xe documentation",
>      "name": "Tests for Xe Driver",
>      "drivers": [ "xe" ],
> -    "files": [ "xe_*.c", "../core_hotunplug.c", "intel_hwmon.c" ],
> +    "files": [ "xe_*.c", "../core_hotunplug.c", "../sriov_basic.c", "intel_hwmon.c" ],
>      "fields": {
>          "Category": {
>              "_properties_": {
> -- 
> 2.43.2
> 
