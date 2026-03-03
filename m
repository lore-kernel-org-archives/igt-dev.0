Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00940E67A96
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 08:30:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFC710E14F;
	Tue,  3 Mar 2026 08:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSc9mjO4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A1310E14F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 08:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772526604; x=1804062604;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6Gv+S4SOWPm9iAp1XgGd35Itc8PIkKIfGuh6tsVsULk=;
 b=CSc9mjO41bLtI8N4SGydzx405hANiN67BwZe2Ekc48f8nQSdME4rhaQR
 RaWiuE6YnlqDJGF48sXKQhjRK6BQtT1G4zMLvZDpG3viuWXjrbVb9dkAk
 p5D4bx7f2tH5RY+oDa3/ORSSfnI/kW2Bc4qyGEU9jyNvXEgipbsO7rB4v
 K/TZ32TRP++O3Uqv4vjtgUIDo34IHAVhwIErvQ7Iax9i0cCkHkcmi3XJn
 KmgiO2NP0YEiW4uIIaITRkRPsgmATDl06hSGeGTXsDueb/70u68XP6fEt
 gTDxu5h2mCdTC5UGUiaTtBgItqDPcgwXEzHRSHW7Ux0FRYxtva8AWdlE9 g==;
X-CSE-ConnectionGUID: Is/oaJCMQIem8TPnRAnuNA==
X-CSE-MsgGUID: tSFeFC3JQhiSsMXBJ7ICTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="85020780"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="85020780"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 00:30:02 -0800
X-CSE-ConnectionGUID: F0a6difmR8ieP4yza2+gFg==
X-CSE-MsgGUID: S7lf/xt9TFqqb17Ry38ZsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="222589827"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 00:30:01 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 00:30:00 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 00:30:00 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.47)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 00:30:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwgBsH/roi7FewYvJHSjq6xQRlCwRcm35q3pnZIgeSrV/rvMtElZdf7AQNdQtIfGb93B7dfYx2MTf4PbFru4k+nvkl1gjGP9a1K1+YJ/o4cNTIx1BIAj0cQLmo0ngVB24SjO3mnYEmzNFF6awIWtnLSq8TaL/zLmbXy5kUX6lnRmFMLdlSIxHpkLFjmwpAdSJutqH/AtJZK1gEocBtuXqIBJs4uUAdA0pLq/lBtoRrKeMgtl4mM8Dn9BkceOxAm4FrUjMaRZL436UL6D7AygsIAkblSYccrZviSwsMgM8OiHqU5CcJOvnpyW/OXyDDc/vpLfGUELjP+Haovfig4dUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rY7PCUUQszWAayH0r64RM77dMj/mKgV7vbMhaNroAC4=;
 b=jKgYF02uFeM83dVSPBHyQ2f27ddrVf8bKZixcWYXHImTylprtmfWEnGOd4467Yd4+TBe7MiBW71hELDpdAanBC4YmCpxGPxiBMjebKEimTK5+81o8wCtNPymIMPs0hFBaownEfJQkad0WMYIiqQSd9PdJcjYbe3smArtwyxX9ByD3+/tjfo2V+eW6GhVG2Be8hJ1R/VFPIEtJISabXNcwvuSTrSUfe1Ovyl26xXbPLYIsTpXEhZ39j1toEbV6yaCslkl/HCzDZd7qy+PfxSmTU8hKWZ/9c5v28HL94MbmYyduyxOqtC5A83DuPkrls1d/H9NjNrV5vnyxfchHeQhFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by DS0PR11MB8051.namprd11.prod.outlook.com
 (2603:10b6:8:121::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 08:29:57 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::682f:20b8:f518:49b3]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::682f:20b8:f518:49b3%6]) with mapi id 15.20.9632.017; Tue, 3 Mar 2026
 08:29:57 +0000
Message-ID: <f3b70c57-55d3-4875-b97f-3d4cb9cdaed9@intel.com>
Date: Tue, 3 Mar 2026 09:29:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/5] lib/[gpu_cmds|xehp_media]: Introduce gpu
 execution commands for an efficient 64bit mode.
To: <priyanka.dandamudi@intel.com>, <igt-dev@lists.freedesktop.org>,
 <zbigniew.kempczynski@intel.com>
References: <20260303053104.1674811-1-priyanka.dandamudi@intel.com>
 <20260303053104.1674811-3-priyanka.dandamudi@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260303053104.1674811-3-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0097.eurprd09.prod.outlook.com
 (2603:10a6:803:78::20) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|DS0PR11MB8051:EE_
X-MS-Office365-Filtering-Correlation-Id: 861b38a5-2afe-4e73-3aae-08de78ff0d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: eu5iWEjujUa8xQ/l3yeVpntltn5uFf/h4vAOWN06SXfEKrYLNu1KPRklzM7WkW//GNDd+lwrSNWhmrScLBk5DBFLP4xuCKAzP8Tt9zuw0FQguaJPUZm5ubjS65wx4twtiSKt7BOxsiCCXdk/i25AHBFTlVvwEUHk/BiYTOUJfHBzTboadJ4j1twoaxz1Keo/d564qpEa5cb4eNyThe5dWDdexIBhn5x9IISGcQ/rOjegTtyQEBHF/poKwTNEdwpQBRzW2Luq2Ygt1qrnC6Kih9nub7wKeWGMzGyS7jGVAUUCweQzTOcbBzHakAvRL7pAQSAXVbdpa1XRlQ7vUzJiSMZB2iMT7m4r36sw/vOZNBha2+fKQNbc3B880MFJrydc/fKUgqd8RY49l74PwdEN9IWF43pNscC5znrGJFda/Y5K8wlrIwMNWsfFLHsSizZyjhzx45xbQfMZF9XbuNrRt6XEJqm4kQVVQE+GyPt0w2QnKH+aIrgIgingZh6qbPM4QNk/vWJUuTdWpl6X3ofvPbaFIluNvLMShz/yR5GJPfb43CIwQ1zbA7bcQo0gEbMHPXLWiDg2HCO1OJuMW/LSs6D7Doifr26Ol2fVmk8cLSC7a2O2v9OEPmUfvkOisHOzSbCAieENNm7xAkN8bi6x05V0FwLz3d0IRk0n7Oj6sX1n6uF/OWfy+gegDLNdpXozQiXg10p9wbVjsSEx8lSS+TBlrs3EbYr/WHEF87sbZmc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d29hbCt3T21MTkI3ZHFuNHZobENyeWlPWFViSmw5WkNKTUNSRTJGUFBQc0k2?=
 =?utf-8?B?c1kvRG1yK0pJYWhkNGJpNjlSSzlYVGkrR1RFZFF6Z20yYWpqRS9vRE5qc3hh?=
 =?utf-8?B?K0ZDa3B0ME84M29MMlNwRFhQeDE4Z3FLSFBGUEFobG9DMEJyS2tQd01iaENC?=
 =?utf-8?B?OStuNjh5ejF0aFh3aUVyVEdKall3Z3B1L2IzQnhZTUltbngwUWl4VjV2bjNF?=
 =?utf-8?B?RWZ4czdNR2tvTmFiYnoxOGFyVWN6ZEllTE5qay9hZzAyQ25RNndlbWFpdHRC?=
 =?utf-8?B?czJzdE0vcGQ5QUlNQXlBTXJDMWV4dlVWZThBSWFRcE1mcE9GVE42bWt6bW1q?=
 =?utf-8?B?NDk2dnNxQWlwUUFCZVBzbDZDVFdGMTFyb3lOTXNtUFcvNFdkT0tMZDRFa2g4?=
 =?utf-8?B?MXRZaXR4ejBVTlcvK1cxakx1N2ZkS0lNWGRyYVNoNVpoWWhHRlR3dVlvTm9R?=
 =?utf-8?B?S3EwQi9Mb2doVWNCM2xDZmdSNVJwQ3NuSk5GYTBpQUY4TnMyS000c2Z2WFpC?=
 =?utf-8?B?T3k1Qit6L0xpcXhtWmFPQkNCNHc5dWMxOHpiYi9ISmJxaFlIa1B5UmszM1RP?=
 =?utf-8?B?SWlZSGhydDRGenNGQjF6WXJCMk9xSGc2SGtLR1Rza1RxSm1Sbm1mVlRtanVZ?=
 =?utf-8?B?WC8vUUtHZTVMTGt5YmREMURnd1o5YTNKbFc0ay95N0tpb0xIM1l4TTZNWlE2?=
 =?utf-8?B?RitBejFaNkZONHB2bklUVVJrNXZ4aWZWTWViT2ZzUVdsOFNpNTh2T2pISTFa?=
 =?utf-8?B?VU83Ym9JQzJpem1pYnR1a1ArWmJ5Uzh1TWt5NjdPSDgzTmdnZW9yRmxRUFRG?=
 =?utf-8?B?cS92N0dlTW5oUGh6TEZaeGtuWS8ra2xVVGNsZEdCS1BIVmYzWXREcFpSTkY1?=
 =?utf-8?B?SzIxR3pNSkZhVFUxZ05SUktZbTZwQXFlYXVTUEtmNHFHWm9tdHg4YVAwcGla?=
 =?utf-8?B?VlFlc1NIcFpSOVZlbjdVb1RZRUgzM2JKeU5nRCttZGVMRy9SZ1gzdDdTVElp?=
 =?utf-8?B?dVZ6cDYwR2MrK0lnK253RkxqNFpjMmlPcklqamJVYyt2RnYvSmNCYXdrVnFV?=
 =?utf-8?B?bEZoNVRmZ20rLzJqdzVRb0p6N3VsTXNvM2xRenNlVjhaVm9PYTVMN0Jzc1J4?=
 =?utf-8?B?L0lQZllVZDN4OFpZa0ZJNmV6UWluR1FhaUdmb2w4U1N4V1RZR2tCS1cvMlZM?=
 =?utf-8?B?NGc5YWdTVUZleXM5SHZuajBvc1VzVHVFRHZzeVkyNmNadWV2UzJ6c2JVN3JZ?=
 =?utf-8?B?aGtObEp3bzZBeldzQXBHK1V5WXBCajBlU1ZWbUlndmpvcCt5YkUyMGhza3E2?=
 =?utf-8?B?UkZPdXBuQUJHV3llV3pnUFV1R2VrUUU2NmFkYUZLdk9FVTFJZGh3QU5uNS95?=
 =?utf-8?B?SDFReWhXN2xKTStRYlNpNzNLbS9FTHAxTWZHN1g3cjNyQTY4dHdWMFFBamlN?=
 =?utf-8?B?K1o4TnFqTm0xcVgyTUphS0tIQVR3Q1p3SU5ocldqcDBMZ3JPalJ4cC8rcld4?=
 =?utf-8?B?dGp2M0t1VzBDWnY4TTRPQThJajFXM0kyZ3hUWWxlSFNaVG1wZDc0ME83NGth?=
 =?utf-8?B?SlM5TWEwdDFsUThpQ2JZTG5QZU02T1dYaU0wOVIrUzhUSFZ5ZlZyTlM3eldR?=
 =?utf-8?B?RWZBYlB2b1I5aXNtSzBReDFlMUsyYWdIL3cxb2NiSXo4a0Y3Z0RETkhNQ2lP?=
 =?utf-8?B?bUM4eFpJcnE1SVNNU1dPV3NuL01kSEx1ZmEzeWtMUU9HMmZpTzdjeDVWVnQ4?=
 =?utf-8?B?T3Zxdm4rZVRROXF5QnE4c1pyV2VNYUlsTzE1U3lCWGdPM2YwVjZ5d2dtVUlM?=
 =?utf-8?B?cDNuUXpKN0RCZzFQR1huZEZWL2Zrd29oL29RUHBrcnVOdVptVm9tTEprRUE4?=
 =?utf-8?B?b0w0a0NiVExvMW55Y3FucWkvakxFWHFzK29jUFdnbFI5NlJMZHFHdVlXU1VL?=
 =?utf-8?B?b1VlMjhPaksyVHR5RkJDYlFYb2hybmVKaXAzeFlvajhVVytENmdwdkZlcXZ5?=
 =?utf-8?B?dVJPVWpscU53M3VuS0N4V1dIaTNXS3cyZmUyTm9sMGVkWDdicUM5Nm9oMlIz?=
 =?utf-8?B?WkhaZmNJdFFYdm9JaW9leDhLcDVHS3RpS25kM3J3K0lLMHNuUThnaE5OQW9C?=
 =?utf-8?B?NGQrdWdCaG1JOEsxS3JVRThlUkF3b1VKa2lJeDlrOFFHNEkyWGNKN0VMb0l0?=
 =?utf-8?B?QWFoZE5XZU1GT0RnSDMrWGJZU2Q3aSs5OGw4NS9qRHluSis3WTc2ZjRXU2lt?=
 =?utf-8?B?S3RHM3kzbmQ1UmlPTTI5ZWswcXhiVEUrUjhnVXU3My9yd0RrWWVJa1VyNVhG?=
 =?utf-8?B?NTYyS0N2SldTeWU1a2JjZVVuM3pXbEgvYmNCS0J6TzY3cjlYejdQQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 861b38a5-2afe-4e73-3aae-08de78ff0d74
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 08:29:57.2145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GRo31DHP4G5AkkISWDs8c5sRYxKGidjL72qJekKC600tx1e7H9+zlYpN3ZdVD/xpekxOeith4qgcdlqRk3J/8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8051
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
> From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> 
> The efficient 64-bit mode introduced with XE3p and it makes manage all
> heaps by SW. In order to use efficient 64bit mode, the batchbuffer command
> have to use new introduced instructuctions (COMPUTE_WALKER2, etc) and
> new interface_descriptor for compute pipeline configuration and execution.
> 
> v2: Use xe_canonical_va in xe3p_fill_interface_descriptor for kernel_offset.
> Define BASEADDR_DIS and use it instead of hardcoding, also make some
> minute changes.(Andrzej)
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>   include/intel_gpu_commands.h |   1 +
>   lib/gpu_cmds.c               | 208 +++++++++++++++++++++++++++++++++++
>   lib/gpu_cmds.h               |  17 +++
>   lib/xehp_media.h             |  65 +++++++++++
>   4 files changed, 291 insertions(+)
> 
> diff --git a/include/intel_gpu_commands.h b/include/intel_gpu_commands.h
> index 5158bb0ea0..1998db4794 100644
> --- a/include/intel_gpu_commands.h
> +++ b/include/intel_gpu_commands.h
> @@ -400,6 +400,7 @@
>   #define MI_CONDITIONAL_BATCH_BUFFER_END MI_INSTR(0x36, 0)
>   #define  MI_DO_COMPARE		REG_BIT(21)
>   
> +#define BASEADDR_DIS (1 << 30)
>   #define STATE_BASE_ADDRESS \
>   	((0x3 << 29) | (0x0 << 27) | (0x1 << 24) | (0x1 << 16))
>   #define BASE_ADDRESS_MODIFY		REG_BIT(0)
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index a6a9247dce..cd912eb2ac 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -24,6 +24,7 @@
>   
>   #include "gpu_cmds.h"
>   #include "intel_mocs.h"
> +#include "xe/xe_util.h"
>   
>   static uint32_t
>   xehp_fill_surface_state(struct intel_bb *ibb,
> @@ -934,6 +935,36 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>   	idd->desc5.num_threads_in_tg = 1;
>   }
>   
> +void
> +xe3p_fill_interface_descriptor(struct intel_bb *ibb,
> +			       struct intel_buf *dst,
> +			       const uint32_t kernel[][4],
> +			       size_t size,
> +			       struct xe3p_interface_descriptor_data *idd)
> +{
> +	uint64_t kernel_offset;
> +
> +	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
> +	kernel_offset += ibb->batch_offset;
> +	kernel_offset = xe_canonical_va(ibb->fd, kernel_offset);
> +
> +	memset(idd, 0, sizeof(*idd));
> +
> +	/* 64-bit canonical format setting is needed. */
> +	idd->dw00.kernel_start_pointer = (((uint32_t)kernel_offset) >> 6);
> +	idd->dw01.kernel_start_pointer_high = kernel_offset >> 32;
> +
> +	/* Single program flow has no SIMD-specific branching in SIMD exec in EU threads */
> +	idd->dw02.single_program_flow = 1;
> +	idd->dw02.floating_point_mode = GEN8_FLOATING_POINT_IEEE_754;
> +
> +	/*
> +	* For testing purposes, use only one thread per thread group.
> +	* This makes it possible to identify threads by thread group id.
> +	*/
> +	idd->dw05.number_of_threads_in_gpgpu_thread_group = 1;
> +}
> +
>   static uint32_t
>   xehp_fill_surface_state(struct intel_bb *ibb,
>   			struct intel_buf *buf,
> @@ -1086,6 +1117,66 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
>   	intel_bb_out(ibb, 0);                                       //dw21
>   }
>   
> +void
> +xe3p_emit_state_base_address(struct intel_bb *ibb)
> +{
> +	intel_bb_out(ibb, GEN8_STATE_BASE_ADDRESS | 0x14);            //dw0
> +
> +	/* general state */
> +	intel_bb_out(ibb, BASE_ADDRESS_MODIFY);                   //dw1-dw2
> +	intel_bb_out(ibb, 0);
> +
> +	/*
> +	 * For full 64b Mode, set BASEADDR_DIS.
> +	 * In Full 64b Mode, all heaps are managed by SW.
> +	 * STATE_BASE_ADDRESS base addresses are ignored by HW
> +	 * stateless data port moc not set, so EU threads have to access
> +	 * only uncached without moc when load/store
> +	 */
> +	intel_bb_out(ibb, BASEADDR_DIS);                                   //dw3
> +
> +	/* surface state */
> +	intel_bb_out(ibb, BASE_ADDRESS_MODIFY);                   //dw4-dw5
> +	intel_bb_out(ibb, 0);
> +
> +	/* dynamic state */
> +	intel_bb_out(ibb, BASE_ADDRESS_MODIFY);                   //dw6-dw7
> +	intel_bb_out(ibb, 0);
> +
> +	intel_bb_out(ibb, 0);                                         //dw8-dw9
> +	intel_bb_out(ibb, 0);
> +
> +	/* instruction */
> +	intel_bb_emit_reloc(ibb, ibb->handle,
> +			    I915_GEM_DOMAIN_INSTRUCTION,              //dw10-dw11
> +			    0, BASE_ADDRESS_MODIFY, 0x0);
> +
> +	/* general state buffer size */
> +	intel_bb_out(ibb, 0xfffff000 | 1);                            //dw12
> +
> +	/* dynamic state buffer size */
> +	intel_bb_out(ibb, ALIGN(ibb->size, 1 << 12) | 1);             //dw13
> +
> +	intel_bb_out(ibb, 0);                          	              //dw14
> +
> +	/* intruction buffer size */
> +	intel_bb_out(ibb, ALIGN(ibb->size, 1 << 12) | 1);             //dw15
> +
> +	/* Bindless surface state base address */
> +	intel_bb_out(ibb, BASE_ADDRESS_MODIFY);                   //dw16-17
> +	intel_bb_out(ibb, 0);
> +
> +	/* Bindless surface state size */
> +	/* number of surface state entries in the Bindless Surface State buffer */
> +	intel_bb_out(ibb, 0xfffff000);                                //dw18
> +
> +	/* Bindless sampler state */
> +	intel_bb_out(ibb, BASE_ADDRESS_MODIFY);                   //dw19-20
> +	intel_bb_out(ibb, 0);
> +	/*  Bindless sampler state size */
> +	intel_bb_out(ibb, 0);                                         //dw21
> +}
> +
>   void
>   xehp_emit_compute_walk(struct intel_bb *ibb,
>   		       unsigned int x, unsigned int y,
> @@ -1175,3 +1266,120 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
>   		intel_bb_out(ibb, 0x0);
>   	}
>   }
> +
> +void
> +xe3p_emit_compute_walk2(struct intel_bb *ibb,
> +			unsigned int x, unsigned int y,
> +			unsigned int width, unsigned int height,
> +			struct xe3p_interface_descriptor_data *pidd,
> +			uint32_t max_threads)
> +{
> +	/*
> +	 * Max Threads represent range: [1, 2^16-1],
> +	 * Max Threads limit range: [64, number of subslices * number of EUs per SubSlice * number of threads per EU]
> +	 */
> +	const uint32_t MAX_THREADS = (1 << 16) - 1;
> +	uint32_t x_dim, y_dim, mask, max;
> +
> +	/*
> +	 * Simply do SIMD16 based dispatch, so every thread uses
> +	 * SIMD16 channels.
> +	 *
> +	 * Define our own thread group size, e.g 16x1 for every group, then
> +	 * will have 1 thread each group in SIMD16 dispatch. So thread
> +	 * width/height/depth are all 1.
> +	 *
> +	 * Then thread group X = width / 16 (aligned to 16)
> +	 * thread group Y = height;
> +	 */
> +	x_dim = (x + width + 15) / 16;
> +	y_dim = y + height;
> +
> +	mask = (x + width) & 15;
> +	if (mask == 0)
> +		mask = (1 << 16) - 1;
> +	else
> +		mask = (1 << mask) - 1;
> +
> +	intel_bb_out(ibb, XE3P_COMPUTE_WALKER2 | 0x3e);			//dw0, 0x32 => dw length: 62
> +
> +	intel_bb_out(ibb, 0); /* debug object id */			//dw0
> +	intel_bb_out(ibb, 0);						//dw1
> +
> +	/* Maximum Number of Threads */
> +	max = min_t(max_threads, max_t(max_threads, max_threads, 64), MAX_THREADS);

max = clamp(max_threads, 64, MAX_THREADS) looks better, up to you.


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej


> +	intel_bb_out(ibb, max << 16);					//dw2
> +
> +	/* SIMD size, size: SIMT16 | enable inline Parameter | Message SIMT16 */
> +	intel_bb_out(ibb, 1 << 30 | 1 << 25 | 1 << 17);			//dw3
> +
> +	/* Execution mask: masking the use of some SIMD lanes by the last thread in a thread group */
> +	intel_bb_out(ibb, mask);					//dw4
> +
> +	/*
> +	 * LWS =(Local_X_Max+1)*(Local_Y_Max+1)*(Local_Z_Max+1).
> +	 */
> +	intel_bb_out(ibb, (x_dim << 20) | (y_dim << 10) | 1);		//dw5
> +
> +	/* Thread Group ID X Dimension */
> +	intel_bb_out(ibb, x_dim);					//dw6
> +
> +	/* Thread Group ID Y Dimension */
> +	intel_bb_out(ibb, y_dim);					//dw7
> +
> +	/* Thread Group ID Z Dimension */
> +	intel_bb_out(ibb, 1);						//dw8
> +
> +	/* Thread Group ID Starting X, Y, Z */
> +	intel_bb_out(ibb, x / 16);					//dw9
> +	intel_bb_out(ibb, y);						//dw10
> +	intel_bb_out(ibb, 0);						//dw11
> +
> +	/* partition type / id / size */
> +	intel_bb_out(ibb, 0);						//dw12-13
> +	intel_bb_out(ibb, 0);
> +
> +	/* Preempt X / Y / Z */
> +	intel_bb_out(ibb, 0);						//dw14
> +	intel_bb_out(ibb, 0);						//dw15
> +	intel_bb_out(ibb, 0);						//dw16
> +
> +	/* APQID, PostSync ID, Over dispatch TG count, Walker ID for preemption restore */
> +	intel_bb_out(ibb, 0);						//dw17
> +
> +	/* Interface descriptor data */
> +	for (int i = 0; i < 8; i++) {					//dw18-25
> +		intel_bb_out(ibb, ((uint32_t *) pidd)[i]);
> +	}
> +
> +	/* Post Sync command payload 0 */
> +	for (int i = 0; i < 5; i++) {					//dw26-30
> +		intel_bb_out(ibb, 0);
> +	}
> +
> +	/* Inline data */
> +	/* DW31 and DW32 of Inline data will be copied into R0.14 and R0.15. */
> +	/* The rest of DW33 through DW46 will be copied to the following GRFs. */
> +	intel_bb_out(ibb, x_dim);					//dw31
> +	for (int i = 0; i < 15; i++) {					//dw32-46
> +		intel_bb_out(ibb, 0);
> +	}
> +
> +	/* Post Sync command payload 1 */
> +	for (int i = 0; i < 5; i++) {					//dw47-51
> +		intel_bb_out(ibb, 0);
> +	}
> +
> +	/* Post Sync command payload 2 */
> +	for (int i = 0; i < 5; i++) {					//dw52-56
> +		intel_bb_out(ibb, 0);
> +	}
> +
> +	/* Post Sync command payload 3 */
> +	for (int i = 0; i < 5; i++) {					//dw57-61
> +		intel_bb_out(ibb, 0);
> +	}
> +
> +	/* Preempt CS Interrupt Vector: Saved by HW on a TG preemption */
> +	intel_bb_out(ibb, 0);						//dw62
> +}
> diff --git a/lib/gpu_cmds.h b/lib/gpu_cmds.h
> index 846d2122ac..c38eaad865 100644
> --- a/lib/gpu_cmds.h
> +++ b/lib/gpu_cmds.h
> @@ -126,6 +126,13 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>   void
>   xehp_emit_state_compute_mode(struct intel_bb *ibb, bool vrt);
>   
> +void
> +xe3p_fill_interface_descriptor(struct intel_bb *ibb,
> +			       struct intel_buf *dst,
> +			       const uint32_t kernel[][4],
> +			       size_t size,
> +			       struct xe3p_interface_descriptor_data *idd);
> +
>   void
>   xehp_emit_state_binding_table_pool_alloc(struct intel_bb *ibb);
>   
> @@ -137,6 +144,9 @@ xehp_emit_cfe_state(struct intel_bb *ibb, uint32_t threads);
>   void
>   xehp_emit_state_base_address(struct intel_bb *ibb);
>   
> +void
> +xe3p_emit_state_base_address(struct intel_bb *ibb);
> +
>   void
>   xehp_emit_compute_walk(struct intel_bb *ibb,
>   		       unsigned int x, unsigned int y,
> @@ -144,4 +154,11 @@ xehp_emit_compute_walk(struct intel_bb *ibb,
>   		       struct xehp_interface_descriptor_data *pidd,
>   		       uint8_t color);
>   
> +void
> +xe3p_emit_compute_walk2(struct intel_bb *ibb,
> +			unsigned int x, unsigned int y,
> +			unsigned int width, unsigned int height,
> +			struct xe3p_interface_descriptor_data *pidd,
> +			uint32_t max_threads);
> +
>   #endif /* GPU_CMDS_H */
> diff --git a/lib/xehp_media.h b/lib/xehp_media.h
> index 20227bd3a6..c88e0dfb62 100644
> --- a/lib/xehp_media.h
> +++ b/lib/xehp_media.h
> @@ -83,6 +83,71 @@ struct xehp_interface_descriptor_data {
>   	} desc7;
>   };
>   
> +struct xe3p_interface_descriptor_data {
> +	struct {
> +		uint32_t rsvd0:					BITRANGE(0, 5);
> +		uint32_t kernel_start_pointer:			BITRANGE(6, 31);
> +	} dw00;
> +
> +	struct {
> +		uint32_t kernel_start_pointer_high:		BITRANGE(0, 31);
> +	} dw01;
> +
> +	struct {
> +		uint32_t eu_thread_scheduling_mode_override:	BITRANGE(0, 1);
> +		uint32_t rsvd5:					BITRANGE(2, 6);
> +		uint32_t software_exception_enable:		BITRANGE(7, 7);
> +		uint32_t rsvd4:					BITRANGE(8, 12);
> +		uint32_t illegal_opcode_exception_enable:	BITRANGE(13, 13);
> +		uint32_t rsvd3:					BITRANGE(14, 15);
> +		uint32_t floating_point_mode:			BITRANGE(16, 16);
> +		uint32_t rsvd2:					BITRANGE(17, 17);
> +		uint32_t single_program_flow:			BITRANGE(18, 18);
> +		uint32_t denorm_mode:				BITRANGE(19, 19);
> +		uint32_t thread_preemption:			BITRANGE(20, 20);
> +		uint32_t rsvd1:					BITRANGE(21, 25);
> +		uint32_t registers_per_thread:			BITRANGE(26, 30);
> +		uint32_t rsvd0:					BITRANGE(31, 31);
> +	} dw02;
> +
> +	struct {
> +		uint32_t rsvd0:					BITRANGE(0, 31);
> +	} dw03;
> +
> +	struct {
> +		uint32_t rsvd0:					BITRANGE(0, 31);
> +	} dw04;
> +
> +	struct {
> +		uint32_t number_of_threads_in_gpgpu_thread_group: BITRANGE(0, 7);
> +		uint32_t rsvd3:					BITRANGE(8, 12);
> +		uint32_t thread_group_forward_progress_guarantee: BITRANGE(13, 13);
> +		uint32_t rsvd2:					BITRANGE(14, 14);
> +		uint32_t btd_mode:				BITRANGE(15, 15);
> +		uint32_t shared_local_memory_size:		BITRANGE(16, 20);
> +		uint32_t rsvd1:					BITRANGE(21, 21);
> +		uint32_t rounding_mode:				BITRANGE(22, 23);
> +		uint32_t rsvd0:					BITRANGE(24, 24);
> +		uint32_t thread_group_dispatch_size:		BITRANGE(25, 27);
> +		uint32_t number_of_barriers:			BITRANGE(28, 31);
> +	} dw05;
> +
> +	struct {
> +		uint32_t rsvd3:					BITRANGE(0, 7);
> +		uint32_t z_pass_async_compute_thread_limit:	BITRANGE(8, 10);
> +		uint32_t rsvd2:					BITRANGE(11, 11);
> +		uint32_t np_z_async_throttle_settings:		BITRANGE(12, 13);
> +		uint32_t rsvd1:					BITRANGE(14, 15);
> +		uint32_t ps_async_thread_limit:			BITRANGE(16, 18);
> +		uint32_t rsvd0:					BITRANGE(19, 31);
> +	} dw06;
> +
> +	struct {
> +		uint32_t preferred_slm_allocation_size:		BITRANGE(0, 3);
> +		uint32_t rsvd0:					BITRANGE(4, 31);
> +	} dw07;
> +};
> +
>   struct xehp_surface_state {
>   	struct {
>   		uint32_t cube_pos_z: BITRANGE(0, 0);

