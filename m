Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316F4CA5FA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 18:27:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00E110EFF1;
	Tue, 29 Sep 2026 18:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EdDHNF1C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489C410EFF1
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 18:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790706392; x=1822242392;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ofzFJ1Q2oNzxYGHR2P/f9tLymy6RL/xISQNYE5Xvlfo=;
 b=EdDHNF1CHVq7k67vjOM9S2Z/d0BD/HlijI9iLa01cZ+Q6cnJFheF8qZc
 lxWytZm5eX3g4a/yNfG7c8filV7hwk3V0dLxBw419NSXrxJKRPWdleMy9
 kO8JgYgUJ1NGSWZWc3nZOelOX9vR4x66Q5NLquCnBURjp7SWdx9zWh0Gg
 940atzJ+FCWCx6+zAVwZxGn478M8+75b4DXFHeu+ei9tOpwE/trDbSghZ
 tx65C/THySDsc66/vM4fNtSFWlhCQA3sp89sNEL4D3zH0+/cZF5QhgYdb
 bt5RGNibQyIxsrruPixjFY00pPppARzCGFswWfAuT0ZOBTAOxEbUfmf96 Q==;
X-CSE-ConnectionGUID: qvBulT0JSDW9ScXfKEddAw==
X-CSE-MsgGUID: KUgmOYTRTreLDIOLNV2JXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="101959853"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="101959853"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:26:31 -0700
X-CSE-ConnectionGUID: 2TuZAW5sSV2yCOqn/UbIhw==
X-CSE-MsgGUID: YT9FDCHgQb2/mEJgrOnZIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="301705500"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:26:31 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:26:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 11:26:30 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:26:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcVkbdfMRBBM7FebOln8MNBzQRSbjgeS1GUlkO7NY1xWzUvyPK0De3HP8D6dm0JZpnQ8vpd+U5FRFIYRcLj9m/E57AobUSjbyGZDyhB74FDEOn2IkFyeByyZqjmw0FilDQFZJ3BJMY9KyOadiRBqXrKOmuHKlOYsF7U63dqB2D9VIpga8i4naeSSScITF1cezGiFu/7qJjNS+JFgKnv+j6A6mbmTdaWPbGRfjVNp9Mw+s4u2VqFZW/LZhr4F5PUVGgQbK66ObbevkZC0I/+6DwBRDs9qpyuNZSkdjEF8YJac71D3cg9Fy+J/CvXeUSquDB9+Ew5rjMPQ6JZI2FAt5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jef6/ZWHWdHipMqL0O+D1sB+PG5HcHNQuDN7Rhko+ho=;
 b=WCwfJ/JPl371AXrOouYYTjtMxPmdCmyRJ+vYeAA/LFruytGNvwX1aLkFHUkdMumfXJiY1fiyQe95r6HzHBeX2vx3/vAY7IycOY2wxBYkqqVTSVZaQyTOZNvgJNahpKq3CyfV2zr8YuE1QiDcOVtGtj+chkq7fIytTUWHoMFbqta7yoHcX5vNn04pbmaEUTo3jl8SGkSkpuwRNJF/81AOmBgnOWDaQAHB6vBMptGmlxT36oV4GMXxLjSDvvaTdQpB+ePiPfg9x3xz8j90aAl88z1YAVgmi9+6IRtKa3ev8jxqknbKyAiEAcW7qN+YJeiRALfac8Itwjh1eUHxlFtv6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by CO1PR11MB5026.namprd11.prod.outlook.com (2603:10b6:303:9c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Tue, 29 Sep
 2026 18:24:52 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 18:24:52 +0000
Message-ID: <4cdbbdf7-32d2-477b-8dea-85bbf344f7b0@intel.com>
Date: Tue, 29 Sep 2026 23:54:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] Update MAINTAINERS
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260929105755.49524-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260929105755.49524-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0170.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::7) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|CO1PR11MB5026:EE_
X-MS-Office365-Filtering-Correlation-Id: 442250e7-585d-45b0-2b20-08df1e56f3f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: W0wD1puh4onw99Vy/J7ln/M+9nq+bIPg+OAOOI5uFTwU/lu28JmN418qag5ep2RbmMNZ5ukbdwINI7qd8c2y2UAhpQN9oKlBDfbKsD6pftogjYUFUvzMBmE3ban1Enc4JsDlyDsFg+p9HACnEUchcaSyPEHoGgnR/GFCkmVsob0bagHZ1SlHKAbDYzmUQ6IL5yXk4ZL5UyINKgYHKTRuTOel9PdMWQsKUf47vqM9RaAqyJWls/JDtEVvd+6vc2ZtU2zJ/t/ZKEWfckJ2HcFMasmDggXj9gbSj5ngv8sjB8OjZbQPWxtIyVFwx/giDxMaqujdnr/S6IWJy7kl01Oo5vZeQZy3suIPwpW7gghQp7a16eRoT2HZOKMW5jyM+3wQUkibOwG4wuUzanhOG+T57arW+MimUzFnTaKkMa65aIccuqk16unYT39zlXTQcGgJa1UN6AMPhqxinnoF9sgQVcQYgwGcTwNWdCiGYFLR8NmyC5oUTmt+5lhbPKqc3HXMjlNHjtCRqNnwvLyMOkGF4ekZFmWUcnRwfgW5Nh2SndOmHe1JxOM6E44H/hGtcit5ptUQJ2jQ7VGRoL5SmHdp4j+s2+kPU3GtX175WWPk4GhV+6939nOzKYVUIK9tYTZq933WHLdNTCV00vaNMrGAyJIJXbn1BpRul7tJPPX1Wmg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3g2blBnR2hiazNOOHdBcnhDY1hBMEM4NzNzK2liK0tkeklETnNZWGI4eXlK?=
 =?utf-8?B?QnFCR1pCVEE5UTVkZStKMXdWRnJyYUFxMGxaWVhrVm9vUDdDSUN4R2R1TE1E?=
 =?utf-8?B?YmswZnJkcWo3cXVreEsvK1QxazNTYlJqZ2Mva2dMWFJBSURKTzlyQkMwbEpm?=
 =?utf-8?B?dGlaUVFObEZ4K1c4S3hVaHhJTlY0dXcvS2YwdDNrSTkvS21OdGFGaVNxeVBm?=
 =?utf-8?B?WnRtanhjOExCQ1hlUkk1RHNpOFlLSjZaZHQzZWhiODN3Q2hvNmNmZVdKSFJ5?=
 =?utf-8?B?WTJmQjlFeFR0ek5OSjRUL0lQekk2VVN1SHBGQTMzQzUwU2V0QkhpM1pDNzBm?=
 =?utf-8?B?U0NSaVUvYTExRzU1NTRSd3NlMU0yZTlYam5KSllkaXgzbkd2YTc3TWlGdGtE?=
 =?utf-8?B?Vlo0dERNZ3IxcXBQcVNLME96c0NCL2ZwZEFzd3Vvdk02bjlXZDRaaFd0YTdP?=
 =?utf-8?B?OUtNL0pzSDRMS1gzU3YrN1lwa01DMWtHdG8wMmJHYURDQ2JVZmthYTFOMXRS?=
 =?utf-8?B?Y1dETWR4RkZhbldlbmxOV2dTN252OTQ5SGQwV3VNUkFqZjZ2RU8yRTdBbXA4?=
 =?utf-8?B?Q0V3Y2R6Wm1mSzBsVk14YmJsNmlYcTBnN29BKzhuOHlNSW1DZk13azc1UXQy?=
 =?utf-8?B?VlVqa0VUSzhtWGpHSVJNU1ZPVFdBbmJSVDFaVDhLenErTmpSakJmUTZyeDB4?=
 =?utf-8?B?UVJhRUdhSGlGajduOFNSYVllKzdZMUhVeGI5UG1OanFzZEVIa1pNVWRiTDJZ?=
 =?utf-8?B?b0d5WlE4dU5qSGV4MTcvMUVSQ0RUcXFidFZpbWV3c0NRNGN0dFd4VWs5U3R6?=
 =?utf-8?B?eTRuYWtuVVUvVlYwRXZmdnV4YnNqeFRvVktQeFVDc2lMc3ZhZUFYTW1rRjh1?=
 =?utf-8?B?cms2M2orN2tLUzRpMEFycExuTTVNTHJ2U0lwNkQvNkg4bS94WDFUV0R0Z3pZ?=
 =?utf-8?B?RE1nNUFkdW9vUy9jMW9ieDhTQzdqdW1sd0IxcTBmUS9RZHBtNFVhMFdDU094?=
 =?utf-8?B?ZTcvWCtpekhad0NVUHhVcXRPaktBTmEvNDUvQzV4dkVra2VSWjIzb09IVi8r?=
 =?utf-8?B?bGpXVmNRQ0hXSjhmbkJEa0tFM2E3MFNzeDczSkJLd1NxbjBTL3dlWENQY2pj?=
 =?utf-8?B?OGV6aUhEYVlnVDJ4b2pIY1pJdzZSVk8yWjczdHh2cHErN3M4YTU5VWV5eWVs?=
 =?utf-8?B?WnhuZWIyMnBmdDY5cThaTnBiTzJCYVpweEZNUDB4a0RrWjFOeE8rNVlCcFN0?=
 =?utf-8?B?RUlNK2pwWkVIWUZ2VDRZdzBCbUJzOVQyVlpxZUcrV0pycVFROXFXTC9YenBE?=
 =?utf-8?B?dDE3Smdxd3RBQUdJeVFncjMzdUFTSDBKdEVVQmpuYWk3bTc1Zjk3cm81a2Rj?=
 =?utf-8?B?dnpWYzFuOVdEWnNSdFVMUWs4U3NRc2dyTXFBUy9QcWcxZGl2ZTRLaEZXbkxJ?=
 =?utf-8?B?Tkd6aU9aM0R6aUNxY2VmQ3VETUY5TFBWcTE5TVE0RGVYd3JHTGttM1pnYzc4?=
 =?utf-8?B?VHVKb1NaODVQV2pFV3J4K2YvdVRnRjRMdHlxOGdxV3RpRUF2TGhDTzdqM2FC?=
 =?utf-8?B?MmtUbEhWYzZsOEl3cE90ZUlVZmxQRUlmaHNzWmpFRmE4S3Q0KytyRlB4ZDRy?=
 =?utf-8?B?NGRKTGxmLy8ybnpaYjZBTVpGbXg1OVUyY3RSem1GeG9NcHg5SnVYVjk0enRD?=
 =?utf-8?B?RUlHNlBpZlpzYTBONFNva3dRNjljaUZndDVqKzJOSTdGT0NTaVBxbFZ1MDZP?=
 =?utf-8?B?Y0NpN0JlbTN0RGNSTDgxb2VLQXdzMngydVdOcm9HZTFxMkV3bzJLS2htT3No?=
 =?utf-8?B?K2ZkaUM1d1NabXFmby85QkY0Z213Zk9iSzFhMUZpYndTVGlIdmZoeFN6UXBu?=
 =?utf-8?B?d0hobWlmYlhELzBHUEpCVVUzK2R2d1h0ZHc1aGc4Q0hURVlyZ05LUkROQ3c1?=
 =?utf-8?B?dkZ0Ym5ERWFLbmVaVVV2eDZORWRZSWJMOWVyTjREY0hSNE9ySWJsNGVoQkY3?=
 =?utf-8?B?WDF5Y2ZUVkQwUGowaEhDV3RuQkx1NlpjOVpSY3YyblFmc0QrcVczZXNlZnFr?=
 =?utf-8?B?aTRzRWlHbmZ0Sk5GVm5qYndLUEtXWUFHUkY4bHBOdmtLNUZQQVFreUpGRWdR?=
 =?utf-8?B?bTFOTmd0b296RVQrMVMxcXBEd21hbDRVV3dveG5sMVFwQ2hJcFRSSmI0aFFM?=
 =?utf-8?B?bjRMaTRGYnViRGIzTWdJMXJtc1IzVTVaUTRURXpDUXJWQkdWMVEzVkNpNXZI?=
 =?utf-8?B?VWduY1p1cC9LY3lPOUx1NlpGbVFFVTdJZllweno2cU83U0YzWmxKS0lZVWl1?=
 =?utf-8?B?K1cyb0RYZXR3aGZBN202YjQ1RzBlZ3FKZ2FRZnNMQ1lyNzNNQ0F1QT09?=
X-Exchange-RoutingPolicyChecked: O5N8NZ0YLi05W1geQBTBmhWm2Y+QUup74oMUlIF1LEJhVIUcO8IA300cNsTwBdj5+qFQbXqnUr4tD77hJ4JHmMAbXq45bdVuRR+XMD7rVR1v7xRX7N2rOWzul7W2QzbEeAZaveg2tDgZJ6DOVYcsZ0KHAzASdWAqYdkwdN9VKPIMvn6QMifo4sQ6oVD4+1FpjlEuu7PmVTeOTR7IGVCKPtck505CLZ6yK1y12B8UhzP452zOXcYxoxBRjkDZ45e9J9ua6dXeauTMRv0w0NIdY3aq05mp3w5dH7IZChWezp250DTZR6h3MIbR+a3ah5+scubO+11X02zLBnVrofUZVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 442250e7-585d-45b0-2b20-08df1e56f3f5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 18:24:51.9868 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bjfUOCgxP52wdtotYd4LVdUElIzMMD5s3EF8nFzhOEVf5GC9FMKTtlm47zCsD8ullZN0frJ6aR+KTuMKqD6RDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5026
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


On 29-09-2026 04:27 pm, Kamil Konieczny wrote:
> Add Swati Sharma.
>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Acked-by:  Swati Sharma <swati2.sharma@intel.com>

> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e0ea8f2f3..e3b810dad 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4,3 +4,4 @@ Kamil Konieczny <kamil.konieczny@linux.intel.com>
>   Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>   Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
>   Karthik B S <karthik.b.s@intel.com>
> +Swati Sharma <swati2.sharma@intel.com>
