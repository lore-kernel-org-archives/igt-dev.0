Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7978E67A92
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 08:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9447310E652;
	Tue,  3 Mar 2026 08:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRtgH7sN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEDE610E123
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 08:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772525199; x=1804061199;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iPbtd+k+odmhs/kutD/jvCHtnOarAkw3wB66s3gomLQ=;
 b=nRtgH7sNt6RyMeUeLtzFG/Qgo5lPeNuR2RXeb2dxEVYHJpQWlY5Rx1q/
 /Bfnj2Jn0NNOUA7ZYmDTsYE5TPq3jSkNOjBnrm+hTUUiD6yd+2mNRmBUa
 uLlSerLWKVmLy2+A7bLBrMOdz+FE2OrXhfKF1NiJD6yprN3us6gcNBK1t
 fHkoFWBceQbQKv7vdg+mDjK21Bl8iH24TV+fQUL+ecZk43S+kLiWeBrf3
 fff18v4COdoS4ScZP8eK4m0XVmesXG18BMiXjP7U45TnwCsbHuKB08m01
 meUjDeJ8xk7SqG4zhFbj1mRtJmzYGte5JvwZCJ4A+W/lbN2gI/1SIN77a A==;
X-CSE-ConnectionGUID: YUaJeGA1SgqbnkRk9CZUtQ==
X-CSE-MsgGUID: qAOECRJxRmi0OKL3a/Xabw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84641671"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="84641671"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 00:06:38 -0800
X-CSE-ConnectionGUID: Bzru1YswQV2J1vjqFz9WNQ==
X-CSE-MsgGUID: frcFtkl1ReaNkr4+gif54g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="220947025"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 00:06:37 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 00:06:36 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 00:06:36 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 00:06:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=spYFZsAu6l+roD+8HhP42woB776IVjtvLY1B79wIL3B/wxkFtI4vynZhPaYw0ZvrUFykL7emPPviwY/DMpm/cj4wOA+HGSh/l/Fon+loyTH4dAId4bvrt4933uiBnBPwleS1Xg5eXbV9sS0GP0vRiUq6MJdrZCZ8IMVrwoQ6kh3mR7FOxeO9lOJJP+z4Dr2YGpRxdSX2UtKGORpYI2oQWF2Mp/CD029GcnbSQJHmGlBnT/4ca12evWv/0SzZUYV2V0s/WfLtoYMG9gDVVBRKOLgiTBrvoyRQx5rddqIG5Fhyd+sHPmIo0lZT2G/9r2L8rwrhUsL55P1JF1hCNVur0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fJB2BumHrSHf6G8XN3JHhhc7UBBOdbfRqsze92/BZzg=;
 b=mQkWRzrKLKSRZgpswL8/J1YvRokun2BprBiNirU6uDhAaT9Wylh4GBAbg178N4aZkHG4j4ETktdRcEjAEYpUVXHnoAqE2ROCOH1S2bn2OWaWplftixMc6idAxR5pxbLt8oymvReVSBycebSDZpnPHmDeNjap/blNsv21ener+pwiJO2cST/o1TUCPFslsA9zzl+vKTskrGOsjcOvoREHQE3fkqq7Qggsy59JL+GX6l+PSatGEIvU5J91jYiNzNzcI3K61R9ppuyt+dR7yrpjMqmfVL0OZga8goX/bOdSc/rx7G5Ypd6x2/0u8WaK0BBHC6BCwOfsxvv/eJk4to4RVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 08:06:33 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::682f:20b8:f518:49b3]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::682f:20b8:f518:49b3%6]) with mapi id 15.20.9632.017; Tue, 3 Mar 2026
 08:06:33 +0000
Message-ID: <de4e2745-1701-4ba9-ac76-721d18aa3829@intel.com>
Date: Tue, 3 Mar 2026 09:06:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/5] lib/xe_util.h: add canonical helper for
 48/57 bit vas
To: <priyanka.dandamudi@intel.com>, <igt-dev@lists.freedesktop.org>,
 <zbigniew.kempczynski@intel.com>
References: <20260303053104.1674811-1-priyanka.dandamudi@intel.com>
 <20260303053104.1674811-2-priyanka.dandamudi@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260303053104.1674811-2-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0131.eurprd07.prod.outlook.com
 (2603:10a6:802:16::18) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|SA1PR11MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: e4d6ae5a-e225-495e-3f46-08de78fbc89f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: NI0BT43Kgrdv2t3cnYGvxdy68dHsv7Fwf/TOEdZrXN2VVMXPRjDeUwtzSk1Z1EwqPJH8vr/lx1yWfCgECIzfW+nJzFNUxf3r4vK2QZmBQzYEUlBoa9QgBwoUtpj590WIJzgFMlfe53uU9sub3Axe/k+ibL5zM/UJyO30s0/K4nBIaGzeuL3SvxHIbUQA9b8XiP4KqvY4Agoyd6saUWsuxYAVrjxazuzqmRFM8H4XDmS0BgGeDaqgpMHqFDWLftmfD/75EJZcUzU8OrpDbpNmLAkzsIe1DxEU7lHBxMG0NfbyutjtXkQks6ZaP9rhE1q0oBmD9hRQSLsewgJUzyUDKOCiPOhipXGgmgDvLeUHS3nYxJnSKdrG1R4puAdExyqe2OOjTaKEAK79j0vgDvDCUZNTE9UIq36dFqEjhFtwWEfJtdI28UY5cFt40SRVLc6o4xqwZBXH67nGcPogndGQ8JQeDiYX3yt8eItFk/lwUcj/rBj3etgENepSVU+GMwc70oFbDXFc0GdPtUgCuLPk28P6yU6hbGLRmQ2hd0x1mAYc76TWTe8eTeSg1iUAeausy65ULj4Ka+hm8aBcf/iyppawvTo6rpjMOohtLUoZgUxejSFUwBKxcbXYtcV08u0bDjzUbnYP1noy0I5q0e3EOqKfnmRJ69zDiflOohf/BYWJZwA1k9mAjRaMtSl5P4b6osM1Gu9yCdzEhcuubEdtR/t6DwrlpKfKSmx4k7wViu0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHYwMysybkIxa0xJRVZkSVg5WUlORWpqcHFIcnNCcVR5UitTdDYrTk9JQzhJ?=
 =?utf-8?B?SHRiNFB1VUVMTjlGdHAveTBXWHpBT0xlMzVtVWg5WU02NVdkMjlaeHJhUGtP?=
 =?utf-8?B?Y3hUNUl0ditkUktocVV4Ni9NYk9WTjlCOHpMZHdSVVk0YXM1aTQ2dWlmMk9D?=
 =?utf-8?B?K2hSL09QMXFEcUprb3VBblRSTFZDaTlCT21Eb2ZkWDE3Tk82MENxbmdSdEdZ?=
 =?utf-8?B?T21tK2l3UUtya0VJRXp1bjMzWFE0a0FLWG1PVkh2dHlEd1U3STREclIrZ25l?=
 =?utf-8?B?R2hTcU01RStIS1U1azhrU2pLVUpndE0wTFc4UlhhcWNxc2lpcHgzTk1FODNy?=
 =?utf-8?B?Kzh3a0FFalA3S1NQblprNFVXUDYxMGVPZVFSNGVvbFY4cHdqNjhPNVhzdUhL?=
 =?utf-8?B?WjlxcUcweG4vMVZHb1huU2Q0S2k0cWV4VnZNWHZ2VlB2SEtMSFAxMm5xeTNj?=
 =?utf-8?B?anRsUUpwVHBnMFhQWUtMMW8rMUtVMC9UYlB0TldNUWg0MGlzRzRaWlJUQTlV?=
 =?utf-8?B?NlprVys0M1RmZXhlSEhWalVBK1A0c3d6YTJaU3BhUWRoSXhtc056QUZ0bjQ5?=
 =?utf-8?B?eFJVc1oxZzg4c3NCbmNhb2NHekVlb0JHTHQxdVJTY2xVMUMrWHB3NkduNW85?=
 =?utf-8?B?eVdINXVoM2FaREQzazluYWMrSzFRWE9Yc21sZEYySHB6LzlpcXRSWlg5M2JV?=
 =?utf-8?B?WU5UZkFJbGNPOXVMdW1OTUg4aHltUk00aHJLTC9waDVNWEppTm1USjJMSmg5?=
 =?utf-8?B?SGlQLy9SSVBlZnlGTXhXd0p3eEpuZEIzM29KeHk4d3lPaGcwaU03VEFVaXg2?=
 =?utf-8?B?Nk9vb3lXTDRCNmFDc2hPNXF1cWFpQW83MVJxc0pmaEVWOXJIcGJFcHo2SXdt?=
 =?utf-8?B?QXdwbjdaZWVrWWk3RktFL2xZNEdaejdsekwwQzZieXhqeGRNYStSVmJQY3dh?=
 =?utf-8?B?WjFRK2NUVTJGU0IwNW5RWU1pdHErdUhXTXhSUFNXc1VqckRkZ0ZPVWNHalFi?=
 =?utf-8?B?WE15VksydWd6b2plc29SMUsvRHR2Sm1QcDVQcm9YcGF2UXFaTFB4dUk4VGdu?=
 =?utf-8?B?SXBqVEZHL1JxZVo3Wkg5d1REcmk5cHdwcEFydWhIajlpbmRBT1owSUtBMnpK?=
 =?utf-8?B?K1g3ZS83MS8vNUxJNDlKSWpDSVU2Sk5KT3BvYmg2bWdYdkFrYVA3d2sxWWdk?=
 =?utf-8?B?NUFwZFdZRHltdTBGOVJUcThydkNCS2hoTC9BeEVxMHkzdnRGbWphQzQyQTI5?=
 =?utf-8?B?c290YnZYRXJaNWh3SzNDNmhkSDRBOE9kQnJqME82ckRHeUhqSnFCTmwxTUVE?=
 =?utf-8?B?cUU2ME5sTWNYL0ZrUXlhZWpsd1VVRHF6elVCU2xvRGMrY05GWkJNbUJQVVA4?=
 =?utf-8?B?TXo1cW5aNlpHeEdlM2dvcnFIZ1F6NW9CQTA5MGljR0hRZXU3U0Z4ak9iajBW?=
 =?utf-8?B?aC8xZThiNE1iQVhZb0dNM1JLdSttbW1ROVRMeHFiUkxyR0w1b3lScEUzeVEv?=
 =?utf-8?B?N1FpMnRzU29DWmlTYUxNZFRTSndoazJ0T2ZhZE0yN1VmOWJRZ3FUanBRV2xs?=
 =?utf-8?B?RzFiUFpQK1NXUkt4K28vY1ptRmpxS3FLYmc5bVdqK3lPK0xMQlAySDUyMFlm?=
 =?utf-8?B?aUlBRmFaaHRyVTIxdFZYM0thOWd6YXZnaDN4K0VJZkRUK3BObzhUdDdNRE16?=
 =?utf-8?B?ZFBZdnhBcjlYWFJaWUNTTmQvQmEyM21Edzhkc2dkWTcvdDdySjgzT3BJZkFC?=
 =?utf-8?B?WnJzUkFnMFZKTXNFTmNwMlZvR1BOd3JKTTFqa0x4QlljUjhMMTN4RDBna1c0?=
 =?utf-8?B?NnhoRjVZaHVuOGZCSXFHdGl1QUh2aS9JQXdhejIrZGZHRklwOGhpaHg4dWVX?=
 =?utf-8?B?dUErOGx4eWkrbXJsTk1jNWlJYkV3V0hUVEF2b0lzQXVKTUNUR0pQbmhNSmtr?=
 =?utf-8?B?ZER0M1Yzbm1HZWl2OE5oNUJINWpkRTJRcGl1SHFQejdVVUhpeGd3a204WE55?=
 =?utf-8?B?N2o5enhsUnhuZld1WnBHV2QrMWFLMVNXZUhHRUlXUFhRK1E0N3Joc0Z1bVFZ?=
 =?utf-8?B?MVcwWVlMbjMvY0pyVzFyZGp3c2F4Tks4ckNDTDZuOFZuNHhEZkYrclNEOWR4?=
 =?utf-8?B?SnRkem5sUkh4bEVYNjdaamM1aEtvUmlJZTRJN1B3M0hwNHdZU2t0S1hrcnli?=
 =?utf-8?B?U3krT3FQN2VKUlBTTDg1ckZBR3l5VDJXNnR0L1VEMlVmUSt0bDNiMGNIa1FL?=
 =?utf-8?B?b3NrSko4R3lRYVVIN2N1ZVNpMi9GTWx6QlBWS3o2TEJVM3pRVmIxNzA4RlNj?=
 =?utf-8?B?cWNQOERLY3MyazBhai9ITXdrcGJnTnJsa0VuNVdlbHZMODA1VjRGdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d6ae5a-e225-495e-3f46-08de78fbc89f
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 08:06:33.3641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shQ0W3fWOV+Pvr3fVsUbti+u6nlzWd6dqOJeMhflpn8Z5ySmYpClL+VsXvD0mAlwtD9nBbScHgjYneJuMG6Fyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5899
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

W dniu 3.03.2026 o 06:31, priyanka.dandamudi@intel.com pisze:
> From: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
> Add helper which returns valid from hw perspective offset
> ready to be inserted to gpu pipeline.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   lib/xe/xe_util.h | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> index a22572f35c..8dcfd2fb7f 100644
> --- a/lib/xe/xe_util.h
> +++ b/lib/xe/xe_util.h
> @@ -7,6 +7,7 @@
>   #ifndef XE_UTIL_H
>   #define XE_UTIL_H
>   
> +#include <linux_scaffold.h>
>   #include <stdbool.h>
>   #include <stddef.h>
>   #include <stdint.h>
> @@ -54,4 +55,8 @@ void xe_fast_copy(int fd,
>   		  uint32_t dst_bo, uint32_t dst_region, uint8_t dst_pat_index,
>   		  uint64_t size);
>   
> +static inline uint64_t xe_canonical_va(int fd, uint64_t offset) {
> +	return sign_extend64(offset, xe_va_bits(fd) - 1);
> +}
> +
>   #endif /* XE_UTIL_H */

