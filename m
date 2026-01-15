Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C98FD44C48
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 14:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83A510E06B;
	Thu, 15 Jan 2026 14:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lwlWlF36";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD42410E06B
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768485835; x=1800021835;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=70WLWsmp8bzaswtj0JG6z1iSw+09eNR6p3A6FlpcWkE=;
 b=lwlWlF36t+/NViJFRY7eNAZ4Vh0befUDS86ASUeR0z11400xI8iuCLfU
 vtvhRojcYTgM7syo+aGpniQox7/ix2onPp6BgJ2I3LTxFRZBCTwqbUY+D
 tRQao/qxkAYFPCm+kFg4A9d314c+NK+MJ4b6lg56K/RAdXx1RuRAZGWRP
 htB1Jap9a8knKHSzt1Jm/lJzYWa9cqm7M0vCqtROR7xXWqdKZat/JVE4m
 wQduzMbsSCLUuI9ofaBiksc/yUDFdhziHHT+eAW7kn3YzN8nHCI81sHbb
 NS7lKKF9qvBL5joCE46SwJDJyLZ8vQGi6SaS4l9/eC3qSj4nd4VJWlPWu g==;
X-CSE-ConnectionGUID: qXEMZXRlQ6KXdM4eNT8mmA==
X-CSE-MsgGUID: a2TYZqCYTVyh7K3RHyYQMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="57346504"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="57346504"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 06:03:55 -0800
X-CSE-ConnectionGUID: c4JTWXJ1SVKIxhe7Blp4lw==
X-CSE-MsgGUID: oDRLB/xhRNuY6I2TwgM5Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="205019945"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 06:03:54 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 06:03:53 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 06:03:53 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 06:03:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZ9oU+0od1scqRZnOxRHj9DVuoCvlBVl2B6hRFkZqPUwjgB14niwGaU5FfUajS3tXe0hS8/PfWzX7e7r9+zYzLrbcecQ0naYp/cazR5Iik4h+QSRGFWGU3NbEpoOSwkrCySXFJnl64MtitupMM8e+nXgaEm30d30Jxo7pESu7sFqnJFXG81lZvIRJjrdMZ7IQ8VOOTT0iEqtsfaUBsPp/HD1iIaAhpGeMnnF4ICWcIaHx3YaW1Tqmq1SexaBuczPv+eZRuqgqGBcDFIORHmpjPPZ3hKcW3jR96SztJuo+9uLMRnDY4wc7nYez1CuI4tiw0nCvMeUe+fA5w2KmcwbTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LthBBglhBRyX52omHdqHJmm4MJF6aC95DvCFbA6MMAU=;
 b=ByjTgHZ9LC7QGk1fNGm7Gixs/f1dIXjZHu2QEE+bhTV57dES3OX3QOiUtpHrpHjCQusYf6SDmOIsvKs90qJBUknqcyBjqQNttE84+dlI5+vlvi+LSgiAYOalloxhWLax3CNA8j5qF7ywOwTf49RcKj1ku2CKDnKayP80Wj+GRntznIBx+SaAQDLAjqcUZPKzpxKMfESbCIkgOQATnc87o9/27VV6Is3amzbCvt6C+D4+CgHiih6swE55nMWHOiYhD5tJBJVnCGcdvXeDAXl8XqUe5ogLF+QJKz2LtM2fdeH6GTcw9l43NkJw7tNg8bNYIG0VAH0eFO/Uc/Q6T2GNnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7207.namprd11.prod.outlook.com (2603:10b6:8:111::18)
 by IA4PR11MB9299.namprd11.prod.outlook.com (2603:10b6:208:565::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 14:03:42 +0000
Received: from DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653]) by DM4PR11MB7207.namprd11.prod.outlook.com
 ([fe80::7806:5aac:a263:2653%3]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 14:03:41 +0000
Date: Thu, 15 Jan 2026 15:03:36 +0100
From: Jan Maslak <jan.maslak@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] lib/intel_device_info: Add missing flatccs
 flag for NVL-S
Message-ID: <aWjzuNoOvFYlvRsW@ART-DEV-395>
References: <20260115092155.114781-4-zbigniew.kempczynski@intel.com>
 <20260115092155.114781-6-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260115092155.114781-6-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: VI1PR07CA0242.eurprd07.prod.outlook.com
 (2603:10a6:802:58::45) To DM4PR11MB7207.namprd11.prod.outlook.com
 (2603:10b6:8:111::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7207:EE_|IA4PR11MB9299:EE_
X-MS-Office365-Filtering-Correlation-Id: f577bf39-6038-45f5-c225-08de543ee381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzU1aXB0MVdYa0lPT1dTYnhPczFRcGR4L2VuV0k1MnBxcUI1VVVrd2Zra1o1?=
 =?utf-8?B?VWFodXdrQkYvZUpxWGJ0K3hQamFad2phTXNQTzBpZGN6SGM1cTN2MkhjL05u?=
 =?utf-8?B?R3JXd0VDVWZCand1VnJCMFYvWmtCcUdvQzZnS1ovZ2VzZUU0Qk5hUEdVY2dP?=
 =?utf-8?B?Qi90aGRBMEY3dWVvZmhZRnFPdUtiQnhwS3A4OFR5Q1RGcjhVKzVDTnhkcFVH?=
 =?utf-8?B?VnBMN1J6Y25TSEU1K1ppaWtPcmJnaHd1SmRYcUlSWGtCcU9hdm8wcGVVQit0?=
 =?utf-8?B?SU5icklCRXNwZ3N1bCtwQmZkY1RsNU1VeGdiNitXdlhFWldDUFJsYjM4SjdC?=
 =?utf-8?B?N3JaRDIzVG9IU0thL3NWSmVHSmoxUy9jK0U1SURta1podlNpc0ZvWDV4bHlo?=
 =?utf-8?B?RDFUdjRvVE5xV2tCOEtMOHJaZ1dwa3VuTFVqSFJPaGpwY053SExRKzMxMWN2?=
 =?utf-8?B?SXcyVlFwNklwT3dWclZoRXgwZ3hIbHZIdTBueGYreUs5Z2ZJeld4VWx1MEFh?=
 =?utf-8?B?a3Zyd25UaEVyL2lDTjZNdXlxMi92di83R1RsV0VDZ3BaSUFwZ1BYSm9yM3Bk?=
 =?utf-8?B?czR4Qk9yNmovUCtJcUZRQlRWWllFWENPZFhtaExqOEh6ZTk1MlcvNlFsZHNT?=
 =?utf-8?B?UzBUa0J4NTJtYm5CWE9KM2N6bHZCZ294STdMT3JhcUpWaE9XOTNsMCtwRmRr?=
 =?utf-8?B?eW9RVnVoYllwWHdIUENVeUtnS1oyM0RJQXVGSUk1VmRMRVl4U2p6QXp4UWlR?=
 =?utf-8?B?eXEvVEFCcno2eDR4N0oxM1p3ckNiUXBoUU0vVTdQc0dMNDZhYmUyUVVjdzlh?=
 =?utf-8?B?Z1d2Z0UwZ2JHRGxXY1hLeUc5OGJxeGpWNzlXR2NFT0ZKcUFhUkw5N0dRbDE3?=
 =?utf-8?B?YVB5RUpDNDg4YWE2a3haUDdZSVhnaVVrcTFSL0MvOGdrVVRxUTBMMWtqZHBS?=
 =?utf-8?B?Qk9wR2R6Z1g5dzdXaXBtb3JSOWZrVjJXUUhHUXdtTTZudGNqRDFLS21kZ1Nw?=
 =?utf-8?B?YVY0UTNhamZYNGw0UEE2NVhTTnpYOFUraE9yTWtEdGJjRFhxbUR0Y09PZnhz?=
 =?utf-8?B?Zlc1bTF5aHJ6T3N3UkJCSkttT0VCbGJHci9ReWw5MnBiNW5qeGd2RUJ3MHZk?=
 =?utf-8?B?MkV3dklydmQ4UzNySHhaSzMxZy9LYk45M04wTkgrWFhtUUN4VXlodHY2N3hX?=
 =?utf-8?B?MUJzNFV1UCtZZTE5djkweHdmMWxqYWI2YWtRZjVZNWxvOVZjc1pSSUlwaDZ2?=
 =?utf-8?B?TCs0RkhFZFBrczZveXFMMnJTMGhYMkhTRWFZMmRvNGlNVm8zVDVaYy9Pdnd1?=
 =?utf-8?B?ZjJ6UmxGaG9MZE5lV2E4ZkwvRXNrUkJXNXFOSW9vb1dvN0x3Vk5WL0tBdGR1?=
 =?utf-8?B?Rmk2MHF2VS90K3dKNHpJRWdlVWNkUnVaTUVuRWM5M2lYR0YyMUE4VGN0eGZ1?=
 =?utf-8?B?ZnhGdlN0WjdZUVl0d0kwb2JRZWwrSmsyeGViOFZGODljaTQ4dWh3VjFuNHhY?=
 =?utf-8?B?bE8xRWtwOExuOTVlTjdVYjZzTXpCckw5c3FnakhtcXhCazFWZjFSZlM3Q0dQ?=
 =?utf-8?B?RmVtNmJRemVpQkNlamxIWDhoeDc3cVJUQXFCd2tGdW52MkkzeUI0YTJHdkht?=
 =?utf-8?B?TlNYd3BCaU1aNnVHTkY1Q0VuTktNeG01aGJYRVozamZ5ZWpQbCs2K0pzR3d6?=
 =?utf-8?B?aGRSL2hCVjVQT1VZYk9hRktwTmxWeWZ4RXNvVlltTUJRM1F4N05jN2p5U1ls?=
 =?utf-8?B?YmQrSDQwN08zZE1HT2dCYURpTnpvMm1zcUh2NVpIQUtPMkIrcDZoeGVJWGMv?=
 =?utf-8?B?RVB3aVU5Ym50a3BrUjh4RFNuT0wzazhKa29NWXE4ZVVRQzkzTTVqbmNmS0FB?=
 =?utf-8?B?b29aZEJYUjdGQlV0c0l0K1o5ZUV4VVJkR2RBTVR1dFhvYko2NFNVZ0FBMEdx?=
 =?utf-8?B?S0I5NnlUbGdlVlZVbjlQbXFNU0VIZlZjUVI0UU9QdnBacG1ZaTVGNzZDVm5m?=
 =?utf-8?B?V05BQTR4QTcvNmpQRnF6dXMvaHJaT0RMeERTV3lqams4aTJHLzVqbTlJSlJS?=
 =?utf-8?B?a0U2SDcvVnY4QlhYV05HUmNwS0J6ZTRDYnVDeEFwbE1EclErQUFsaDF0cUF1?=
 =?utf-8?Q?B288=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnQ2RzNmT1U4dTRCVy94c0pZL3dFT0dHU3VlZHdUL0V0ckw4Y0hNNWxjRGw5?=
 =?utf-8?B?M1gxYlFIMDBWRTFHK2NXakF1K3pWWTY0MWlXVXZRRitWanF3YTFQVnJFV0NK?=
 =?utf-8?B?R052SHltQnYwcVRlV1lTSmZRZlg2T3dhZ0JSS1ZsUHkvNWtFVEF1eHp2clBL?=
 =?utf-8?B?MnpOaXEvSThqSFMwSDY1QW5aNWdlWjVlczVyV0hrZ1BMOHFHNGlIeGJMZlJ6?=
 =?utf-8?B?YVJXaHlNKzdCUjZtUHE3R2hNQnBaN2pCdHB4ZjFwcXFtdTMwMk4xdEt1eE1w?=
 =?utf-8?B?MTU5VnJYak9MZkI5aHA2MmE5TUZNak5Cc05xdzJRT3FlODJtUGtNM0orTU5M?=
 =?utf-8?B?YWJCZnczK3R5YjJxM3d4WjVGTzF2T21KcTBhRm04dHNwV3cvbjNPR3lwVnRa?=
 =?utf-8?B?S1ZTUmgveGV5VEgwcEM4eWRGSFZRVEFCKzFnMmVsRmNZcHltYnJQa0xoaktk?=
 =?utf-8?B?Um5Sc3UwRDdsOUFlMWE3dUpRZy8yTnVMYnAyMEhiSTc1d1dtT01XRVB1bEZq?=
 =?utf-8?B?dHIxcHRuRHU3K1ZtSWMxQS9kQy9pRUtnRWJHR2RlUTdaOTN6bUU2MmtJNnBx?=
 =?utf-8?B?ZmJzYk1kaUdPVXEybkswSCtRbCthUjZ6Q1hURjBMRHZja2lSZEcrU1EzaWh1?=
 =?utf-8?B?a3cyTHA0NVYyMTBRaStqOVlKOXNzbERnZ0huVWdiTHVITzNpbFd2bnVEUkRk?=
 =?utf-8?B?d1d5RmhkY2JkdHNZQmdEMXVWd3Btc3ZoSG5ZcmtrR0ZlL0FGZndOZVZWVHRx?=
 =?utf-8?B?aG9LajFraytwWEs0S1lxQ21TeS9CcEE0M0J2SC9hVG45WDVEQVhSaVV5UUtF?=
 =?utf-8?B?VWpBaDZ1Rk5Ua25mVm5RaDljVk5FaXU2bWZFNUNkRjNBM1ZHNmhqVXlxUTZy?=
 =?utf-8?B?SjdYb2tmK24vOTltZmRrZmE1NkxhSlgyWTQ5bWtVRi9sS3RPS1daVTVXbks5?=
 =?utf-8?B?dnQxNGhjY254WHgvdWpmNHlxNUU1bGFYWStpeXZOeVBCd1BlZitMZlJ1RGJE?=
 =?utf-8?B?MzBFdVlLdXhZV0pka0F6eHFHRjltbnpmUExaN2lBUTVtYlk4K1ZYaFhBRDRZ?=
 =?utf-8?B?cUgvZ09SUVo2YWRBZnRBTlYxbE5Dck5haWwyRnA0U2xZSWhMUG8zQWJxZEZh?=
 =?utf-8?B?T3RxKzFDbWtIRldKSWtDWDRGU0E2VUFXaHFUVUdwdUxLUGN3VzB3d2dLOHdm?=
 =?utf-8?B?bHErOWI2RnlVRGpxZ3JYbloxcXVRRFBhVHhrc0NPNEZLMTFmaXJOYVRWd2tm?=
 =?utf-8?B?ekFWalhzcFpkYUc3Z3JlRVJNdGplWTRQZlkrRFM5emhwQTJXUTlqTDF1Tzk2?=
 =?utf-8?B?UjJ3RGIzeEdiYlpRNjljcG4zWmhCbUh2T1hOd2U4RURsN3JPZ3h2VWZseGRw?=
 =?utf-8?B?WHdrSndEcnZiOGx1djVnWmM3NW0yZGE4M0owTXlyNjhPNWJ6L0ErRWhQdzI3?=
 =?utf-8?B?b2srOE9ubFFQWW1oVWNKcjdIS1ZNbU5JbnY3S1pjVjVRYWE3NXQ1TU1LM3hO?=
 =?utf-8?B?QjhPc1UxaUVibHNIcG1uMzhBZzQrSnJ0ZnBRMHBNK3V0cm82YTVtUTc2M0ds?=
 =?utf-8?B?cloxQTQ2ZDhmZGVJOWNuVnBSQXVXTVNmekFIdVEydzZZOEtlM0ZvSWZwR3BX?=
 =?utf-8?B?OHYraklvVVVsOG94b01qdzZPcHYvSzUvbUU2ZmVmNEFSellVL0JtZE53MHJG?=
 =?utf-8?B?aHpZQUhMOGVxcFN4RmdOWnRiR3BObzJoTXZrR0xXYnJYaFNrRi9pNTdIZFox?=
 =?utf-8?B?NjVWMmlMb3dQODdNWjVhaE1HVnI3MjVVdVFyUVhidWNCRk41cHRpak1JdXV1?=
 =?utf-8?B?a1VlUjFlM1RsNVg0aE8rZ3Q4UnpyN1dsVzZJWnV4bjlRc3NpOS9ENmRKSDlR?=
 =?utf-8?B?V0g4TC9EMHpia29aTXAxTk4rbHVFSFV6WDJHQUY0RkNpdnR4VkREZkpMWVhV?=
 =?utf-8?B?eXU5bFNCNlNManMvM2w5Yi8reW50YzRlaWg4QTFkU0swem91VWFNN01Od3VG?=
 =?utf-8?B?Q2RHWTRhRWJHTWQ5RHZnVENCUkRFbmZ0WHBnREdaeE5mT3IyZVNMOVNCN2g0?=
 =?utf-8?B?WkJ0Smk3REU1TFNxZUFvVjlIKzBDM2NvN2NCMGpYK0FtK2JZSjc2eTVXRnVh?=
 =?utf-8?B?WWVjd2IwRStFTjdPLzNUSE5IN3dtellzMHZiVkR1dkY5K1k3NTI1aUNLdlFI?=
 =?utf-8?B?TkJ4MWpxVUtYQ0ZUemdndFF2SW5FOWhHZnVBc01tOGJjMkZybTNXTEFTMmtl?=
 =?utf-8?B?di9VblcxM0VUTHp0a1BJTjREVUhyTXRQSkk5d1UvVjdjd1ViS204ZUNRV3JX?=
 =?utf-8?B?cXY5SnA4aUE4MllOQktzN3JjRTdubG9CV25Ca2xhN2wwTmF3REtRZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f577bf39-6038-45f5-c225-08de543ee381
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 14:03:41.6162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1aTd4Tr6rkm8+PKrz3yie/FB5W6IfFgFeW4fxA/+eaBiI2QDHxiIYJlxW/5eItTP5VuUN/NbX6YGT7MN+FUWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9299
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

LGTM,
Reviewed-by: Jan Maslak <jan.maslak@intel.com>

On Thu, Jan 15, 2026 at 10:21:58AM +0100, Zbigniew Kempczyński wrote:
> Tests (render/blitter) which uses compressed buffer require flatccs
> flag defined in intel-device-info.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Jan Maślak <jan.maslak@intel.com>
> ---
>  lib/intel_device_info.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index 20147479a8..89fa6788f5 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -545,6 +545,7 @@ static const struct intel_device_info intel_novalake_s_info = {
>  	.display_ver = 35,
>  	.has_4tile = true,
>  	.has_oam = true,
> +	.has_flatccs = true,
>  	.is_novalake_s = true,
>  	.codename = "novalake_s",
>  	.cmds_info = &xe2_cmds_info,
> -- 
> 2.43.0
> 
