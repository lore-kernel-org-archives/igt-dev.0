Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2E5D3A66D
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 16:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2722E10E29D;
	Tue, 29 Oct 2024 16:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J2KN+nck";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDF810E29D
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 16:02:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDAdkLFkjPJYHEZrWiasn1A6TVXFKQ1HAzuwTXDu8o/Ld27LMZ3MFrARYwHHa582yuxQW3MROdUkGPRJNp6voVi3Vxt4CgwtZB1vBySbPkUxKSGlCGgMHKuMxmlkX/DDrReVtHZgO7F8XFb/HmFf80y0AgyhQRCS+XpYGTCWQAAtVH5NSfmpV44esCdEJMbYqS0d4HPGdnaNG17sSuVpQXFChJNa9FmT+DDHfnBdBOyQFWxUsT8oYaiEDpE03Y1gkYx+cPX2xdbDCU7O6V0JbxuRQG3DOoNliVhpS1lMdweXbimtLIhx2grHfH+aJY0qAB0Os1gmsHJmVzrKmU6HZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ObAZLrNeQtJJYe5kSx0TWPwBl6v8GnTUc+knHzs4wM=;
 b=l9NvDG60udAhAZuOLIwz45AHAxD/YaoKgH4Dpe12ht2hNj20GFN0RGaFwpC5WH9DpmaMS5wP2J8nkzhMTPhE8f+LAqUQK4KTSOqlXcxdUWGOKt9Sy6LJ/RwS5KOjbgDUgY/JPrvGjcQAYWs2OrJ7SSedknF0fEgriX2AWrrUmrpf7pftKDr+T6bUf+EPZxhhuc50tMvwGbcxW8Jodw1V4AJ6mJLKqkgOB/+DUCihVkoiCnARQsXdQ87oq7ynrZ4ZjP9hAR2MGXqXVtMvIm78/b2fbWc3caw4XxCLJmhULVNgiMRuISw7IfWxiM5JmYxT2CxpV0K0ziAcToEUOPx9eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ObAZLrNeQtJJYe5kSx0TWPwBl6v8GnTUc+knHzs4wM=;
 b=J2KN+nck9XOmWiIFVAtTaLT/mloMgQuSnkm67vmwNQdS2YA0Oxg7kvK7xt+Kwm1q9hfIP/2MYxx80Vg8TX7bJXLqKz93ZpeOPwFOHw25ZdiScA2QCvPB2wFtXLRVRWFBVMVsj2t+wLnW92Ljf3UKY+ShIEenAZPTGhlKs0nZS6A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by BL1PR12MB5923.namprd12.prod.outlook.com (2603:10b6:208:39a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 16:02:29 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e%4]) with mapi id 15.20.8093.021; Tue, 29 Oct 2024
 16:02:28 +0000
Message-ID: <f74ca930-3179-4898-948a-6a0ca7a0e52b@amd.com>
Date: Tue, 29 Oct 2024 10:02:26 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] tools/amd_hdmi_compliance: Fix atomic commit failure
Content-Language: en-US
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, mark.broadworth@amd.com, sunpeng.li@amd.com
References: <20241024210345.511501-1-alex.hung@amd.com>
 <20241024210345.511501-2-alex.hung@amd.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20241024210345.511501-2-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTBP288CA0012.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::25) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|BL1PR12MB5923:EE_
X-MS-Office365-Filtering-Correlation-Id: 01a4e8bb-7b26-4e37-81ee-08dcf83316ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEx4OUV3R1VKVnpGWHBPTXFaWStUYWRBU0dwdG9zU3NMdkJpZUZ0eEs5TjVV?=
 =?utf-8?B?SDdhU0hhTGhBTUI4cHZPbnpJMi9ZNnpqd1RXTFJjSnhnM1NVSHBrdlFGOWhi?=
 =?utf-8?B?bW5ta3BsL0tIdTMwUEJ0Z2tpc1gyekV3VGRiQS83OTMvelpQZHpwOEhBbTJP?=
 =?utf-8?B?RFpZaFA2b2dyK0JuSVFZVm5nbHZqc3FsRnFFM2pyWDVNOGxYUHBxbmhvdXcw?=
 =?utf-8?B?THBhOWxpaVVlTEdFQkJqejJXN0tjU2dwSjhWV3dVMmp6aFc1ZGhiYzFPbnBw?=
 =?utf-8?B?WjVmWlVFKzFYcGRxb29rUjdBS3NXdUpUMnhBNkFTVFRObW9SMnR5bEg1MFRS?=
 =?utf-8?B?UXdBbURhc0ZKTUhyd00vcDB5bHUrUTR0Z1NteXJLMkRaVWM3eFdPMmg5T3Bl?=
 =?utf-8?B?Tys0VnZJOCt5ME83SEh5aEloNTNTZ2lVSHV5aGducUJSUkxSVm1Fa0pVbXBQ?=
 =?utf-8?B?dDVqWVU5Ukp2S2NTMUVrV3RpWC9QTUtSQjRJRU5pNVZOaVlQNENXcWUybjFY?=
 =?utf-8?B?cm5tUUNBVjNmdkdLd1RQOEp3ZG5XWGtuN2tnNExUQVhVVitudE14cklGdmhz?=
 =?utf-8?B?QzdzU3p5NjNVMUEya3psWE80MTh1Rk1UelV6R0YrbWJZb1ZNUlYvZWNnNjZk?=
 =?utf-8?B?NjhEN2x5UTJnNk1oRTVXN0dKN2hLcDZCQi8vb3dMVlBVZ1hqZndjSUluRVN2?=
 =?utf-8?B?NTM3cFVwTjJQcnpzZ1ZJUEZWMkpGdXliWThYTEo4MnRIbDQ2Y3I0bUdKYjNU?=
 =?utf-8?B?TWVhVVp3aGtib2tYYitveVZDdkttTEM2TCt4VWpiblVZSGREdjUyeHBuSjEw?=
 =?utf-8?B?UmNxNzJXWW0rM0lCU08ycEJjKzk2cFMxUVRGQXZobzhnNmI0U2FScDRFc2FE?=
 =?utf-8?B?U1VvWlVscUJCSG5TR3RZazNDU0p0V2prMU41Wkx3VDhDYkRUV2diOE15MStw?=
 =?utf-8?B?bE9nNmtmbEk4Z293NGFUR2dlTDlaZ2VlQkx4M1RpTmh3MHhEdHN3MlZtTE82?=
 =?utf-8?B?d1BYNkJHdXJLaW5RbG0yTVI2SFByZkxtZnVjeDF5aHIyeFdRSE9POHZ2NFhJ?=
 =?utf-8?B?RVA2UDFrSmFGeHhlQy9CdjdBQVpGeDVDeFdWNUlrNmVnb2xzWDdhMWpxUThG?=
 =?utf-8?B?alVqQlRzaGxWV2hJNzRkaEdsRUpaaXBqMDJzQU9MeXJReURqcHU2a2MxYnc4?=
 =?utf-8?B?enBVRzRaTUR2Nk5TaXVJby9pMDFVY3RvOVJHZ2JTNWpBWUNEaDNSTjY4VGU2?=
 =?utf-8?B?UC9QWkNscmlyZG1xY21QMXYwekdmYjBLVEQzbmZNRnBHWWw4RXhJaERiNUJ4?=
 =?utf-8?B?VER0SXRVdVl5UmRBT3Z1R1o1aW1EZ2djMnU2aGJwY0xDMWtnd1BJSmFJcUh0?=
 =?utf-8?B?MVdQMHFZU29xVVYwVXRuMTFjamZGcTVEL2Y0R0UxSzlVajZXWHVHdzVBK0Qy?=
 =?utf-8?B?VmZ4anBoaGVmM2grajdZZkpwU1BISVdqM2ZaMHNhc3lkWlZLKzVYQUU3ZTRx?=
 =?utf-8?B?L1BKQ2ExSm93Qm9VU0xHRWp3RU1RbWtYOVB0WnZCeFNtNHVKSkx6RjlVdkg1?=
 =?utf-8?B?VVdUQjh0aTc2S28zc3hVV0V1Yzd2WFVtSmdUM09aalpHZWo3bk5Kcll3cTFC?=
 =?utf-8?B?NFNmL0ZpdGxFaWJhN3ZRSVcxOThzWGFEQ253ZSs2TmZyMnkxSDBiYUM4V2JJ?=
 =?utf-8?B?RnZZdDRaKzY0NTZWNnJVeXBOb0xFbUJvNENIYjdSMXo3MWhKOUJWU1VWYzZ3?=
 =?utf-8?Q?nHHS0C/0UniuSFOreIZRLKnjxd0/sb5V92v3ocO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anBiS2svUlM5eEpyZXRPVjIyMlQ0L2JTTDJuWi9xU0VPYUlwcUx4aklTZVlm?=
 =?utf-8?B?QzNxNllSb2p5SmdGa2xWVHBNWlBUaWt4Vm9MM0hLYWRsbHVOMm5pNXZBelZx?=
 =?utf-8?B?YWlCckt0RmJzSVgrWUFmZlR6c3laSHR5bjh4VlRZc3g2NjF0MXlIODVxVTZn?=
 =?utf-8?B?ZlJZVTZJRndmY1FHdTVhcTA1Zk5JcVhDamNvWWE3ck9vLy9vdFBhK1JQRC9X?=
 =?utf-8?B?MnNmRWlSdVpkRE1md2xjbmtuZGxJdEgxZ1YvMDJtanZTRUZmVjNBMUk3YStJ?=
 =?utf-8?B?dmNuT0s4eHFIN0V0aFo4MHE3S2pWSVpyYmFoaHNaRG9DcS9WdFZ0QU0wUExn?=
 =?utf-8?B?ck1qT0ZFK2d6YVJmalVGd24zV2dkYXFCbmY1djEwNHJiN2h1d2g1bnovamRj?=
 =?utf-8?B?VWJBdVZHazljYmRXejJEUzZmVElXZDBiaGs0aVdaSWlIeUJHdEhMWDdpV3Ux?=
 =?utf-8?B?QjVDemdyTnBMUTdVZG5FcVkzbzIxQ2t2dXU3VEFybXAzUndRbnVqNWlzaElE?=
 =?utf-8?B?eWVxK2xzTGdxV0J4U1lwdUFZSXZhNkN0KzZHQi9xeisybFVzV051TzhBQ3g1?=
 =?utf-8?B?NDBEdHA1d2FQanpLdGZxWno4UnE3Wjk1RzNWUWNrVHBrRnR3TEZQRUtadXlI?=
 =?utf-8?B?NlBRTFFNS0hDQkFXdFZCaHUrR0tMY3EzcXhlbHozS0Vsck8vM3VjcDZzY2dI?=
 =?utf-8?B?am5ESVhSVE9Uc1N3cDIwWXR3L3lKOUtVU1R2VzUxRDk5NHNNdFFlUEpNMnlQ?=
 =?utf-8?B?emtvU1NsYjcxWHIvKy9FVmMxUFltM1o2T0RlL2duTVB5V3QxWm5kUEVNSXox?=
 =?utf-8?B?U3crdXMvMDZ0OGc2OHNHL3VjaDBudTdiRlV1MURSMENYNldsaml4SEozTjlm?=
 =?utf-8?B?QXdBTVBFeHp6WkE0WWlyaHkrRWZmdzVYc2JnSlgvazhjUHJiRW5IR0E1SU1Y?=
 =?utf-8?B?Qk9MNGY1eVZDb3cvVytkbUx0UVBnQXZ3VHFYQ2d2WjlVaHAwWkc3ODVxOHFC?=
 =?utf-8?B?MlNvamlrbTNkMlVQOEFCTzN4TXFzb1Y4cUxDc0crWHZ4SGhZc1FSQUlSZWdP?=
 =?utf-8?B?elVIcXNBd05Zb0taTHFmQUtGWWh2ajRQZFgyZlRxYVpJRkFHdkk2MUdNL3l4?=
 =?utf-8?B?dk1BSmxnSldRdmlqZnZTcnBKS1MxcTQ1UVl2QXMxdXE2NGUwUE9qQ2l5VlEz?=
 =?utf-8?B?TXBzUnNtemcyUzRFMnM2NlAyZTlqQzRXdkJ1N1FndW9TdGJ3czIwcHNoMjRt?=
 =?utf-8?B?VmlleTQrQVNTNmN0RUovaVJDeVJWN2J6ZkhPRkFMeElZenJlRUNKeUQ4d0xE?=
 =?utf-8?B?eVpFOEx1aHVUdlRlWGdvYmpJUVpBMVZKb29Za3NMa0Y2MVJ3UmhEZVFDYXVj?=
 =?utf-8?B?VFZVc0hmOG0xYzQ4cEFUZVErNXdPU1l2WkdRMVpFMUdDbnhuU1ErUXZ2SVl5?=
 =?utf-8?B?eVprMkFtZHkzSTQ3OGtrdUduR3ZUMTZ4NVBSREE2NkN4b05adGNiUFZuRUdB?=
 =?utf-8?B?aGwxb2tHakc1aFpRSitjeVQzTzVneVJzWHltb1lsWnVsWEl5VzJNTDFuZFdH?=
 =?utf-8?B?QmVFWFBuNm4yNGdNbE5KSm9ldUw4QXpkLytnYXNuVkd1aG1KbnVuN3ZsSXda?=
 =?utf-8?B?NTNJK2MzTFpwUzRKV1RUSFEvRHBhT3Qxc2hmbTM1UW5Rak1WOTFSQk1sbDhu?=
 =?utf-8?B?L3dkaEZrelorNXhReUNwQTVjVXV4Q1RudTNYVWhGSTRtNnJPcHh3UVRuSVAy?=
 =?utf-8?B?T09uMU80Nkx2NnFaYmxXQUpidkpaOGRFQnJrTU1LN09udTJ4SGZhMmU1Vnpj?=
 =?utf-8?B?RTFOK0hXQW9ON1FhaWdDT0xubVh5d2crRHdpQVFuSVlZZjhUL003Ris3R2Fu?=
 =?utf-8?B?bzdsdlpRcmdkcTB5WHVwUEROcmRFVDZ2bjJhRENyb1B1TEwvSEdlSkNpUVBE?=
 =?utf-8?B?QmlnOFgzVEM4ZjJGTU5wbW9jMTJaV2NYMkRwclA3QzZaa1VBUFVsL0Vxc1pD?=
 =?utf-8?B?UUdkM2FNQzhqMnZKVThhL0tURFpTMU81YTRqQVhmMXZjbmY0VzltMy9TRWlF?=
 =?utf-8?B?TElVeGVPaEZIZ04zbWZiNzNrdDY2ZUhVeTBtYVdycjNLMEtUeFBEaDVSUmpm?=
 =?utf-8?Q?xc65dQ6762v19Cn/pBWgJOif2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a4e8bb-7b26-4e37-81ee-08dcf83316ab
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 16:02:28.9013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: myThlq8JVjxlj63ytGbAggWBWLJ/9uIG8eYP/PJJS/tc5B2Bqe3wxY/175411kh+BJkNwJhmcjy8CWQXxaZ2Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5923
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



On 10/24/24 3:03 PM, Alex Hung wrote:
> From: Stylon Wang <stylon.wang@amd.com>
> 
> [WHY]
> Atomic commits without active planes are now invalid commits.
> 
> [HOW]
> Activate primary plane while setting 'max bpc' property.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Stylon Wang <stylon.wang@amd.com>
> ---
>   tools/amd_hdmi_compliance.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
> index 633d980bc..c0a324eb9 100644
> --- a/tools/amd_hdmi_compliance.c
> +++ b/tools/amd_hdmi_compliance.c
> @@ -428,11 +428,14 @@ static void set_force_yuv420(data_t *data, int force, int conn_id)
>   static void set_max_bpc(data_t *data, int max_bpc, int conn_id)
>   {
>   	igt_display_t *display = &data->display;
> +	igt_fb_t afb;
>   
>   	test_init(data, conn_id);
>   
>   	igt_info("Setting max bpc to %d on connector id %d\n",
>   		 max_bpc, data->output->config.connector->connector_id);
> +	igt_create_fb(data->fd, 128, 128, DRM_FORMAT_XRGB8888, 0, &afb);
> +	igt_plane_set_fb(data->primary, &afb);
>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, max_bpc);
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

