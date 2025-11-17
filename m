Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4192CEACEF
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 09:01:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BAF10E31F;
	Mon, 17 Nov 2025 09:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Us9A2Ush";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E1C10E315
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 09:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763370118; x=1794906118;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y+lEvIWBfGjG3dQBNC0RukBir2rpJh1ellbDeX3Nxh4=;
 b=Us9A2UshOR9PWfvILQM4C+e4Z1GjqiKbzem/ljCrCapytxjG23QwkSkC
 NVk7tcD+AIYAMl51QJWVFG1Rk6yNqToQ0lilT8BkTm3LgRy4gc4MhY2Tp
 hUimdui7i04VWTGDmKA1TfzYkAdbfgFVo/z2h7txWyhNLG3omhCWNbKHn
 FgZwqc+sgkOv9owZEl7HWPosduhBsUMs8HjdkeV30bE5vWCDmaUUKbxyR
 wfd79Fvb82qtupVYToakY7XCD7jCMJKhUTGtSlS7Trt6OY04BuXQtSdrt
 YuNqKH65AAymGzT0Op59f1n/kB7vT+kSKrBTafaRsmmBUZRkcOYSyiCbb w==;
X-CSE-ConnectionGUID: VSjFYDpYTZyaxl3bf0d5bw==
X-CSE-MsgGUID: oWHP6LlPSrW1D9DLT1t3Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="67970844"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="67970844"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 01:01:57 -0800
X-CSE-ConnectionGUID: 4fFZ0Cy5QVy8JNIt7iYADw==
X-CSE-MsgGUID: 1AfmqWiZQG+6AezMEWWEpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="195528022"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 01:01:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 01:01:56 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 01:01:56 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 01:01:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swAr5tbgBZ7ApbL3XsKf0nY9ACDtUQclZuqjftQU/YDeMMh06Fhs4Akcu7lEYq7oJ99K9gI+f7dhns7D1CLo0bUf1e/FqTIq4mcAUwcOuBAX4vUBDo/v2J7CCVXGlIQJTox4tZQKLW2v5FPWO4GQZE/WyZKH9xQT4SLUoJGmGu3g6WaRKJuuj0alSaBL1qe2IkUn551ZrY8GhgmCC3Dcs5cBIqNmXs4Ov3ZcA69kKPqD8QuVtu3bFBlMA8FPj3IJFvOynG3GcFpCAQdKwCriZoSJk1BtondXiS6WOopnUPRIbXwxuhIE4lQuXui57A3L8hKX73pBAovwkFQ8wuw/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIaWJidDUAUnwKkWC0oDtZc7gZJMmF0O3Z+3zNTUCcg=;
 b=gCUwmQblZHKFvaNVZh5JjkjUPj4B19WDMQ4NqhcQwiEUCwNXWnLpym3Xm5tB/ijKoBuewpFLG5xnlhKySPXpfMwXDUXJKyvoaK0h2yQgkE37XjoWCd6NBO4YQusQyHsiIAeiZP9rO91Qi4eQ551RiNaAjkH+FgmVfWw6FjyzR7ioohlTxuUpyNkQrdSApUmgBtB/CWsWOtxSXcNRfSxCz+4C+5LBF4KHzFgBw95KacvEwTAAeV2cp3NmRP5JaudLdQzD+T1BnoraH0+K3DqJodu2rFGNy8KEGIXBtzTJKocXS9XksGmbHr6gVbCZDHSiIIEgjzlaC5wDT7QpO9NrOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM4PR11MB6167.namprd11.prod.outlook.com (2603:10b6:8:ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Mon, 17 Nov
 2025 09:01:55 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 09:01:54 +0000
Message-ID: <1bf6ea76-b90e-4bf2-84f0-3b772d5549a3@intel.com>
Date: Mon, 17 Nov 2025 14:31:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 02/30] lib/igt_kms: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <leo.liu@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-3-alex.hung@amd.com>
 <00802a7b-d936-416d-aa58-19d7d40fcd2c@intel.com>
 <e75f4a84-fece-4504-9561-12fe2961af3b@amd.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <e75f4a84-fece-4504-9561-12fe2961af3b@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0154.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::13) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DM4PR11MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: 552b682c-06e0-4c54-5dbf-08de25b7f482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWxmR0lreXN5N2ZHYnc4N0NMS21LeFBIZUw2WjY0dGttK0xkMDBLSklsb0ZS?=
 =?utf-8?B?Nytiek9FcDNuR29YUVB3WStXZFoyV0xCOEoyUVBGRitQZkJRclduYjNETTIx?=
 =?utf-8?B?QVBhWjRQdDhuNG1zaFFRVVk4QXR0eGxWZU1KNmwzUXFzZ1pjakd0Vk0vdmhr?=
 =?utf-8?B?WE9SUUVocHdHOHBGSEJXNWx0aFY2djl5bkdYOFhrTU9RSVM3SDY3VTh1S3RG?=
 =?utf-8?B?SXhUTVNNYy9jcXM0eDRWWXpUb01BNUdBVmRVL0tkNUZuVXJ0VTJUaEF5OEZq?=
 =?utf-8?B?c3VVcWFCbHdnc3Q4VmdOZGlHeVhoZnlQNzNhSmNpM1hLT1VSUmlVKzJ2Uys4?=
 =?utf-8?B?VC9PU1I5RTFLdU5KaytDYnE0YTNURzdUcVlqeStXU0FiU2NqeWxRWjIrWlBq?=
 =?utf-8?B?dlJ5WHpPZmNNMlY5c1IzaVFCYitmeDAzMHl3VUMrMnk2YStkazh6ZTkwNWZY?=
 =?utf-8?B?V1JMTHFUaUNmMFdtODdhbHpZTkFiRWtVaGVnaUxiWStpeFkwUWI1YnZybVpO?=
 =?utf-8?B?WjEvWFdBazNYQ3owUXg2T1BBVzlDWWRqdWwrNTVNRC9zN2lNN2JhL1hjL0tS?=
 =?utf-8?B?eFdsKytLTk9qVVloUnZnSHVhOXh1V2xZdGV5ajhrVGR0S2JXeWxxc2lUaEpB?=
 =?utf-8?B?NHFLdkNjVHFYNzNQc01LQlpwSmdCSjZxaU94OWNxcnArc2tRVGtuTXZPblp0?=
 =?utf-8?B?S2diRDdKQUpPaWRZZFQyTDhVWUh2R3llTllBbDNldWFZTEhHdE96UHd3cUtQ?=
 =?utf-8?B?aVdFdE5aVmsveTFSbm5veks3dXhNQ3cxZEptZk1rL0pFS2hMcGkxWEJnN0Fv?=
 =?utf-8?B?bmNZWUVTS292VGNmOE1nQjFLT0ZYVWRSMEtvei9UYXNRKzRkMml6dS82ajdY?=
 =?utf-8?B?M3FuNEh4Smp2S0hrWXFRTWV6M3JCdVdkaTRoU3BrRVVRYzdULy9EbVRNenE0?=
 =?utf-8?B?djBjRU5leEV3T0lsRzIza0xqcDQybzhJZmZpdHNRd0hUWmlnMmRUUEh6SG9S?=
 =?utf-8?B?QUE2VXpQQi8waFNGY1J6OHJYMHJmWDhybmZFbUF4S2xBa3kyUkJKM0hNeTkr?=
 =?utf-8?B?SXJmT2ZUYkxnZmhxTE1ETTgrbGtpUzdnWGVSK2s0MlBpR2x3QnJUNmZZM251?=
 =?utf-8?B?VDdZU2hVZ3NvREw3eWFvSGlrSjB5dW5QaHlQekZIUGhhUk1vUXUzdHJValpU?=
 =?utf-8?B?Qzk0SHUyQXZ4ejNKM2IzQmVLbnJlWjlIQURkMU0vMExDOCtaai85YTFYcjRB?=
 =?utf-8?B?SjAxU3g0U09mZE9xeURBT3J5aDBGV05jVkh5b3I2aTF6MEk3YXc3RHFYWGhR?=
 =?utf-8?B?SVhxQXBNTXRpcjN1a0lBRDR4akI0ZmZKak5RclRUb3V1VGVvR3NFRVhYaXNK?=
 =?utf-8?B?S3BaNmZJUHZSOEtnQlBPQVVONWpKbEo5SU10OGtHZDMzbXZIQlBjTzVIcTJP?=
 =?utf-8?B?VWdMQ2hyMks5RGpxU3gwR0ZkYlVTQ25DOXV1VEpMT1pUd0dCMnBsNHlJcDA1?=
 =?utf-8?B?eGl4RldacnppYmhFa002ZnhraldoekNIcXRHVXhiT0ltUXhOWkRIdDM0Z3JH?=
 =?utf-8?B?dDl3Y0FSdDRtRFpPazNkSFBQcVE0VDZEZXZLdEExbkFkYm1ReDNNbGJxRGxR?=
 =?utf-8?B?YUUrbC9TamJnMFBLK0NmSENabUl0bU9VM2FSdWZlWVZJZnJNZ00yNGh1TkEv?=
 =?utf-8?B?QTBnbzRpZ294NWxNaVdYc3FlSWNzOUhYbDVVd3VmeURJV2tjWEUxdXZZeDE3?=
 =?utf-8?B?T0RZc2ZXZkxNM3JMNFdsUjJINVdPZmJDeFNJRTN6VjdaYUF6VW1ta1RYVSs3?=
 =?utf-8?B?V2Q4WndNVmQ3bVZhM0pYQmdEUGh2TU5rWkNvTmRHeXZsM0gwaDB5QUlTaVNL?=
 =?utf-8?B?YVVvek9tYzVVUVBPUzV1ZkZNNmJDUWN1VDdRSG1SVTh5ZWNpK05qOXJQRDBM?=
 =?utf-8?Q?ZmV9C56UsG8O+P/oRYQ3JYtLFMO9wP8k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTlTMmErK3Z0ZGVHTUxQOVJjMTlNSVgycFYzN2FiODNLQ1k0eTVQRHVoSjNM?=
 =?utf-8?B?TVBEV2xwSEtLR25mV0xYRkZXVys5SjdQSnJDSTFobTR5bE5hVHFuNXZSWVFR?=
 =?utf-8?B?OGpQUnV1SDRscFdlZWxmb1hmZVBWYmdNLzFxTndtand2QjJ5NE5KYjRBeWw5?=
 =?utf-8?B?ck9XYUFqVll6eUhnNTFKQlhHY1dCT0xodU9KL05RMEI2MEg3TWtNMWZ4SzAy?=
 =?utf-8?B?a1JDK01qenMrckJKR3ZvaFJlS3FYUTlBTVFPNXMyZWVYZUlhVis2UnZYZTJW?=
 =?utf-8?B?Zjl1anY2UmRlb3F1cTdWeWtGN2Z5SERNUE95NFl3NDU3T1dleW1uK1hmS0dO?=
 =?utf-8?B?SXYwbnZvTmZZUUgvWXc0VTNNQ09aak82MW5tYWJhQTd3WGFOWG9IM2RTRjQr?=
 =?utf-8?B?dStwelJqUXFveVcxZkRWVncrZ3hvWk5iN3lMYjRRNzVqaytCek9KeFU0UVdW?=
 =?utf-8?B?cGRxd3hXcUdqQkNHbUpHOHRXZUpYUkcxWHJSenoyc2ZqMGdPRG1NNDRLaW9P?=
 =?utf-8?B?SnBWWUE2RUx1dzdZQjRkdTFSVjlncnNrM3Q4N082YmpOMFh6b28zaUVxQWI3?=
 =?utf-8?B?SjR4Q3hUYmZFT1k0dVJDa1ZEdlU1VzdoOEpBRy8zSlJTTjN0SUdJWHExeEF3?=
 =?utf-8?B?SUVtdW1aRHpmSTFiU1J1S012N0hnQ0xqdERVK2tCaDI5eEV1QllIQUIxaUdO?=
 =?utf-8?B?Qk5ZTnBMNERDSlIyN2FwankzNUdZWnk3bnJtbUZja3hra1NkMm5WR05CclZq?=
 =?utf-8?B?RzlGeUNTNTl6cXlPMTlicWRCV1ZYU1J0cjBEMjdjYlRmeFJaUm9OVVZYdWZW?=
 =?utf-8?B?cWFOdHI3ZnlEZllTcVg3TmcxaWc4cis3bXdtTzFTcEpjY3p4dUh6UUgrVHAy?=
 =?utf-8?B?U0pOV1l0ZWU5MDY4Sk9KRmxmVzRZRkdTRDRUTmtZZjNZcTR4VnZvcGdpSXZD?=
 =?utf-8?B?T0VPN2tGb0FzUG4zcm5sYkFscmtBNWZ1NjUrZzgxaVBZenAzbUZYMGFrc1Zk?=
 =?utf-8?B?VmcvbHk2TDFUc3ArU3hXQjN6V3RuOHlxSWg1UEUyaVkrQkxhaGJJdGlXaVVq?=
 =?utf-8?B?RlNKWEFpeFI0MGdGS2ZoaHpvY28vL0c1cTU3SmN0dFVIZ0JMUDIxOVBMbnY5?=
 =?utf-8?B?ZVlsUWR3OTJFa0p0S3BpYkJmNDRvRHp4bGw4WlN6Vm9DMzROeWJMWFQza2ZW?=
 =?utf-8?B?TElhRGJ3NmlxTEdSUWxOMTB4cWxoRHIwNklVbEdBbzZPWnV2TlpMZ3dZVXhq?=
 =?utf-8?B?MkdyakNiaU1BNWlYVDAwT1dKYUp3UmJtZU5jWFNsMnFaTEF4SWRHc2llWFg2?=
 =?utf-8?B?aDRPTlVHMDZVTEc0WGVvTGRDV2Z4OWRtSHMyT0FoTHl6eHRJWEdYNlpzQzlX?=
 =?utf-8?B?MUtJZXJLQjZJSzU3SmlycHh0RVVKa0dEOW1MeHdTRWVvTzgzcWFPNlU0cS96?=
 =?utf-8?B?QUR6bmVwYmZYZkNGTm1sOVdVN1JCQVU4Mkd3a29Lc2t1UW9idG4zempNcXQr?=
 =?utf-8?B?dFdhL0cyUmxYcmNqdGFMOE9NT0pLdjZvR0lZVWQ4cFBWeVA0b3phK2IvZVE4?=
 =?utf-8?B?SEVhbGFHNlhJd2luKzh6dHQvdHIxcXFUbWJla2lnclVCZEZycE1aRnV3VEtT?=
 =?utf-8?B?SXlPMHQxMWZkOThZYzJlN2YvS2ludUpmd2FtTmtGWndnTkM1MVV2WGxScWp2?=
 =?utf-8?B?Qkt3TXZyVVJTbkxIQzRBSmhPV0ZkV0N5bTIvakduc0F2Ky9jUjNSYXRXejJZ?=
 =?utf-8?B?REE1UGhPeUlwNlBhdUlrZjBlWjVhNlRzWUFpWGx0SUd6K3A2cW5xYkJZeng1?=
 =?utf-8?B?YWNBZHN6MnhTQlY0THo1dTNFQldycXZZcFE5WitoNDBjT2pLRzlXRk5qenpG?=
 =?utf-8?B?L3NtemM4N1B5Rit5dVRkUEp1WFdWZ1QwQXUrd3htSmNYc1NNRlREUjNmQzk3?=
 =?utf-8?B?NVNTR0hwd3FOaFVvditDaFFxcmtRK25JZW9QSCtBWFlpWEU1bStndkUzbkNy?=
 =?utf-8?B?TnVoTWZrTDZWeWlCcG5VRXhaVlZMK1BRUGZqc3RWdXVhNnVZVXVpRitjV0tZ?=
 =?utf-8?B?NU9PNitEVS9kTkNUL2Y5b3JodzliV2N2amp4WFV2UnFHcm1IT0pnN1JGb001?=
 =?utf-8?B?djFIdVltZVRxcnlwU3VsYzgzSnZiOE9WUFYrSVE0V0VDNkJyMTFveUFzVUpo?=
 =?utf-8?Q?83N88ErXXY2e/nBtJ3XZu5I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 552b682c-06e0-4c54-5dbf-08de25b7f482
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 09:01:54.8308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7GvmpECejXRmjFildH/o/yB73f1+/Ke4sgVZmTdC7mZpoJc40u4sSL7s6VdDXsjuzeRkNWlS2D7JU4o9qHbA5PJ5PENso8O0IamDD5qPTiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6167
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



On 9/20/2025 1:49 AM, Alex Hung wrote:
> 
> 
> On 9/3/25 08:11, Borah, Chaitanya Kumar wrote:
>>> @@ -2982,6 +2986,9 @@ void igt_display_require(igt_display_t 
>>> *display, int drm_fd)
>>>       if (drmSetClientCap(drm_fd, 
>>> LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
>>>           display->has_virt_cursor_plane = 1;
>>> +    if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 
>>> 1) == 0)
>>> +        display->has_plane_color_pipeline = 1;
>>> +
>>
>> If we do this here, we will be taking out the legacy properties out of 
>> the equation for all IGTs (say kms_plane.c). So any place currently 
>> setting COLOR_ENCODING/COLOR_RANGE becomes dead code. Other than that 
>> probably harmless?
> 
> if color pipeline is available, we probably want to skip legacy 
> properties, but it is probably too risky for other tests right now.
> 
> I can move it out of igt_display_require and append it to 
> igt_display_require() calls in kms_colorop to something like the 
> following diff for the time-being.
> 
> Any comments?
> 

Apologies on missing out on your mail. I see you have already made 
change in the latest version. This makes more sense.

==
Chaitanya

> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 6418e81f5..83de6a0e9 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3108,9 +3108,6 @@ void igt_display_require(igt_display_t *display, 
> int drm_fd)
>          if (drmSetClientCap(drm_fd, 
> LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
>                  display->has_virt_cursor_plane = 1;
> 
> -       if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 
> 1) == 0)
> -               display->has_plane_color_pipeline = 1;
> -
>          plane_resources = drmModeGetPlaneResources(display->drm_fd);
>          igt_assert(plane_resources);
> 
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index d892ae449..29f59bd8f 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -633,10 +633,14 @@ igt_main
>                  igt_require_f(!ret, "error setting 
> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
> 
>                  igt_display_require(&display, display.drm_fd);
> +               if (drmSetClientCap(display.drm_fd, 
> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> +                       display.has_plane_color_pipeline = 1;
> 
>                  kmstest_set_vt_graphics_mode();
> 
>                  igt_display_require(&display, display.drm_fd);
> +               if (drmSetClientCap(display.drm_fd, 
> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
> +                       display.has_plane_color_pipeline = 1;
> 
>                  igt_require(display.is_atomic);
> 

