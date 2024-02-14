Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127DDC48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 18:17:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E0010E198;
	Wed, 14 Feb 2024 18:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Utorj6F1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7D810E198
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 18:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707934641; x=1739470641;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fTJfxWlZxnt9AcZ/BcWP1CSvLp/hlZhYQ2QfcaFkoL8=;
 b=Utorj6F18stoYpStMHRRaD+/IHvBb9BWG/m4y2VCKVD5qb5+gHdbKx3G
 +Rdluy691wntoqT0d8AkelsB6mRBxtZ/lxlIkTkwKcdPqge4V8bmfoxZy
 cLRnnNztUcMcwDgHbrObNP35RGs1iXQLlcvaJ1+Z2p3lN1khyJKvUgiQu
 ZMn8itEIB0nxE2COu+isWZPF2Gw2RHoyFP/Oi1zXKAiniS+PuDYduZ1wd
 6It1Qv2kFD6YzpYZNTcKoWXmwEb4hg0k0wGZ6j5IIscupH7NIAwiN6CuM
 udx1qf0xo/yb2uf5fRo9pOXnU6arb/JaEDmwT6bSpp4RZYulilvi+AJJv w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="12713387"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="12713387"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 10:17:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="3271118"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 10:17:19 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 10:17:18 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 10:17:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 10:17:17 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 10:17:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWqxRst/eKBHFCevkL1fVFtot3aHA+cQhi6XHVwM7LlIg2kl7jUszbi/FHMZU+tPDFTcWpmgr4fur87mp2LRHORMOJVTjjLtSJ2gfRgjVv1tBzYtcECws8Gk7dr+Pi4+H057wCHHktPrgyFCe36QDmjfVWmoYgd7tKx+E/LmYuL+P1YZs2dglAw6oKNRmxC8D6fbNqFTNnZtP9Rt6Y05zEhLyHeO0Xv0aKPpLIxzdCgS92Y4WUaQiIOOwsKL2iI9tZZ8V6rP4ITjw5pjOxCjqJDCssEjVg54dBJhGk/LIgqbLwvhTCkbj+xy80qTtqhxLNzCXQ8C52H7dr6WnRH+xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igcugZJC5yO/+U5NnQf8shwj7318R6PRTBOhF9mOfb8=;
 b=Pfoo+3jhjzwMSSTi5ESDNDhOi6g6V09vg1xYdsqg3NT873ToT/S/1p/MdeuaP9F1MP/HWYfrY4CkcPc0w35lKpLBNKCigUbVW0uzyJqiMbx50E2nGzYpVFAPWzodjFg7WrKDDboEt49gluVkpn4WpYKn5coV9bKNoZQJWCBF10DW3DxY60bnpDyrnU5g5/SoRehxM/69IwUhr5UTOITZvAReBuQNDJ1lS9rRS6AeFwPSOReQ0wBDIgdAjRqcb88RUJAiZ4UKp9wXpPaX1IpqdnU2ezoG8A/nv8zFvHHRgbVopUqrZ4rHAs9SRDV8hNiVF5wFJy9paLCXg7A7mwBNZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DM4PR11MB7182.namprd11.prod.outlook.com (2603:10b6:8:112::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Wed, 14 Feb
 2024 18:17:16 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7292.026; Wed, 14 Feb 2024
 18:17:16 +0000
Message-ID: <6a87a842-666a-4bf9-b2a5-3665d48e3c6f@intel.com>
Date: Wed, 14 Feb 2024 10:17:12 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v2 1/2] drm-uapi/xe: Add test to query GuC firmware
 submission version
Content-Language: en-GB
To: Francois Dugast <francois.dugast@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>
References: <20240214102435.7-1-francois.dugast@intel.com>
 <20240214102435.7-2-francois.dugast@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240214102435.7-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0069.namprd03.prod.outlook.com
 (2603:10b6:a03:331::14) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DM4PR11MB7182:EE_
X-MS-Office365-Filtering-Correlation-Id: 7480c27c-e5c4-4f55-dd65-08dc2d892c7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YauJsrwx7p22MzDuMPr/equ67UPftatMsgK+mRKZRkrerTXhjhtEFKr/teiaPSdlaemyodwMz5rM6QW79+JqP7wp++mM3Qy2vgzVF6xFhyAeAQTXnwlgguDpMsxM+WKWebkcK4Qb1OeGWEDtm/viaPlzWz9JOjbkOP5x6GwFiULhBVNqqNJkmgO6Spbep3+ajliqHxAq4B55zS/t0D6xe0T5cpjinpY7nygoEtjNQjtDFSl+bqXAlT0GDT2aitCC6EV0SXfJ7JireY8/DJO4jjckAQBLX/Kl726HJZJYOuFZfR7/2b8FQx0n/rwCJh5WeDa8xHwOLiKgN0cRUV3Ux2LNWiaKCNFORqpcEFgjRS1tTGhAOYj6W+3b5YS4FVEJU91cChXqTu8/O9wvKb10g40P/Jl2Ky0ap7etfWYRS63Swxjb0CBw3zsEIyLC47bWdF8QlJDmkWZxQ4YRTUL0kvzTKwtYHLgq9gEFj1kLOE8pNi+iT6dA/lu+v/P26lmWuqGxzHnAxyWH5VltwCJzgiLMnm7cY9m6YDLYwlFCKrLf/ZBiXdApXgt/xHWEZjye
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(36756003)(66556008)(5660300002)(53546011)(26005)(41300700001)(107886003)(478600001)(2616005)(8936002)(8676002)(66946007)(66476007)(4326008)(6666004)(6506007)(6512007)(54906003)(316002)(6486002)(31696002)(86362001)(82960400001)(38100700002)(83380400001)(2906002)(31686004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1RHYVZqbno1TlVKZGM3YkRYZDBLS3dWdlR5SnpZcExQZ2xhTGFHbHBXZUxM?=
 =?utf-8?B?SmlzMGpvdmhQNmRrWGxVUktzbjNJOEg1ZFRGamhURm9KRk91S2pXRmJRYUl2?=
 =?utf-8?B?Yk5iTS9NdEtMZmgwbEJiTTVOK0hUd09WMjhqZWZIMTJSTE5WMkFxbFd1T3Ux?=
 =?utf-8?B?bndNSjgramhqZDZ2OTEwcWx0bFFHdmJYZzEwS1F4ZkVnQWJ2ZllubVE0L0Fy?=
 =?utf-8?B?L2pWcFpLYlBRUGpOT1M2NCs5V0VkYWplZ3RYdEdxUjlsb0F4N1JpT1FJd3p2?=
 =?utf-8?B?L2dQM2NxWTI2SzFmb0lhU1JFZUQydDBPckJwTnVOKzRuNE5OTDk2OStCZGxS?=
 =?utf-8?B?NGhkVTkrcWQ2cFpRcU95Z3cvcDJBZXBTSEl2aElXdXZta1RFaUlMZ2FkREpK?=
 =?utf-8?B?cGM1SnkyRU05UHV6NU1EeXB5Q1praW5RUnlOR2p0ZGM0VU16cVdEb3NlQW5r?=
 =?utf-8?B?Mkp1VzYyQWpPOFk0THViUnhTeHNaTlMvakJMeUZ1K2s1L2xQdEFhTUk5aXl5?=
 =?utf-8?B?aVhPY0I3Z21PdDVrL2dyVVJxSFZUcUNBcW1MNVM5TFRqNUc3UUZSQWFkOGNS?=
 =?utf-8?B?b0M0d0FuVnorcTliVzFSa244VmV5d0RCVDROMkVndmVSVndzWThvY0FlWjJa?=
 =?utf-8?B?TkJPb253a0xzTUZsZmdnUzNjQlZBK2N5OVNlajIzVVh5c3NwSmI5SVlGR1Vm?=
 =?utf-8?B?bWpuWXkxMS9ENGFrdjljYkFORWlkZDBINTVqMkhSZFZ0Rnh3S1ErSVRVN0R3?=
 =?utf-8?B?eHZRallFbUxrTTFQcHl6YnRJeFE0UGRPdkE5REoydjJIWEZJMEYySFBEdVFy?=
 =?utf-8?B?V1hha1hpYUc0OGgrRGpjamE2THBnR01LbU5Jb2wySHhweW9xSlA1dXVLTWVm?=
 =?utf-8?B?SnZaOXA4cG9IanBHQ0ZxNFArUGtUYXZtbUVMcnpPaG4rTzJsSWNiY0E2YnM2?=
 =?utf-8?B?cUpSREo3R1FibVBYQmF6dWdYc3VFMVY0a050SVJ0RXQ3MHUrYnh4amYxVVFX?=
 =?utf-8?B?QlJHanR5QWovc2JCUm1hd3QzMElMWlcrbHVpUVkrRlVLdHVhcDBNODJCY3FB?=
 =?utf-8?B?b1crSW5xVG5Rb1gydXFQTy9FNnFiVkFlN0xHc3lZbDQ0c0JHTUpXREY0SjhJ?=
 =?utf-8?B?VXZIMnFpZVphdFNRc3I5Mkk0TW5PNXh1Q1FHbjMvSlNHN3orZzhQM1dFKzJZ?=
 =?utf-8?B?WmtUcTVHWGhBZllBSmlOb0hXcUdhNjVzblRRR1hzSFFhd2JFaUNjL29HblJF?=
 =?utf-8?B?cXhKV2FRSWxUUVBPazJFOElISFpDZ29xZVNkQmpMK2FKY0xRQzhaZmxpemtS?=
 =?utf-8?B?Yzl6ZmZWTi9CM1RSTjFqR2drbTlibHVkSm80eVhKY2FsNzlvTVE0Y2Rnbk96?=
 =?utf-8?B?eVlvSnN6ZEpUYys0T3lxS0NjQ0Rpck9YSTJ1QXFaSnpVVlZ4VDdPeWh4N3lE?=
 =?utf-8?B?SWw4UW8xTm0zc1hMOWVxWGNCc2F6NEFWWkpFdS9lemFRc3FVYkVPSjgyZkpU?=
 =?utf-8?B?Mlc1cHJEaHdkUUV0aWc4cGlOMjVrd0QxL2lBV0hUanJ6L3lVR1hsRkYySVdw?=
 =?utf-8?B?d3VqR2ltZlVUaGJqNDFtRVBobW9lTjk5eHRoWDQzcXZrKytpVTMrdWE2UVNv?=
 =?utf-8?B?NDJtdm1yRFYxelg5a3Y2cjNISHFsUHVjWDVNcXVwNlpzcFZZR0hhVUVqZm9J?=
 =?utf-8?B?Vm5JMzljMHV2YzBjejNZNm1QTWlOMHN1UjA0T1k2eEYwQjNOKzBoek5NVmIz?=
 =?utf-8?B?RzdRV2IrRGNFbmJhREtwVWVEVnA0RGtWMXV1dlluVkF2T1ZFcjRpa0JPNXFs?=
 =?utf-8?B?R2JMZ3VhSjJ0RDBmMy81R1ZjOGdCVUZuK3d3dTZ3OHI1cnk2SFZrTXdtZWFx?=
 =?utf-8?B?Wk5qVEMwQ0tVNnhiK1VtWFZTOHhwc29JK2VDeHR0RUlkcmtEamROR1RQanF0?=
 =?utf-8?B?ZmRYYWdEL2lJRzdKaGRJTWVFbk9HSmtnQ2Jwb0QyTEREVXIrWmRlQnVCanYz?=
 =?utf-8?B?V216WCtaRzNIY2tndzVMM1QwM21sM3JxRWxGQmRJancxQmZrSnFhSG94TzQr?=
 =?utf-8?B?Qm4wVG5DZTRGVkxkc0J5Y3hhcVlYWFFNbFNDSWFkSks2SXRsb1loY3huNFhG?=
 =?utf-8?B?MVRWbnFETmEzWXVKRjVUdW9UT0QwL2FUc1pTMUViR2pXeVdaVkhySFhjZFgx?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7480c27c-e5c4-4f55-dd65-08dc2d892c7b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 18:17:16.1466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NqwzB+V+poTlU9JgXitaEpWgsoJkMQWToQY2kDPVNabD1WoQQlQIes/sgWlK1c4tCCLkv25dUeva9O/aQYvg7GNhu5av2/CKuVIBkAC8h/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7182
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

On 2/14/2024 02:24, Francois Dugast wrote:
> This aligns with kernel commit ("drm/xe: Add uAPI to query GuC firmware
> submission version").
>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>   include/drm-uapi/xe_drm.h | 31 +++++++++++++
>   tests/intel/xe_query.c    | 97 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 128 insertions(+)
>
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index bacdca787..3bd795f27 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -574,6 +574,36 @@ struct drm_xe_query_engine_cycles {
>   	__u64 cpu_delta;
>   };
>   
> +/**
> + * struct drm_xe_query_uc_fw_version - query a micro-controller firmware version
> + *
> + * Given a uc_type this will return the major, minor, patch and branch version
> + * of the micro-controller firmware.
> + */
> +struct drm_xe_query_uc_fw_version {
> +	/** @uc: The micro-controller type to query firmware version */
> +#define XE_QUERY_UC_TYPE_GUC_SUBMISSION 0
> +	__u16 uc_type;
> +
> +	/** @pad: MBZ */
> +	__u16 pad;
> +
> +	/* @major_ver: major uc fw version */
> +	__u32 major_ver;
> +	/* @minor_ver: minor uc fw version */
> +	__u32 minor_ver;
> +	/* @patch_ver: patch uc fw version */
> +	__u32 patch_ver;
> +	/* @branch_ver: branch uc fw version */
> +	__u32 branch_ver;
The order is wrong here. The branch comes first.

John.

> +
> +	/** @pad2: MBZ */
> +	__u32 pad2;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved;
> +};
> +
>   /**
>    * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
>    * structure to query device information
> @@ -643,6 +673,7 @@ struct drm_xe_device_query {
>   #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
>   #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
>   #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
> +#define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
>   	/** @query: The type of data to query */
>   	__u32 query;
>   
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index 9a6799c84..d51e73ea5 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -730,6 +730,101 @@ static void test_engine_cycles_invalid(int fd)
>   	query_engine_cycles(fd, &ts);
>   }
>   
> +/**
> + * SUBTEST: query-uc-fw-version-guc
> + * Test category: functionality test
> + * Description: Display the GuC firmware submission version
> + *
> + * SUBTEST: multigpu-query-uc-fw-version-guc
> + * Test category: functionality test
> + * Sub-category: MultiGPU
> + * Description: Display GuC firmware submission version for all Xe devices.
> + */
> +static void
> +test_query_uc_fw_version_guc(int fd)
> +{
> +	struct drm_xe_query_uc_fw_version *uc_fw_version;
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_UC_FW_VERSION,
> +		.size = 0,
> +		.data = 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	uc_fw_version = malloc(query.size);
> +	igt_assert(uc_fw_version);
> +
> +	uc_fw_version->uc_type = XE_QUERY_UC_TYPE_GUC_SUBMISSION;
> +	uc_fw_version->pad = 0;
> +	uc_fw_version->pad2 = 0;
> +	uc_fw_version->reserved = 0;
Is it not simpler and more future proof to just do a memset(0) of the 
allocation?

> +	query.data = to_user_pointer(uc_fw_version);
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +	igt_assert(uc_fw_version->major_ver > 0);
> +
> +	igt_info("XE_QUERY_UC_TYPE_GUC_SUBMISSION %u.%u.%u.%u\n",
> +		 uc_fw_version->major_ver,
> +		 uc_fw_version->minor_ver,
> +		 uc_fw_version->patch_ver,
> +		 uc_fw_version->branch_ver);
Again, branch should come first. A change in the branch number resets 
all other components.

John.

> +
> +	free(uc_fw_version);
> +}
> +
> +/**
> + * SUBTEST: query-invalid-uc-fw-version-mbz
> + * Test category: functionality test
> + * Description: Check query with invalid arguments returns expected error code.
> + *
> + * SUBTEST: multigpu-query-invalid-uc-fw-version-mbz
> + * Test category: functionality test
> + * Sub-category: MultiGPU
> + * Description: Check query with invalid arguments for all Xe devices.
> + */
> +static void
> +test_query_uc_fw_version_invalid_mbz(int fd)
> +{
> +	struct drm_xe_query_uc_fw_version *uc_fw_version;
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_UC_FW_VERSION,
> +		.size = 0,
> +		.data = 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	uc_fw_version = malloc(query.size);
> +	igt_assert(uc_fw_version);
> +
> +	uc_fw_version->uc_type = XE_QUERY_UC_TYPE_GUC_SUBMISSION;
> +	uc_fw_version->pad = 0;
> +	uc_fw_version->pad2 = 0;
> +	uc_fw_version->reserved = 0;
> +	query.data = to_user_pointer(uc_fw_version);
> +
> +	/* Make sure the baseline passes */
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	/* Make sure KMD rejects non-zero padding/reserved fields */
> +	uc_fw_version->pad = -1;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
> +	uc_fw_version->pad = 0;
> +
> +	uc_fw_version->pad2 = -1;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
> +	uc_fw_version->pad2 = 0;
> +
> +	uc_fw_version->reserved = -1;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
> +	uc_fw_version->reserved = 0;
> +
> +	free(uc_fw_version);
> +}
> +
>   igt_main
>   {
>   	const struct {
> @@ -743,10 +838,12 @@ igt_main
>   		{ "query-hwconfig", test_query_hwconfig },
>   		{ "query-topology", test_query_gt_topology },
>   		{ "query-cs-cycles", test_query_engine_cycles },
> +		{ "query-uc-fw-version-guc", test_query_uc_fw_version_guc },
>   		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
>   		{ "query-invalid-query", test_query_invalid_query },
>   		{ "query-invalid-size", test_query_invalid_size },
>   		{ "query-invalid-extension", test_query_invalid_extension },
> +		{ "query-invalid-uc-fw-version-mbz", test_query_uc_fw_version_invalid_mbz },
>   		{ }
>   	}, *f;
>   	int xe, gpu_count;

