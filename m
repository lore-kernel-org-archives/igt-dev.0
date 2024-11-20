Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBACD6E2A2
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 03:06:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F013810E109;
	Wed, 20 Nov 2024 03:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z51LLbzH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6E710E6B6
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 03:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732072015; x=1763608015;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=T2FdBPxRxkJy1LAoQPGj3SCV8Jzi05H4zeQLu/9gJCI=;
 b=Z51LLbzH9hbmraiq1sXkDNpvCzfg/eZIPIaKSlVOYDsJz/OCCHCBSVI9
 S+J8W5H2dxhjRAopobrtnuhxPStwMo3WfYAX6myGwo1OmHwyrEy5zq9Lu
 ijsogpjdTA/0WP2cGUkbILuMiuft9Wd79l3BbZ2cOBaIGeS9hWrfXJxC3
 PWOlvVXiNxyWQEBFv1EIXbWTc5TajDJSPIu/oBGTne28rtG5jxC5CHlSP
 +ICURlhNLKGQZkUVhAzJS5koFtupihJIw2Xa7ZUN880TvGdk0tliIN8OL
 5hJIfAi1BzC4RABL8KcYJNpOwUx4pYxITHgK6cBEPlEoYXDlMjO9KUIia w==;
X-CSE-ConnectionGUID: AbgybghQTFaOnCZa7jZ/wA==
X-CSE-MsgGUID: +lTODAy9TBC793A8CaQxEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31511931"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="31511931"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 19:06:54 -0800
X-CSE-ConnectionGUID: svVoobE6QbOhgJFzLLrsZQ==
X-CSE-MsgGUID: 8n52GRwBTiivvkkPGZp8SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="89582049"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 19:06:54 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 19:06:53 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 19:06:53 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 19:06:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCVRdp80xGet5wwufkGFzMMQpKvKqqI1oN1H9DlaZ27sShHdwOf5ceHkusbjeA/JDu0GY6STWRPDoZz05hncHckOjJmkynI/zjpjEGrAbA89XSZFH8lT+UsVXNjza4Tgf2tvIsgFuF21uOKxTkE+xGtshn0XQRMjWCuWIPiOMTpge5WfXlPvnFdTMf8cv7EC7E4mMzJwu69JOlRB/AI+KlHiI/A9BySi3CddOu4BjRHtaSLTIifAds6URhfdzTCwcc2ElMEN4QtlfcZA62qFMqGFfFspI1VwFuxKtayrTsALPMbFRsQCEuWMfQadXjwGT5LVSrKmK15lkm/1D4Zaxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YR5ViNsEBv1VCnldSl+kYG1iK+ZzTuNhHjD9580Qnpc=;
 b=FC354VRsBCuIkZDbaMrZd7lxUHOx9Xn/axLBsY3CG54oOwO8yRE+a7BR92z43xPvCeTgGlibfq52UrflMIubcY0+iKrOwB0z1th4UFjOBVS1iutkF26IzllDmCCmz8e6uip7aQOH8x9GaOjxRB8LTom8rTxydeVXBySQHgS1UVV4IcttEPdhoDlLtsLvI2gcCaAkatXbVGdDATZ6dzYWznZEFIKsr9IzPZ5yCYXLd5VkopI3hrvovVNNITW1Gva6bpQMGYWaTSN+/tlQMf7YqFE0QgYSluNSIO3DPZrXTLj3KCggdH8G7cJUm2ns16ECYKfvCBzQmhlZtM7P5GJ42A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by CO1PR11MB5090.namprd11.prod.outlook.com (2603:10b6:303:96::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Wed, 20 Nov
 2024 03:06:45 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%6]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 03:06:45 +0000
Message-ID: <bbadfcdf-dabe-4b55-a671-9b4cdea27167@intel.com>
Date: Wed, 20 Nov 2024 08:36:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] lib: update fopen() to accomodate imgdir
To: <igt-dev@lists.freedesktop.org>
References: <20241119075259.3048734-1-ramanaidu.naladala@intel.com>
 <20241119075259.3048734-5-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241119075259.3048734-5-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::10) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|CO1PR11MB5090:EE_
X-MS-Office365-Filtering-Correlation-Id: d45c3080-5a42-42c5-fe76-08dd09105de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnAwalY1eDJOUG9kc0x2Zm9xRGNjRkJlcmp5R1RRa1YvOS9rNmhHNUI5cmJO?=
 =?utf-8?B?NkdjQzV4ZlhlV1NtWjFqSThEYkpjd1ZlRG1jK1FDaGI2anVEVVBWUDJ0VkNs?=
 =?utf-8?B?TjZjeGRIcnRQeVViZTFLOVBVU29nQkhlM0pnQldUd29mamppSzkyN29vL1lT?=
 =?utf-8?B?VWdFNHJuV1M5ZHhDcURQSHlRdmFLYjB3TlM2N2J0ZURUOWplVThjbkJWU0Ew?=
 =?utf-8?B?UEsvZ1BhN2M3ejgzZ0pkT0tpaEpYczl3TWl5T1NXM2xQaXJrRFNDb0pPVUtp?=
 =?utf-8?B?RktNOTlPb0xlNU9sSXdtVTJyUXZRMGtNbkx1YWpNdHdPWXlUUFpyQUJ5RkJn?=
 =?utf-8?B?QjQ4S3BOSWY1SGFocDhGVHMyYVgzb3BaK1ovbGVjbzA4L3VkR1ZmTmlaNDkw?=
 =?utf-8?B?Q2ViMUEyOWdjVk5jdWxvSmJ6cVFINksxZ3I0cmJJOHYyWk5xaGlTYVAvWlZI?=
 =?utf-8?B?em5LaDlZWkhpNElpOFRNYi80YVh4OVBBMFRWSG1CRlNhNnl5Qzg5eDZTOHVu?=
 =?utf-8?B?WUxMRUdVTng5WlhoUzVIMVMreG4yWEgzYTRWQmJSdFFnOTdTOVg5N0UwbldG?=
 =?utf-8?B?MmtLWmZidmUwa24yS3BEN050RmRhUWtJSjA4allIK1ZYNkMzSlZnR3VEdzZX?=
 =?utf-8?B?MDBRdTdnZ2hUSzhpVjdBU3Z6dzdRZ2FCNm55RGhVZ05qcjZ6MHVYRXBKcU0z?=
 =?utf-8?B?SzlUNWZxSnVCalRZZXpsM3FQM3o4WHFsNG5PeVNzQmF2eUxMUisyN05TKzRv?=
 =?utf-8?B?RzBQZ0EwbFpubm9pMXl6QnovOTdOMDExMDM5VTJBOTdDOWJYS08vakp6cG4z?=
 =?utf-8?B?N0NsYks3Nnp5VTFqQmdUM1M2Zksza2tVUXNUbC9ab2VScjUzZE11Y2tkb29y?=
 =?utf-8?B?MVFlRGlhRzZFTEg2Q1FpaXBMT2pPK21oRTZiMjZsbCtsT3c3bW1nRU9tUjJM?=
 =?utf-8?B?QnJpR2R2TmZpSElPd0ZSaE1oTVlNRHE0ODhPL2VHOTc0NGdDUk4yTDI3Vk1l?=
 =?utf-8?B?UlJVRGc3NzNORDQrSm5lMzFjN0FXeTB0UzIrRjZldVd5ZzBZVzRBamdmc0JO?=
 =?utf-8?B?eS96NUJhdDQ1clpJTEpnaEdlYUNZeVBxNjIySjQwa3c2TXdBcm9pNTFvRTFT?=
 =?utf-8?B?Qm9aL2hKNStyejhFYWx6bm9ZUDNlSXZHZk9rUXA1SnJETUxQMVNYYWlIektC?=
 =?utf-8?B?aGdhenFwRExuWkNORlAzNnpXK2xWUk5JOW9KZlloMWN1TFE0NmZCVFYyUUt0?=
 =?utf-8?B?SnZIZ2k5YTNWd0Y0czRNTG5sWXkyUkhSQ1doZmlZdFhwMTFkamhSZndTMEds?=
 =?utf-8?B?ekFtcTBuM0dsaXJZR1ZPQUczQk0vZDBJbEFFQnFEZmJoWUhWZE5BQW0yTlhh?=
 =?utf-8?B?bmxkQW1EalIwZnBRQ0Ztdk5JTDdKNmprdDAxSUpKMkdzajhkMU1IUUJZZ0xW?=
 =?utf-8?B?Y2hsNjNOaUxlT3F2R2lSYlBVN1RzaGtwcXRKZGpmd0VrMzdQRXhXZU5sOFhx?=
 =?utf-8?B?bHVJaGRBK2l5ZGNOSWFKTGtXN2N1VC93SGNQejh5QzhzU0YzWTFJV1Q4SzFJ?=
 =?utf-8?B?L2dSckwxUm0zNjJEVnlWT2FTVkhmTXhJVmlGNkpNLzRIZElRYmtwUUNPckgr?=
 =?utf-8?B?ODR4bEREYzN1MlIrZmkzT2p3VGdBVithMFdyVTBEb0h0R2lFbVh3c0MyZHJx?=
 =?utf-8?B?Z2lvWFlWOFpXQnJqeXA3NG1wQngxdzBlWUNQdWZyOWdQREhGK1FFTE9QYkV2?=
 =?utf-8?Q?DTaraVhSjPNFPEl2HhYfzg3F+dmRiPJMCDaUeGn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlhXUDhWa2pLNHZKamp4YmxKVzYxTEZ3SDFtc3lmY2ZQMmMxeHQrL3Jmcy90?=
 =?utf-8?B?NE9mUVo2OGRMQUNCRTlDUXkwUnFLR3A1OVpoaFNlRDZzRHVDNVFVejRlenFp?=
 =?utf-8?B?c2Z2amNxWFRHQXc3NWNRdTlXbkVUNEZxVlRqMVhXSEpYQ2V3dUhnSmtWckNN?=
 =?utf-8?B?OEFVTlYyVjJ0WncrSWR5b1FmUTFCTVM4K0RQd2VJOEhZVUVLQVlEb0M0eXNj?=
 =?utf-8?B?ZiswY2FIaU0yWHgrZUtIdjZvaVJLN3pPOFZONjFGYkJFZUsrU1ZxRWJCOGg2?=
 =?utf-8?B?blViN1ViL2hCQ2JwSjBDVkFuRnZzYmJJMzQ4VkxHS1JRbklMMmlqdDNvcjd1?=
 =?utf-8?B?ZkUrZ3MzS1owUDc0VDNYTWdJMFBhQ01rTFVzWkZTK2oxTFhCWmZ4K1FMU3RG?=
 =?utf-8?B?QkM1ZXhDRnpzOTFIb0dTNlVISm8xZ2lhRVJadmtweVY2dUdxTldvTVRlZ1By?=
 =?utf-8?B?ZmlmVjl1WkIxSGh2cmNPNGRQNTNhUnUzUlMyT1VuYkZMSkhsQ1Zvem82OTk3?=
 =?utf-8?B?ZVdXT1c3NkFpeXFGN3ppaUJtc3c4S0o1cUFCUnNVVzFaZytEOEdVaHE2M2xJ?=
 =?utf-8?B?Vk54bkdZQ3dwZFJJK0NTZm5UVFQvdXdlWU41ZmFybktXT2xjcVFHeVo1OERB?=
 =?utf-8?B?YkpRRDBDd0hzbXJ2REp1V3NqY29xaUtWWWkvSEluRm8wWXJwcEc4YlJ3RTd2?=
 =?utf-8?B?TDlvWk1BNGM5bzNodGthNTJVS3pwTm5kYVN0YnQySlJJUWFEM05MMjdTOTBO?=
 =?utf-8?B?MVZGdm1HVnpnbEd5bzN0ZFZXZjdNTHk4d2kzZm5uNEo0MGVBSnVlQ0IwUFFn?=
 =?utf-8?B?VXd1UHJWYnNJdUZ2OEJzRU91TGtERzRUbDI0WWRNREtHU2ZyU012aG55d2du?=
 =?utf-8?B?aCtxaXE5a2RScDE4NnhIRW5YNFMrMTdLM3BpOE9uZTNUYWVHbFNYbnVmeTFu?=
 =?utf-8?B?cXd6UFN3MkM2dTh2Qko1UjZqVHUyMllpV1NOcG00VGpjRFh2bW5pTk1qY1Y2?=
 =?utf-8?B?MHk5OVllcTk0ZWVGdFJPVndmUkpKenlKcld3dWhJVXpXeFdPNUNNUXJ3TFdp?=
 =?utf-8?B?Si82ekdHanpOSXRBMHcyMUI5eXNGODRnSGpKYkpQbjJnK3NEd1V6dytJd1hv?=
 =?utf-8?B?ZU5iZVl5UUZvdGhBam9NNDRZZUJuZWozWnpGbnJLa1l1dFJxcmQyY1NmNXpi?=
 =?utf-8?B?YlRZM2Q4TjZTR2ZMb0VmalhPWmtKNGc0TzIzcWRCSzlLbkhWaUg2SlRrV0NL?=
 =?utf-8?B?WXJPZ3d4TTYvOTRNTDhjOFU1V0djTFhYSEEwa1FFNnlHS2tQbzErZ2dIYnF6?=
 =?utf-8?B?Zk9NM0ZsN3VuVnhWS0VidFJZTGtXb25lcU9CVmEzcFhmRkpwWG03cURlaXRo?=
 =?utf-8?B?TzJJUFJHUmp3QzB1VEFJeGZBU1U5K2JYbkFNV0lBYnFPaDZ1Ui9MNHNuNDBL?=
 =?utf-8?B?eE5seFQrUmtNWDNTalVabWtMT3FkTzZ5V24ySHhJTjRqQ2FOS3FsN2V1RVIx?=
 =?utf-8?B?SS9aUTBGWWNNdGZEZ1IrZnJiT2dvZU92WktKSE8rTFlXeGFCTGVKUlZoOFVZ?=
 =?utf-8?B?UlFpZVpJaGt4cW8rWXVmRS8yL1hPSW4ya1dYM3ZqVFVFc2t2d1FXdWdXOVNT?=
 =?utf-8?B?YkxLWVh4Zm40d2x3anRtaEU3RHl1RjFVbXlpWEh5dFoyTm1adHIyMGN6dExy?=
 =?utf-8?B?cHlyNXdXRE1lai9GM1BsQVZQQ3M0RHpEbGtjY1p2d1V0eFkwdGM4MFR6STI4?=
 =?utf-8?B?bExSTVNXUTZoUXlibEY0azIzeXpLNnQxaUtRMEFvN21GSGxKanIxRzhVcmpF?=
 =?utf-8?B?V3Z2T1BydGJKVmVLV1VRZDZ5QXdOUUtoRUN3TE92cjduN1BQcmd4TlpoUnRK?=
 =?utf-8?B?Tlk2L2Vtd3ozQ1NmaHZieHd0VDJESDlyUUhMd3RzK2JqVTRMangzNXhRODE4?=
 =?utf-8?B?ek5EK2NTQVFud2QxRkxQVkRnZldCRFRjWGN5dVRCaTRDelRReUdOUit1d29O?=
 =?utf-8?B?MmJqcjhBTlczbWFXTGphUEZvM3Y4ZHQ0d0Z1bXdXWGJyNVVmNnFJck9saVFi?=
 =?utf-8?B?SGU4WDNxZFJLL0RnSmdZcE9JeGtxZmxCbDAxQlp4QUliQWtXMXpJTXI5cmNX?=
 =?utf-8?B?dkQ2UUN1c0hTdnNqVk9FdU5MZS9xRUFNTmlUWm9HU1Iza0Y3Q1hWSlBmem5a?=
 =?utf-8?Q?ByTsO1/zpjGg1wivNGGFhzk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d45c3080-5a42-42c5-fe76-08dd09105de2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 03:06:45.9042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hssKJCUh+EF9D7L19sIVzXNVsT7vn3pos8Pyic8z/YEYgzM/QoyQ6qzVQhZVcTC2qsD4WSvA8lCaaNRl15YRgPw87Or4fEMqdLdcoHTwy5mu5jmwYVwDbllDLgMOVTex
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5090
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

Hi Rama,

On 19-11-2024 13:22, Naladala Ramanaidu wrote:
> From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
> 
> Update fopen() to accomodate imgage directory path. Tests like kms_3d
> use this function while creating fb from png image.
> 
> Signed-off-by: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_core.c | 17 +++++++++++++++--
>   lib/igt_core.h |  4 ++--
>   2 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 407f7b551..8dae8f51d 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -3306,10 +3306,11 @@ void igt_reset_timeout(void)
>   }
>   
>   FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
> -		       const char* filename)
> +		       const char* igt_imgdir, const char* filename)
>   {
>   	char path[PATH_MAX];
>   	FILE *fp;
> +	char *abpath;
>   
>   	snprintf(path, sizeof(path), "%s/%s", igt_datadir, filename);
>   	fp = fopen(path, "r");
> @@ -3317,8 +3318,20 @@ FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
>   		snprintf(path, sizeof(path), "%s/%s", igt_srcdir, filename);
>   		fp = fopen(path, "r");
>   	}
> +
> +	if (!fp) {
> +		snprintf(path, sizeof(path), "%s/%s", igt_imgdir, filename);
> +		fp = fopen(path, "r");
> +        }
> +
> +	if (!fp) {
> +		abpath = getenv("IMGDIR");
 >> check for the return value of getenv before usig abpath.
	if (abpath) {}
> +                snprintf(path, sizeof(path), "%s/%s", abpath, filename);
> +                fp = fopen(path, "r");
> +        }
> +
>   	if (!fp) {
> -		snprintf(path, sizeof(path), "./%s", filename);
> +		snprintf(path, sizeof(path), "./data/%s", filename);
>   		fp = fopen(path, "r");
>   	}
 >> Also , imo It would be better to move the repeated code for 
constructing path to a seperate helper function.
>   
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 90f57402f..5b058a8d0 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1457,7 +1457,7 @@ static inline uint32_t igt_seconds_elapsed(struct timespec *start)
>   void igt_reset_timeout(void);
>   
>   FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
> -		       const char* filename);
> +		       const char* igt_imgdir, const char* filename);
>   /**
>    * igt_fopen_data:
>    * @filename: filename to open.
> @@ -1466,7 +1466,7 @@ FILE *__igt_fopen_data(const char* igt_srcdir, const char* igt_datadir,
>    * then from build directory, and finally from current directory.
>    */
>   #define igt_fopen_data(filename) \
> -	__igt_fopen_data(IGT_SRCDIR, IGT_DATADIR, filename)
> +	__igt_fopen_data(IGT_SRCDIR, IGT_DATADIR, IGT_IMGDIR, filename)
>   
>   int igt_system(const char *command);
>   int igt_system_quiet(const char *command);

