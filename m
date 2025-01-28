Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACA3C0218A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 22:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FF510E11F;
	Tue, 28 Jan 2025 22:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jwwt3JZS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8C810E11F
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 22:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738104820; x=1769640820;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DDjrfmJvi4k4ZueS2AZ4/gl3NHTZL4auOpYkLIsnj9M=;
 b=jwwt3JZSJIQwQX8cWJYIFN7fJytM35lOZBCLRWEI/W/JPp2YH3EDPVG+
 S+ULgd3UMCUFn47D1Z++t+z4Ykbt7HAx4vc1VD1ML/j1MGtwrdDf/l/nl
 r6iunBhKBQdoEoN+/dUf6IrHYcSgbWnoe/1yGrdDdM3PRSdXjSVYUjuSj
 t5+O0p8uHndzkxcern0p5wujZkX2oqtGiPAMjjso58CC/gRMPw7Z4vc+t
 CBowDcXt4LmUZT7J4JZUlGxoH7ZsKzPXc0GBVudfgUaBc2ZzOLHArxxRF
 oxlflGxf0kPCCnLShTvIk370Yx6XFBA0864qCPL/x1T0vlyInOmPDvTlz Q==;
X-CSE-ConnectionGUID: uIIyV478SeijRQY85ZhTMw==
X-CSE-MsgGUID: VHMORW2sSKmloPdCr8Dr9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="26206397"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="26206397"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 14:53:40 -0800
X-CSE-ConnectionGUID: zqASAELWSIKSFlj4CjnGYA==
X-CSE-MsgGUID: PweDCMgLTPmJR1BVlmc2Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="108836266"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 14:53:39 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 14:53:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 14:53:39 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 14:53:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=va6QN6cKxamkRS4uVSvbCePdQgu1EDk/NkLFGue/w34CKoVVGUw1ce7mrsLiSSGtZrZbyEyX56/AxyYGoloqSvfzOeUSBfOaNdryP51q0KM8kgeDxOXA+8aWK9hy4ZuiZT5jDsVuDiRZX2ghzAN0MpC1MYLjo6WNmjASKablg4zv9r+L6HWdVOrKP9l4zOUQZOFoIQ446y2LREihkE1USefK0D7BYypfvVBTX9sVZZLP56FUWTTAz0Wy/ex0GgEnv1KBNT6OALUBJpxTjJ+eR9h4PDOoiW2OCLQMPFMlpdEehYGadwOO8RAv7ZjFPbXMBkmqnZjUW3mRSsn46ilH2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5bvNJbbgppujDPksyRqugZJw5uqc6PBUd1woFDmdwk=;
 b=MPsgCuW20glSkbnU3n1/dFxyv+HZT+nPgdakFdfy+9GEzwXlOmFB8zxzqITYuxO/xHbn02KuPWHN73QsRAW6zaUJFfSnkP39wxtjhRXR3PgpFM/k9nEG0xf4/lNrTGkxyEHviQkp4xktkHKdt+T+Sby0jJjR/BFxld583b496w7fTwj7xiUl/w4NDJVmT8SAwkwGTAIuByXVU4J1J+5B2ufHG1ekH8aFZ3S5PlIx5BQaROagYGmxe9ETtMD3LufJtMgo2OFtCOrtNZrB2bo0FgyjZUEnWjEeuXGNEVKRlvP1GSgXHLqZg3vbWgQv3WMRDS/yr2X2w/s4BbUAFuHEPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SJ0PR11MB5868.namprd11.prod.outlook.com (2603:10b6:a03:42b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 22:53:36 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 22:53:36 +0000
Date: Tue, 28 Jan 2025 17:53:33 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/1] tests/intel/kms_ccs: add hiberbate test
Message-ID: <Z5lf7W74Ft0LVgz3@intel.com>
References: <20250128115558.1980222-1-juhapekka.heikkila@gmail.com>
 <20250128115558.1980222-2-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250128115558.1980222-2-juhapekka.heikkila@gmail.com>
X-ClientProxiedBy: MW4PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:303:dc::7) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SJ0PR11MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 19507e85-dacc-4c67-ebe7-08dd3fee9949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3CFEJOplRJpkCYVLpne5JgxSMMPJbTkVd5oxQT72dgyKTituqDrGzHS60PBI?=
 =?us-ascii?Q?sGus5vYjzhjUYUj3kYOx7EIxHAmT/MjfkxhTZLHqQolv0KQti0QCXuXjel3W?=
 =?us-ascii?Q?auGmjQdbMb28gU3l2oCUAFezi9i1/X+uamEMT5pO3/60RjuWSRby8I2myZhc?=
 =?us-ascii?Q?glug5cB6Ck6Wljk8LIGYGpSO1VZ5+Hgri1F4MUOOjKVMnJ1wj2cf5QvJgGRv?=
 =?us-ascii?Q?kILg/jV2a0Fl/VSeL8ldZp0e1aBFSKCH3ZR7Ivl57t71AEJH9ODrhO1HW8hh?=
 =?us-ascii?Q?47Fcy+S1rI7r3UCqREvpnjbb5ryHSGhZKrnPmQ8LiVbZ046E9umhiv3lDN7t?=
 =?us-ascii?Q?imSihTl1NDwL2kZEML5qYdSMGR5td/MaBAHX378bdgZadZJLd/E7wieVT0jq?=
 =?us-ascii?Q?DxvhWI1UK+y7Pnjr1kDEGPe7HyVtNZwnSR7D79zdvLEMPtHq2BbYgB5A8Wm0?=
 =?us-ascii?Q?j+AQ38AlgjIcxUU6msoXvVYMz0Unvr89Uog4wiCimDIqT4Y0/6yhlTn9VMVd?=
 =?us-ascii?Q?iaHrT3buNECYfbApXPcABV1rFEZ/+emo5MbySDvir71aH540g+RQWcHuuyG6?=
 =?us-ascii?Q?fjJKrTjJxqhyjUuA1DGxZncob2h9TDe6+KBoc8Ug12J5xtJUgr4FYBPIUan4?=
 =?us-ascii?Q?6UHlzoG9S8Ktw9Iy9l/4Q6bjykMTdYsXEkr+TVQzVtvhWWIhQQUBJ1tlDi7b?=
 =?us-ascii?Q?8KJpvaoDSc6UV0hZt0Qe874ttDKQUnFvDTi+ghAoPQWnc1SJ+eZWkCrxjSIF?=
 =?us-ascii?Q?RFejveIpT2Hl6K7AJ99KHSgI5zXc4/mMQjRZI0AaHYGcaSKJ4WN2c5RBcWsp?=
 =?us-ascii?Q?80uRC7VsHk6FyC2vfove0+Ilza0fwVo8ADLEVGkFVZj9RzfP0wYqcMA/J9rI?=
 =?us-ascii?Q?OFn38IoZRR601wpc5iLfTYo2GEU2ltaezPd4QCyhYWOjqkziwxpqDQ+HR04V?=
 =?us-ascii?Q?Dm1NT3SGQEpasG+puUKuhTnquzdAIxKVwddyjoL+1XyqmobsA+9FD/6rnA8g?=
 =?us-ascii?Q?B35RBHODgu+NxPDcJCLNVXshrr+IKG/OhnwtOButbAq/IG0CMC84TXBWetdo?=
 =?us-ascii?Q?+tiVkoGg/j+MtVVC5UzfARDUE5OLO7mH6K/i2mPY8xR+ZhgLn2SMsRU1tfEy?=
 =?us-ascii?Q?fBefy+NgxAXJb4EruI46GdNDlFF5iFhjY3hKE88C3uUbcJlsHy2fYMl6gFXI?=
 =?us-ascii?Q?OLng9siWBEDKVVlftwEfNSH3ZvQd3gAm2EQMT2fKtBMQ6itPgLMooJl//lG7?=
 =?us-ascii?Q?SQV79xxaotNxO6l9egUSEIF/g1hemjrDpfULZryJ839o5CVREJgBH5djWFik?=
 =?us-ascii?Q?ujQqBuO2g7xuQYwKv0d5RQCOnVaMMwEIRwXgRAzi+Lg156yVQFMotPRoqF6V?=
 =?us-ascii?Q?rpJ1MpohXEhgzScz1Upx6CgnkRSy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bve3ZTWl+5SSjIWcrgShA2CNN/krZOjv7PSa9ymo8uH2ksX6cx3gbPrPE9w9?=
 =?us-ascii?Q?k7J4sHsym1NGyu4qWOZ8s06qhgLU/EVz+lZqlU6mRq5EsKPFvQFQK9p8P15k?=
 =?us-ascii?Q?l/iAuRpRGxBk+1mZTH0yZS5GQwmt23QbCDVrnQh0yh1U1UHO6mNBC7QmqrL/?=
 =?us-ascii?Q?7mwfGiVjjEbWb4pW1kWa6clU8SFu5hL3o2nTYMAxpp3TgkQ1IQVbfoeoeKzA?=
 =?us-ascii?Q?wOC+TJbHlpSiRM+RBabmB8UZDc635+/iJZyFtClgA55JFi6oI2E5dnjtc1Gx?=
 =?us-ascii?Q?oUCjCo8nz/ai6GaJl3X552qoekn/QXO8CScKlWVmAyOWaxLyeRJsqdcHGfdS?=
 =?us-ascii?Q?zL0ATKlU5lROvBuOFqv1axnPwSqZiGjWEmyegbi4KnKH5yNBZV7zBKwJ5X2S?=
 =?us-ascii?Q?KXubTW4oadlVcs/GD1Ib2hVN1f65nNTQw9IOj3C9abZia5EC75PxotwXWCd7?=
 =?us-ascii?Q?xoebXIwDgY+2TsD5Is8d1Wb8Duv3U1XqceMbeVCatCnpOH8MuKlThfptsX/F?=
 =?us-ascii?Q?laZVnEG+xmTicsur1tXRlUboV3giB7sfSWt6W3F2nl8163ISKnfXdbEfuE69?=
 =?us-ascii?Q?xDW/IGMqHfGSBU9CETGClMXPZqvtJ7Lyzjl2UmXgKdZE5NLRGkPugGXGnG9q?=
 =?us-ascii?Q?bJwcFoSL62K/dzoH4SoGigpKpz/DWul1dI2u5bl/f0dHveE95LUxARsWEAMY?=
 =?us-ascii?Q?zNP2vEqwzcLOQBr7BiaCn/EOjgv7uzJ5eWWZnEZuKsvkWMa67Ltei3u2u9Cw?=
 =?us-ascii?Q?kTmxEY+JVadgVTEcvV4oQrS2WiFLYpTqrKTa3tJMam85JXJrcqtI6VS1e3lV?=
 =?us-ascii?Q?nTjnNOn/DBFOWWy6xfRJ1+GhS1LIycgEO7KzQjwbIrw1ugEYFElZqxfXaKsc?=
 =?us-ascii?Q?wwmjrKoY3xklgDN0DRKMlYfVj3Qh9GnOHnyy/b5B0qT1QejGhpLmwApax0Fz?=
 =?us-ascii?Q?Oq126cG20qLa+aV+NuqLeUScEFEbZN56covabSBekK2hyPlMLaRWkPqzqJcc?=
 =?us-ascii?Q?0eBJ3iJ8wCLL+iQ2olJ55Owrssgsbt/HtrVu/D+QDuI0wjwRPPESFRXnelDr?=
 =?us-ascii?Q?BBj6Npuo26lpg6hUjOrOlTBqtEv3K1qBzjoqnDxrGkCr+1er8EZKW2QbqAZI?=
 =?us-ascii?Q?F78YuTUBXrn+eCi+NWUVKpU/UHyODpnZ7WyFJTVpcEs1XVFnKpSGYQds6T9L?=
 =?us-ascii?Q?nnw6sbWOtcRTAHbDk/jOiAvbmmpSdtlIusKdFHQI4kBsuzav1jYsdmKOhWYy?=
 =?us-ascii?Q?ORPfy0BlNBJKYuMdJJFBIW86r4ThPDp19lyEELe8AWxo99y/qKjRAjQzyPX5?=
 =?us-ascii?Q?MkGxKm17kh3tofCcOhTaZF5WrSSW14cTBQkhcxb4svzqu8BX7hLjSi02ctFG?=
 =?us-ascii?Q?hWV1CvtBoxujvI+iJkDck5NQhzkyqAQmJW5q8sbTwp6jq2J8s8HnoQQI92RN?=
 =?us-ascii?Q?bAGt8qLr5UzhZdSrMFAU8mMhrEZpA094f7Urcu/qPZGteCTD9H3UfQQPn59p?=
 =?us-ascii?Q?KiKdOLIPrPaSfLYHd29M/qXmIZ4QvHkX3C2IkzQQabYfCQEt29Zs220POn3X?=
 =?us-ascii?Q?8z2qiyyy/SgcyPupAp8pgy6go+IlCvByyynjA30rg0dC8NVwy+oiAxMCvURg?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19507e85-dacc-4c67-ebe7-08dd3fee9949
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 22:53:36.5575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q02sbXpuSGnggKF14B9HOuAdmN2i5jpeRxjJso1PUFGVZiDynhqHs7jW8B4pspvmAJq9VMpQ9kwEc4SxhGlUgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5868
X-OriginatorOrg: intel.com
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

On Tue, Jan 28, 2025 at 01:55:58PM +0200, Juha-Pekka Heikkila wrote:
> Add hibernate test which bring entire system down for short
> hibernate. This mode is added to suspend tests to be run
> manually with '-r' flag because this is not ci friendly test,

hmm... why not '-f'?

-r won't get confused or accidentaly used since we have --r as an
alias for --run-subtest ?

But well, let's move ahead and add some option and you decide
the flag...

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> on hibernate ci would lose connection to the hibernated box.
> 
> This test is written against Ubuntu distro relying grub
> configuration found there.
> 
> For this test to work kernel resume point need to be set, from
> kernel command line is checked if there is found something along
> the lines of "resume=/dev/nvme0n1p2" or so to verify hibernate
> will be successful.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/intel/kms_ccs.c | 176 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 173 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 3e9a57863..8be3c063a 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -190,6 +190,7 @@ typedef struct {
>  	bool user_seed;
>  	enum igt_commit_style commit;
>  	int fb_list_length;
> +	bool do_hibernate;
>  	struct {
>  		struct igt_fb fb;
>  		int width, height;
> @@ -271,6 +272,162 @@ static const struct {
>   */
>  #define MAX_SPRITE_PLANE_WIDTH 2000
>  
> +
> +/**
> + * check_hibernation_support:
> + *
> + * Return: True if kernel is configured with resume point for hibernate.
> + */
> +static bool check_hibernation_support(void)
> +{
> +	int fd;
> +	char buffer[2048];
> +	ssize_t bytes_read;
> +	FILE *cmdline;
> +
> +	/* Check if hibernation is supported in /sys/power/state */
> +	fd = open("/sys/power/state", O_RDONLY);
> +
> +	if (fd <= 0) {
> +		igt_debug("Failed to open /sys/power/state\n");
> +		return false;
> +	}
> +
> +	bytes_read = read(fd, buffer, sizeof(buffer) - 1);
> +	close(fd);
> +
> +	if (bytes_read <= 0) {
> +		igt_debug("Failed to read /sys/power/state");
> +		return false;
> +	}
> +
> +	buffer[bytes_read] = '\0';
> +	if (strstr(buffer, "disk") == NULL) {
> +		igt_debug("Hibernation (suspend to disk) is not supported on this system.\n");
> +		return false;
> +	}
> +
> +	/* Check if resume is configured in kernel command line */
> +	cmdline = fopen("/proc/cmdline", "r");
> +
> +	if (!cmdline) {
> +		igt_debug("Failed to open /proc/cmdline");
> +		return false;
> +	}
> +
> +	fread(buffer, 1, sizeof(buffer) - 1, cmdline);
> +	fclose(cmdline);
> +
> +	if (strstr(buffer, "resume=") == NULL) {
> +		igt_debug("Kernel does not have 'resume' parameter configured for hibernation.\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +/**
> + * Ensure_grub_boots_same_kernel:
> + *
> + * Return: True if kernel was found and set for next reboot.
> + */
> +static bool ensure_grub_boots_same_kernel(void)
> +{
> +	char cmdline[1024];
> +	char current_kernel[256];
> +	char last_menuentry[512] = "";
> +	char grub_entry[512];
> +	char command[1024];
> +	FILE *cmdline_file, *grub_cfg;
> +	char line[1024];
> +	bool kernel_found = false;
> +	char *kernel_arg;
> +	char *kernel_end;
> +
> +	/* Read /proc/cmdline to get the current kernel image */
> +	cmdline_file = fopen("/proc/cmdline", "r");
> +	if (!cmdline_file) {
> +		igt_debug("Failed to open /proc/cmdline");
> +		return false;
> +	}
> +
> +	if (!fgets(cmdline, sizeof(cmdline), cmdline_file)) {
> +		fclose(cmdline_file);
> +		igt_debug("Failed to read /proc/cmdline");
> +		return false;
> +	}
> +	fclose(cmdline_file);
> +
> +	/* Parse the kernel image from cmdline */
> +	kernel_arg = strstr(cmdline, "BOOT_IMAGE=");
> +	if (!kernel_arg) {
> +		igt_debug("BOOT_IMAGE= not found in /proc/cmdline\n");
> +		return false;
> +	}
> +
> +	kernel_arg += strlen("BOOT_IMAGE=");
> +	kernel_end = strchr(kernel_arg, ' ');
> +
> +	if (!kernel_end)
> +		kernel_end = kernel_arg + strlen(kernel_arg);
> +
> +	snprintf(current_kernel, sizeof(current_kernel), "%.*s",
> +		 (int)(kernel_end - kernel_arg), kernel_arg);
> +	igt_debug("Current kernel image: %s\n", current_kernel);
> +
> +	/* Open GRUB config file to find matching entry */
> +	grub_cfg = fopen("/boot/grub/grub.cfg", "r");
> +	if (!grub_cfg) {
> +		igt_debug("Failed to open GRUB configuration file");
> +		return false;
> +	}
> +
> +	while (fgets(line, sizeof(line), grub_cfg)) {
> +		/* Check if the line contains a menuentry */
> +		if (strstr(line, "menuentry")) {
> +		/* Store the menuentry line */
> +			char *start = strchr(line, '\'');
> +			char *end = start ? strchr(start + 1, '\'') : NULL;
> +
> +			if (start && end) {
> +				snprintf(last_menuentry,
> +					 sizeof(last_menuentry),
> +					 "%.*s", (int)(end - start - 1),
> +					 start + 1);
> +			}
> +		}
> +
> +		/* Check if the current line contains the kernel */
> +		if (strstr(line, current_kernel)) {
> +			/* Use the last seen menuentry as the match */
> +			snprintf(grub_entry, sizeof(grub_entry), "%s",
> +				 last_menuentry);
> +			kernel_found = true;
> +			break;
> +		}
> +	}
> +
> +	fclose(grub_cfg);
> +
> +	if (!kernel_found) {
> +		igt_debug("Failed to find matching GRUB entry for kernel: %s\n",
> +			  current_kernel);
> +		return false;
> +	}
> +
> +	/* Set the GRUB boot target using grub-reboot */
> +	snprintf(command, sizeof(command), "grub-reboot \"%s\"", grub_entry);
> +	if (system(command) != 0) {
> +		igt_debug("Failed to set GRUB boot target to: %s\n",
> +			  grub_entry);
> +		return false;
> +	}
> +
> +	igt_debug("Set GRUB to boot kernel: %s (GRUB entry: %s)\n",
> +		  current_kernel, grub_entry);
> +	return true;
> +}
> +
>  static void addfb_init(struct igt_fb *fb, struct drm_mode_fb_cmd2 *f)
>  {
>  	int i;
> @@ -839,8 +996,17 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
>  
>  	if (ret == 0 && !(fb_flags & TEST_BAD_ROTATION_90) && crc) {
>  		if (data->flags & TEST_SUSPEND && fb_flags & FB_COMPRESSED) {
> -			igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> -						      SUSPEND_TEST_NONE);
> +			if (data->do_hibernate) {
> +				igt_require_f(check_hibernation_support(),
> +					      "Kernel is not cofigured for resume\n");
> +				igt_require_f(ensure_grub_boots_same_kernel(),
> +					      "Couldn't find correct kernel in grub.cfg\n");
> +				igt_system_suspend_autoresume(SUSPEND_STATE_DISK,
> +							      SUSPEND_TEST_NONE);
> +			} else {
> +				igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +							      SUSPEND_TEST_NONE);
> +			}
>  
>  			/* on resume check flat ccs is still compressed */
>  			if (is_xe_device(data->drm_fd) &&
> @@ -1044,6 +1210,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
>  		data->user_seed = true;
>  		data->seed = strtoul(optarg, NULL, 0);
>  		break;
> +	case 'r':
> +		data->do_hibernate = true;
> +		break;
>  	default:
>  		return IGT_OPT_HANDLER_ERROR;
>  	}
> @@ -1056,9 +1225,10 @@ static data_t data;
>  static const char *help_str =
>  "  -c\t\tCheck the presence of compression meta-data\n"
>  "  -s <seed>\tSeed for random number generator\n"
> +"  -r\t\tOn suspend test do full hibernate with reboot\n"
>  ;
>  
> -igt_main_args("cs:", NULL, help_str, opt_handler, &data)
> +igt_main_args("csr:", NULL, help_str, opt_handler, &data)
>  {
>  	igt_fixture {
>  		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> -- 
> 2.45.2
> 
