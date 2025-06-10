Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE672C5B552
	for <igt-dev@archiver.kernel.org>; Tue, 10 Jun 2025 10:54:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B1510E2C6;
	Tue, 10 Jun 2025 10:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lR13VWgf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894A510E2C6
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Jun 2025 10:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749552873; x=1781088873;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iQkZ4PO+QuxcO5NNvxOfO/azhIxqBeX+gyA0Eil9wRY=;
 b=lR13VWgfYJDiMpXUBo4xQy12FGFGC94908qU4uwmekPr8gsd1VlQsc8H
 CYaWQjioUNsDO45jlmxnm9qW83D7I5HeydCZSNoP9TR231Eoq8Qp9iVsc
 LwEWnRkux2YanbloHIEYz5RCTGg8WVcOZPeXnCwI21DCs3kimpi86xDLV
 9VUgVDp4bPKlxhBvJXC5Z9n2KRF2q88QvUnpCwfcDNziYF7hjUGhhFWYl
 5f2PMi4ZHAeyULu78v8dDaJATz5QpWV7HAFeNxQ6wA3g5RvKXAZXc+Kxa
 BCNRwW0PecmsgHEZUybdO3hdOtog9V65drns9b3DaDSG4yCV+tTGSGRVw g==;
X-CSE-ConnectionGUID: v/sX5aZCRm2Isz1bot2Ywg==
X-CSE-MsgGUID: 2dqBBjFoRzeR/hNqO6rxhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="50764007"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="50764007"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 03:54:33 -0700
X-CSE-ConnectionGUID: MfJNwMy5QUuaDN4LbVuy1A==
X-CSE-MsgGUID: 22O/YgVNTeeS+66x6yYQJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="169979180"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 03:54:31 -0700
Date: Tue, 10 Jun 2025 12:54:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org, satyanarayana.k.v.p@intel.com,
 michal.wajdeczko@intel.com, daniele.ceraolospurio@intel.com,
 lucas.demarchi@intel.com, francois.dugast@intel.com,
 rodrigo.vivi@intel.com, john.c.harrison@intel.com
Subject: Re: [PATCH v4 1/2] tests/intel/xe_fault_injection: Make pci_slot const
Message-ID: <20250610105416.xwcdgfsqrs27p2ov@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 igt-dev@lists.freedesktop.org, satyanarayana.k.v.p@intel.com,
 michal.wajdeczko@intel.com, daniele.ceraolospurio@intel.com,
 lucas.demarchi@intel.com, francois.dugast@intel.com,
 rodrigo.vivi@intel.com, john.c.harrison@intel.com
References: <20250606183519.78736-1-jonathan.cavitt@intel.com>
 <20250606183519.78736-2-jonathan.cavitt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250606183519.78736-2-jonathan.cavitt@intel.com>
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

Hi Jonathan,
On 2025-06-06 at 18:35:18 +0000, Jonathan Cavitt wrote:
> The pci_slot string is passed to multiple functions in
> xe_fault_injection.  It is also unmodified in those functions, so should

Fold line at 65 column, this could be changed at merge.

> be passed as a const.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: John Harrison <john.c.harrison@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_fault_injection.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 9fe6bfe351..7a14ad1729 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -228,7 +228,7 @@ static void set_retval(const char function_name[], long long retval)
>   * @xe_wopcm_init:			xe_wopcm_init
>   */
>  static int
> -inject_fault_probe(int fd, char pci_slot[], const char function_name[])
> +inject_fault_probe(int fd, const char pci_slot[], const char function_name[])
>  {
>  	int err = 0;
>  	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
> @@ -255,7 +255,7 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
>   * @xe_guc_mmio_send_recv:     Inject an error when calling xe_guc_mmio_send_recv
>   * @xe_guc_ct_send_recv:       Inject an error when calling xe_guc_ct_send_recv
>   */
> -static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
> +static void probe_fail_guc(int fd, const char pci_slot[], const char function_name[],
>                 struct fault_injection_params *fault_params)
>  {
>  	int iter_start = 0, iter_end = 0, iter = 0;
> -- 
> 2.43.0
> 
