Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC65C5CFC1
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 03:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7730510E524;
	Fri, 14 Aug 2026 03:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E6mdDPAr";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013012.outbound.protection.outlook.com
 [40.107.201.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB8C10E524
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 03:39:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmK7aAgNPvnio4ggsvbyED/VBLKVcWz8lM2MqBeLyaeA5jyTvv9szWmIcnHgktL56StbF+I5OfKlKoWhYTi8UwvkNrjIniDFndcLAhZ4Jsrkk7lEjQm+bL9Tm3hZ5yPPlnsfq2YWyES+kiBplwSQsnQ77MxFsJfGHqq+Mhxv4xvJoLUolddlRaa+0eJNY+sG5z5zMDTSDFIqDuQp0+CwlmDH4Ux9l4DdDnrC/mR1xJKD7Z88F3BtQopzyRXc7uA1pigeXbQtX+JOraTolHae5HQkz7lDCr93AArZEniOHt6h0uK/OcgkDhPS6zWqopDQuh+rquui4adTu+KEH+HQdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eaXGBoEqbp4D2VDmpRDcBhWTcDhvjsxfrARKVI48X5Y=;
 b=wdBQ9ymEAjdluSGK4ArgNa8Yg1yQFFL59qayv1iJabbr8CIFwJ1Wvtyurkcf0C2qzAefw1Lq7HcAwbPDaWyJuOUrj1dl1iemkAYedK8rbDqcFrYd7QKmwDQZ2XpkFB8Vjja4pXA4Ri2pHQeJ2GQS3UU+yi+l15eDFLno/zPf3lGWSlqzsaCN2VgHaxsAuHzVtG7leHX1PHIrvM8Sk5C+apizZEfL4HRwOlV5FTTkcxaZmZ0EdRLJ64KgeUtkF/ja0+pxB1hlzZgjbqckfF9msiERfON5kBDcxjuRlH9BdIdeVoUpGeAa83iKtOVqv5p1PtscZIs0ZwHqc2pTlGHgmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eaXGBoEqbp4D2VDmpRDcBhWTcDhvjsxfrARKVI48X5Y=;
 b=E6mdDPAraRLYhvQ3dO1Bb1+XhEnkS6XpSb7Fy9ExFlYCQKbQ0IH0dEEME6llbFN0hABsepuLQbTsFlz2VUOndvkciZzUTdZBImcvLKqYQ5T2zBk5J5tG5qxtEKR549wnxQ6nIsnK/WfeNkSHQQcKUUBvmunpO8pqCjNM4O0JM7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MN2PR12MB4141.namprd12.prod.outlook.com (2603:10b6:208:1d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Fri, 14 Aug
 2026 03:39:16 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 03:39:16 +0000
Message-ID: <d0ba0615-8290-4d41-b249-038ecb4acc60@amd.com>
Date: Thu, 13 Aug 2026 21:39:13 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/6] lib/igt_kms: clear colorop-changed flag
 after commit
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>
References: <20260811143558.141813-1-mwen@igalia.com>
 <20260811143558.141813-2-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260811143558.141813-2-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0351.namprd04.prod.outlook.com
 (2603:10b6:303:8a::26) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MN2PR12MB4141:EE_
X-MS-Office365-Filtering-Correlation-Id: 90c9ffcf-7bf7-4f8e-1c3a-08def9b59d57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|23010399003|18002099003|22082099003|4143699003|56012099006|11063799006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: bT+VjbAh3m1CATrStvHTQwW7gKMEZlMu3kqMbJFmEDlzf7en3DM1Gcny6pLsYUQxj0PQhhTkeuuAFbPCFJ7QWVN1OS6+XfETCbKdbKFvTx27BM/LGQaS5ss6HK+2aBagWftYh9ETMHJWVzxY+oEXzVXydnc3xPISN7ovQ+cwP1IZUmo60EQDxXQaSRn8sU8jYxCr876qKVNkf0pegPzWPL2hxaAFZ85IN1v/zZZ9Zq/K2SpXS6oVXAuIRzg4FKTEpoe40yNjQ8KBt53Fhqrx1pDz0gObjjXIoeWK1SNFLOssbSAGisazCQFbRdjvgmRR8P2hXpbuIGnKmg+0ktxbSlTiMi5JGe7cDuCeHuXmrkLu3ImuscHWnw6aWqVxAUJuaFtj1z3d2Soh/zki3Zy4xbbZYsZAuJvkHqu7zEwfrvzXfH6tNtNUkH+F2m587L0dRn0NatlE7dfT74Qm4KtTH/o8MVE+DgPrYCT2kczpJx1/1thtngUJ3EyGUBtK92xtKA4SF6aXZMgMZWgdydNnBYlwGD47ZEQ/vC7lf4jtpzg6gS/op5ucAXpXB7DL/j2cqaxAR4wpx7igAkMYzB6oyank24HkAkfmzF0i+Lck5okSbvXt9VnjO0FUmmeHoPAC72rJp8c7B7Moy5jd4MxLedFsdnBddWopH3nViHoIfFw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHQ3bHhZYnRrclFFWGtjalIzT3BOL2FKM1VyL05nUXZhclVuOWpDM3JvMWVL?=
 =?utf-8?B?SUlid1VKSHVhcnFPMWxrbEFkNXliZkk0Ry9Ya3QxVndPL0tmN3RaNGxlT3Bt?=
 =?utf-8?B?WXdTV1hqeFcrN1QwRDFmTzRtV1RIaUh1R0xwZTZLTzIxMHE4RnNieTZUR3pk?=
 =?utf-8?B?ZXd2enRrVEFGWWZEMFZxZ0U3Qi9Ieng5bytwZmpsbzBwOFlqQVJ1SmxmMUgr?=
 =?utf-8?B?cjNJUi9OOFZCNlFpUS9OdlR6aURoWHNFNTZDelNNY2N6SUJ6NFpULzVhdjN4?=
 =?utf-8?B?Qm9kdVVJdUsvak5qZ2J0RkZaOUg3WTFZSzBOV3dDSWtWS1FCU1kvazJRRU1E?=
 =?utf-8?B?K1JFbWZ6NC9QTmM0eFo0R0F4TllMZmZXNmRXTlFnc1FVbEcxaHR0MWZ6RVpK?=
 =?utf-8?B?eUdGeERMc2h6ZWdpTEgrNWdFNUxzdnV4Q3hremw4cWNoV0hLZjNEWjhGSzRz?=
 =?utf-8?B?QmVzamE1NnJkNG5xMEc3N2EyTHZKT1VSQUhuZ2VQbGo4N0Zlc1ovTTNZK0ox?=
 =?utf-8?B?NmhrbWE1ZFVOVUx0Q3hsdUJwSS9SZDgvRS82dWFwMTNGTC84VVlDcm5OaFFT?=
 =?utf-8?B?WlRUUHl6eWJzSGZXK2hLL1gvKzhIbW84bWVJanoxazQ4OFo0bEFoL2dmc05H?=
 =?utf-8?B?OU1oUnJvSlQyTWxXRC9FQWVScnpkQjFFZitVbGZoSkVoRmc0YVFlSGMrckt2?=
 =?utf-8?B?MmdXN3A4bE5aYXAyZHJPNE5VWitNNGFkem9mbmY1QW5EdWM3N1lNL2EvdlVq?=
 =?utf-8?B?eTZJQ0xJbkkzUnV0TDVIZEVKY0svZlJqaFZVdUp0Mjk4Y1J5SWNldko0Rm56?=
 =?utf-8?B?OFlKVXU3c2phNXNQNGZLVHFZZzVaTXR0OTlEVll3NkdxVUVyZTRSbXZtL3lO?=
 =?utf-8?B?OWUrNWwwVFF0OHlqOFBvbnNPNnhZMVphYXFFdkJIRzhGYmFocUd0eHNPdFN5?=
 =?utf-8?B?SWtwbUpyYkRoSC9mWWZEWlVIM2NCT1pyZS9RWjgrMmNEUFNUanljWlBWQ3Z5?=
 =?utf-8?B?MmdDQjJCRVUvck53MHpYWExZd1dVZW9yNXpWeWxGTElzWlhGRkt6elVGbUky?=
 =?utf-8?B?ZUJ4MWZxTXRoODBFSmlQVGd4S05DL1ZjQmhXRlBoRUF3aHc2TDdLdUxtVFdQ?=
 =?utf-8?B?V2VRUnhNbHBDR2liYzZiT0dNQmpRSUlDU3RIcC9VUkZIQko0SkMxbWc5Q2tV?=
 =?utf-8?B?SWRIRXJXVkRRQXdKMGEzRHdaNHFxRndFYml5QWhWQ1V6eWhGWGFUVHBrMFZq?=
 =?utf-8?B?VkdNc0RZZGtKWUpiUVZBdzBrU1FCUnpiWU43ek05b0REazZvSUw1ekczRS92?=
 =?utf-8?B?ZkViVzNiTHM3dFdrcTZzYXU3RUkvTEN2Zk5hKzNnTDN0b0wzcUo5QVg5czJ3?=
 =?utf-8?B?WVBGTDFHeTRlYUp2RUwxdFdEWS9EdVM1NU5zUWFyZXFCMi9NVk9oejF2MXMz?=
 =?utf-8?B?NDlDRlB6Y2xQTm12UmU5TGpJbHFsYWJqWnErZDBvWG9lT2EweWE0MlhKK2x6?=
 =?utf-8?B?ZWpFNmptQm9nYzdlTU14d3hoRkpyQ1VnR25PVURGcisyUlkxV2xkN1hNZURB?=
 =?utf-8?B?VGpadVhXK0Q2SzVwcUJwdVNBdEdhZGRJM2JQc3E3NmVxSlVQNDV5L3k5T1Yv?=
 =?utf-8?B?aTRWMVF5a2tjODZjZUdLZEhLcHdtWGgyQ2RQVVFoMUl0LzN1U3R6eXh6NEJM?=
 =?utf-8?B?Nlc2dXJvVXVhd1VjQmRROGtXQVl4bnNVRTJselFWUGFscXZxcS8wRERhODhl?=
 =?utf-8?B?aHp4bVgrZzVCaHdwUyt2K3VYV3djVWx6bkd4ZCs1Tlk0Z0QrcUltWnFEL2pv?=
 =?utf-8?B?cytSSXNic0k3UmFhK2ZWOFI1dUFKd0o1VmxucnNKR1FjaURZNFI0SThFY1lP?=
 =?utf-8?B?S1JMU2lEcHBJOWkwSm9jcHJUYnI2K1YwVmFURTZQZ0ZSSmd5dkdBeVNjN3h3?=
 =?utf-8?B?ZnhYZnYvdWh0L2dtYzZQZjByTE8zRHNQbDdGUWd3eDE0Q0lRTVpGNTBUMHlL?=
 =?utf-8?B?bHBXNzF3emwvdUtnRWtjTkpWYlNza2hOdHNLS1IvaUduUk1sQW1wZ1BDSlBn?=
 =?utf-8?B?bmR1RUlCL0VwNXcrbk5MUTlVVkcrb21Kc1BGaEZoSTU2T0ZXamczU2Zadm41?=
 =?utf-8?B?SFhGWExlZjN5YmVza2M4dklTaWkyVWljVnlsNkc4aFErUHFHUGM0dXIzMTE3?=
 =?utf-8?B?UUFPQlRrTlhQdDZ2QkxvZHRheUx0UG1YVit6WnZGTzVBcVVxMTlLUlg3R1h6?=
 =?utf-8?B?dUUrNWZVcUFEQXVneURqNWFKWXprSWpnYWNnSDJSOUJXelAvVGJCSTI1TEZJ?=
 =?utf-8?Q?hRNSbKD+Klx6OEiXw+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c9ffcf-7bf7-4f8e-1c3a-08def9b59d57
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 03:39:16.0760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKp2EMmgt++XrYN4DU1x6RQSgAXPzs48CnYuSUckjVk9b2tHFiHMT4r5SV9u0AmcqLgts4SCaIAvkHYz7HBa4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4141
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



On 8/11/26 08:23, Melissa Wen wrote:
> Don't request colorop updates if there is no change in the atomic
> commit. It fixes atomic rejection after test skips that was caused by
> incorrect attempts of changing inactive colorop properties, since
> userspace can update only current active colorops or colorops that will
> be activated or deactivated in the same commit. Active colorop means a
> colorop that is in the chain of an active color pipeline, i.e.  the
> pipeline in plane COLOR_PIPELINE property.
> 
> Assisted-by: Claude:claude-opus-4-7
> Tested-by: Alex Hung <alex.hung@amd.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   lib/igt_kms.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 42cc7c3bd..1e3cea781 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -4862,6 +4862,7 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
>   {
>   	int i;
>   	igt_crtc_t *crtc;
> +	igt_colorop_t *colorop;
>   
>   	for_each_crtc(display, crtc) {
>   		igt_plane_t *plane;
> @@ -4891,6 +4892,20 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
>   				int fd;
>   				plane->changed = 0;
>   
> +				/* clear changed flags on every colorop in the assigned chain
> +				 * so already-committed property values aren't re-emitted on
> +				 * the next commit.
> +				 */
> +				colorop = plane->assigned_color_pipeline;
> +				while (colorop) {
> +					int next_val;
should be uint32_t which is used by igt_find_colorop().> +
> +					colorop->changed = 0;
> +					next_val = igt_colorop_get_prop(display, colorop,
> +									IGT_COLOROP_NEXT);
> +					colorop = igt_find_colorop(display, next_val);
> +				}
> +
>   				fd = plane->values[IGT_PLANE_IN_FENCE_FD];
>   				if (fd != -1)
>   					close(fd);

