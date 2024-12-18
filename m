Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C05E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 08:50:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BB410EAF5;
	Wed, 18 Dec 2024 08:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NoupBNMX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454BF10EAF5
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 08:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734511836; x=1766047836;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aiZ8DSCRkaVQukrJcldGXCu6Y67KKZbQEd5TE55yS4M=;
 b=NoupBNMXhlE69ljN4LDw7EDygkLYKyUAUUfOIcvKkPOIB/g4qp5SXyiH
 SFHZcb0c6H2uGkKFNDNs8t3zmol+z0wfHS1DYi/efKMkDQlLBEfBfKMPa
 YOUE1NGhpI7JM2lAK8g6BLqZhhvwNhKsmvtiHetTaf0+ppgk/JPrDt/nV
 x29VZSplFDxlXxqKXXoEm71ilz1Uwd1yW1YRZZlhYqybuUNhhtCT/pJLI
 ekQeP67YnimbE7KfWkjLvJ7CqcoGNcVI/O5n6BtVk88o2axWUqWoNxSWk
 J1PyQ4DQ6tSG9COzfBnASwxO/HzNmmOWcaenUifcQH4QxxmMAyeNXBMnq g==;
X-CSE-ConnectionGUID: LkVCqN2nT/aSoGkmYEgZBg==
X-CSE-MsgGUID: 4MVp6PhCRsiofKALzbiFdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22565097"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="22565097"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 00:50:32 -0800
X-CSE-ConnectionGUID: NbVi5uOsTqWKF0EyVrCsWg==
X-CSE-MsgGUID: LHs7MsIlQd237ujdatFFVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98616837"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.111])
 ([10.245.246.111])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 00:50:30 -0800
Message-ID: <3edc24a0-ce3a-4a99-9676-2dbc651fac79@intel.com>
Date: Wed, 18 Dec 2024 09:50:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 i-g-t 3/3] tests/intel/xe_eudebug: Add
 basic-vm-bind-ufence-sigint-client test
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, igt-dev@lists.freedesktop.org
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20241216134937.6136-1-dominik.karol.piatkowski@intel.com>
 <20241216134937.6136-4-dominik.karol.piatkowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241216134937.6136-4-dominik.karol.piatkowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Dominik,

On 16.12.2024 14:49, Dominik Karol Piątkowski wrote:
> Add a test that gives user fence in application, holds it, sends SIGINT
> to client and checks if anything breaks.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Thanks,
Christoph

> ---
> v2:
> - Cleanup after the client in basic-vm-bind-ufence-sigint-client,
>    merge the test into test_basic_ufence
> v3:
> - Get rid of goto
> ---
>   tests/intel/xe_eudebug.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 8965e7f9d..cce5b847c 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -65,6 +65,7 @@ static void test_sysfs_toggle(int fd)
>   #define EXEC_QUEUES_PLACEMENTS		(1 << 8)
>   #define VM_BIND_DELAY_UFENCE_ACK	(1 << 9)
>   #define VM_BIND_UFENCE_RECONNECT	(1 << 10)
> +#define VM_BIND_UFENCE_SIGINT_CLIENT	(1 << 11)
>   #define TEST_DISCOVERY			(1 << 31)
>   
>   #define PAGE_SIZE SZ_4K
> @@ -2135,6 +2136,10 @@ static int wait_for_ufence_events(struct ufence_priv *priv, int timeout_ms)
>    * Description:
>    *	Give user fence in application, hold it, drop the debugger connection and check if anything
>    *	breaks. Expect that held acks are released when connection is dropped.
> + *
> + * SUBTEST: basic-vm-bind-ufence-sigint-client
> + * Description:
> + *	Give user fence in application, hold it, send SIGINT to client and check if anything breaks.
>    */
>   static void test_basic_ufence(int fd, unsigned int flags)
>   {
> @@ -2164,7 +2169,12 @@ static void test_basic_ufence(int fd, unsigned int flags)
>   	if (flags & VM_BIND_DELAY_UFENCE_ACK)
>   		sleep(XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * 4 / 5);
>   
> -	if (flags & VM_BIND_UFENCE_RECONNECT) {
> +	if (flags & VM_BIND_UFENCE_SIGINT_CLIENT) {
> +		filter = XE_EUDEBUG_FILTER_ALL;
> +		kill(c->pid, SIGINT);
> +		c->pid = 0;
> +		c->done = 1;
> +	} else if (flags & VM_BIND_UFENCE_RECONNECT) {
>   		filter = XE_EUDEBUG_FILTER_EVENT_VM_BIND | XE_EUDEBUG_FILTER_EVENT_VM |
>   				XE_EUDEBUG_FILTER_EVENT_OPEN;
>   		xe_eudebug_debugger_detach(d);
> @@ -2843,6 +2853,9 @@ igt_main
>   	igt_subtest("basic-vm-bind-ufence-reconnect")
>   		test_basic_ufence(fd, VM_BIND_UFENCE_RECONNECT);
>   
> +	igt_subtest("basic-vm-bind-ufence-sigint-client")
> +		test_basic_ufence(fd, VM_BIND_UFENCE_SIGINT_CLIENT);
> +
>   	igt_subtest("vma-ufence")
>   		test_vma_ufence(fd, 0);
>   
