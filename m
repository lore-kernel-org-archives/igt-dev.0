Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497821091905
	for <igt-dev@archiver.kernel.org>; Thu, 19 Mar 2026 18:11:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE5E10E7D8;
	Thu, 19 Mar 2026 18:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PvdXko8H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEA910E7D8
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Mar 2026 18:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773943900; x=1805479900;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Y4Z53qWVqvHTNM2ovg7oRdYt2DRcwgxcwUB267uA+yw=;
 b=PvdXko8HYiXTJDxnU62KSP4pInjHQgzunYqIxkmRlX1MrSJ8k03sQTac
 BmvKa52jXYOVwQuX1oCGejwe4MejS8dAIHoC5wBxhHtdeGAjQ0EBLHlw/
 7o5VI9yjpE9v8D+mJdrANqnF2IF3e7Q8Fll32ddl3uU3V7Ak6R2Ylvjro
 i+K4NMke4FCw3A/kmnRNnjKxX4djd8rzIobdxsHcpHZGDgclGrnfFWF8G
 YEQXP7AjDTK6rbQ/MTfzLK/BsAjwinat/zgijtkmJPZBMcRLvHX4EoNaZ
 D8Vkoq7ZvVvCFPGl7kFNgM1dV7dFiyXJVJIQmPdC5oChddonOwX20ILwI g==;
X-CSE-ConnectionGUID: FH82vMx3S3SQ/uSdtiDATA==
X-CSE-MsgGUID: LFlxwK4+R4mF8ZNfIVNLyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="86503728"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="86503728"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 11:11:40 -0700
X-CSE-ConnectionGUID: e5Xa2QzJT92EDFo1zYCscA==
X-CSE-MsgGUID: 5QbKY5uBQJu+cSVvdZTUMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; d="scan'208";a="227169420"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2026 11:11:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 11:11:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 19 Mar 2026 11:11:39 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 19 Mar 2026 11:11:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LuyNxhLUKs9cl8gyRzNxAELTRyhDyhNRcp1vcF2AJHghxH2kPLB/P04FJzUBmFQ1nU+enrfM1+/Y+aG8BEQfMQFjYPvPvwedLiTYuIHNcyo3Zqe1ifMUtoAYzDD4FUqKyt+qL6DpgrQ8opPK8EvceolrNh77YOA8G+4UhVt4chYXY2fti3EuhNXKx5gmLtKL0Sx1WDtDBYQXnJ5/3kHF8g0PKu4ro7QvyQcT4d7UJitJ/acnfV/zuZ0pXsKmT5zIE35Uqey1YHNaJwX5ChDPXsMowTfO45pizv8REfM6/SCZnjezU7fM+VKP6z3diEG6+dLGga/r6mNiHGP/zGoOPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mQfLPFDd5rz8FtJTLH/ORMxl0C7q82sVSpEwHCNwi4=;
 b=SL0SUyt9XyyZT25TEYXLJlylwXtMqIFIA17wcJi5IUP6RPWkx7OL9O1M96ememT3WrVBSCU4sBCIg8hnCDFEnRjdSiNz4MJjU2+itHDtNEqO1/RrzX2kqIrjUWnMY8pOck7KGYrElVDNZ5QzrbCo6YfoN++MNf4FIG0qD+WAsuBa5JWGM8/k0wMwbJIQtg/3SHR0zFw6AQttEeucwIbvzfWy30TAotC3y0Ap3jBh/ayXYD0nvNIkz1VXmcqdm1y2nC6SykCYEJEOD9Y6B9UROb3bneVhnrRnTw7eso6lcpaN8vy512JYrrVLQD/Ut4DbMkrQuJV1gl4qoCNC5WJvxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DM4PR11MB7398.namprd11.prod.outlook.com (2603:10b6:8:102::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 18:11:36 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 18:11:35 +0000
Message-ID: <2cf5b451-dc1a-47bc-9e15-f5e6bf3781ca@intel.com>
Date: Thu, 19 Mar 2026 23:41:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane: Allow planar-pixel-format-settings
 to pass on VKMS
To: Renjun Wang <renjunw0@foxmail.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <igt-dev@lists.freedesktop.org>, "Karthik
 B S" <karthik.b.s@intel.com>
References: <tencent_009881AF754F22143F3943B76A2645C05A0A@qq.com>
 <20260204122952.gl5jttuyhdmr2mm4@kamilkon-DESK.igk.intel.com>
 <37dc23bc-8be4-4d83-beae-1e464530667d@intel.com>
 <tencent_B3C0E454F1807377EB51D21A2CB4D9E91A06@qq.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <tencent_B3C0E454F1807377EB51D21A2CB4D9E91A06@qq.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::10) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DM4PR11MB7398:EE_
X-MS-Office365-Filtering-Correlation-Id: df85357c-232a-468c-999e-08de85e2f4b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: cersOMfpaTDfYcwBmGhT2BLKk0lZb8FqE45PMPpv6aYugcW7fQhRWsw8eoje7eKdDiw+U8dTxzXgJ+Nlc6Vd5ccj+WBT94d1IAqZL1x/wvuM1+4chIyZyp+ZLumkno47pVn1N7xrzD1/lw5nSvcvMWyVm7y4Zr88HNxVca6J0jJkiQF0p/H93wnMccoynW55NMvx64Ik4uSlDDAee73s1inL0Ro61i0B0mmyEdH47VhON5ijy3bg2AqzwobZ0K4s4OFue9rEdOOYOKdaK+i5eemzpi8gMVqWc2M1L5nXZMBQP2FYxKaxlJV319i7dDhUJDzuEgDA1eCIOaUmIhIjpstKYyOpsZaJQcw6DZMuPGIKGOKT03BfH1yaEFjYN5e+2oY+LxLFqbGRfxPHjbdyA/269e0fCpWfUUJBs303UGYBowhSpdy3LI/V6B7+evu7rGVoyF2tKV2IHHf8AwO2XnOZxJADpFr8NdkWkWBDeetXWdphr8R9T7SEdWMNReJW4r0NGJFE8AHR8JxOVymmEVLVmPxG4zUdvaeJavBK9+6wmbqkR+ZiGordw/97MTTcDIoXiUceD76TW4z2xHrJRnAzrBTUBvSF1V+ldfIyNSszxPXcPcxuJo00gtsWYkwYvw5gt6wO8cBLAvnmSA6jw4i3gx5IjQR2Msq/Zu64hyDjwNvG1AmFFTXBcoV2+s6yCmODBslWlJwUoPgsq9C61mk5viDOwsQVwdGq05yxvCz0jiL3weM+kHzmXKmiKlcX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmRRTGZlQ1lBUWYyelJBUzV6NTloUzBOK1hNSXhTcFY5cHpDR1kzcVhibkZL?=
 =?utf-8?B?a2dzSEI4RWFuL1J3RVprU0xhMGpJMmtuOWFWcG1aNnRwVGZOblBWeVpsR0JX?=
 =?utf-8?B?UmkxbnphZU0wc1UvbXZ6cEttVUlPajlpaWcwMHhNOFljYU5MTG51ZGdXQVlp?=
 =?utf-8?B?bmxiaUtJanhZVUdTMEpJZmd4V09mNXQwT0gwQmlENk93ZDQyc0JNTGlBQnV0?=
 =?utf-8?B?SjFSclJsN3U1UHJKTXNkNzIxWnVJVzg0NWdwU3hONU1WSDV2MDZ2RmJId0NT?=
 =?utf-8?B?RHljYnZYOEd0b3NXSlZqR25qTXdOU2l2ejQ2ams3amtUaVRPTTZzcDYrRjVS?=
 =?utf-8?B?ZXhPTGt6UGs3dzN1TExkbm83UU5BRzVuMDBuOVN2R2lYdktJRFNCTWpZaS9T?=
 =?utf-8?B?Ukh5VGkxREJsL0lCM2hQbXJJVHZVa1h5NldJTmpWV0JLZFRtcmNJT2hIeE9E?=
 =?utf-8?B?YjlEcW51OG1mcEozd29YMU5Kenh3WlNIQlpCR3RSZE5oOEoxVjVmanJ5OFhT?=
 =?utf-8?B?QjFUMzhvQWI0TWRZNGIvV3ZWNFVQSjUwWHpIUDRZQ1ZFbVlKUzFWRFRMc2Rv?=
 =?utf-8?B?YlN4NGNuUWZXYkpoN2pZUVRTeWxZQTZ4NHp3YmwrRHpUaFNHSDd2c0ZOYXVL?=
 =?utf-8?B?S2tVcGVWaU9VbC9hZy9GTDNsR250dW9FcC91VVdjeFZmbG8yRUIvbzMwY1R6?=
 =?utf-8?B?Y2czVmxDS0lZU2FlZ2ZXMktNWi9nRVFacFV6RThCZWpsUHllU096cFhneE9J?=
 =?utf-8?B?eDh4Vms5MGZOSUR5OXJZWm41bm1kVGJRYUlXTzUwb2pmK3hHS3hMYjFGL0dN?=
 =?utf-8?B?R2NVTnlkb2VteTBqSm9XQUdjNjZXNmNXMFF0Mi81NWVEZGUrZU1idGNjV0Vv?=
 =?utf-8?B?ZTE2bE9IVWZjRDByaC9OdEoyUEdXc3B3dnkyVitmSndoYkhkcXVpRHdkNEJy?=
 =?utf-8?B?NGZHUzhPUzYwMXpaazlnNGI5Y1EzWFJFVXBZUjhLQ1ZiSUFESzZKNStZSFNO?=
 =?utf-8?B?b2lrYkRLTGxSWVFQdTh1elY4Wi9KS3ZNZEZWQXdiSFNXdmwvd29pUXBwN0Fh?=
 =?utf-8?B?disyaDVkc0FRRVVrQ1ZPRlcrV0JKRGF1aFcycGlZeEhkc2IzcDlOWlZGbVQ0?=
 =?utf-8?B?UW1pZU1oNm96SHJzN09VYzRMV1B5OEFXZHdzUnpCK256M3hySHBwQTY4VXF1?=
 =?utf-8?B?T1dJQ21xQUZxaE1LTkhXMEI5SHczSHpLNmRvOUUrU3ZLL3kvM2NBN3BkTFR1?=
 =?utf-8?B?WHpQdjlpZzNjZmY1SFVONXo4bkV4KzNXYlRkK2kwZ3J3ajg4NlRVYk9yMGFJ?=
 =?utf-8?B?cG9RVXZjZHFKMDZzbXFGNCtFRlVrREhGMDFnSjBrQkg0TGhPTmJjQTZYZjNo?=
 =?utf-8?B?aVgxQTh1OWlLUzVocDlMdnFNbEx3YnROY0hDY2VqTWRQSHlRRHN4MENEL1dM?=
 =?utf-8?B?M24ra2lTaXcyR0pCZFdibXJXczJEaEJVZ1JBejQvOENCNFpNVGNLZXpZa2NQ?=
 =?utf-8?B?TVk2U0YrRVg4QlI5TDdBSlJzbDE5Q3VhSEdrQXVVakdTNTdCTEJGZDBJa2lm?=
 =?utf-8?B?OUdhVHhGZ3J4VjF4OWN0YWJLL1dIVVhFQlMwUSs2YUcwNDFXUTlqdk5Id0F4?=
 =?utf-8?B?cFJQUWphUnpvZVhzMlFlZWV2N2FRdG50NHBZWENNN3ZPdGRGc2FKY3l5ME5D?=
 =?utf-8?B?NTI3SFZaZ0JIN2NxQkZFajAvYVA4UERJMlZCNE05VlMwc3pVdytleitaam9h?=
 =?utf-8?B?L3JwaFBYaFBNRkpmWjFOWUdvWWtnT1Vkay9sODY5b2tUQ3B4QklqVTRsdnpp?=
 =?utf-8?B?dmNaTWV1L0Rnd1hBVWwwUHhSVS81ZFo2aWFlaW5KRm53ZjZmUklqTHJ0NGdD?=
 =?utf-8?B?VFByQTFTaDJMcnZQaEtqbk5HQU5vKzl2c0lCZldTMGt1Y1ZkKzdHTUhuelcx?=
 =?utf-8?B?SW82MTBySmpHTVFlTHRSOXhuMFp6dU9NdkloZ25XZXk3NitpL095c3lkWWNa?=
 =?utf-8?B?YlBTNnpWcnZJRUpydHRwbVdkeTRWOWN5dEtpazhwVXdkSG1QdTRSYmxFdHVN?=
 =?utf-8?B?ZGJOZENhMS9NdENxNjNQTGhxWGpxYk42VE0xSnM0WmRDaWZiV1M0bUprMWF5?=
 =?utf-8?B?RkNRMnF0ZDFmTEZnZ2hCNDBNbkdzM0pZcldBT2VsZkVKL3lpdHA0V25UWnZr?=
 =?utf-8?B?R0o5Kzlxdi8zRmNWMVA4UjRrQW82clpHRHlHSlQ5eCtlWUNxbjB6MGdWMXZV?=
 =?utf-8?B?ZVVNQXlrd3I1TmxjUWoyNExTSGlOdWZuZ1F2bE42d1JWUnVhanJFWTNEV0pF?=
 =?utf-8?B?ME12N0tFRG1FZiticWJJTjFBTWl3UjY3ckUrNWp3dlk0WVJUSDROQT09?=
X-Exchange-RoutingPolicyChecked: lEtUneq3VWDmpj6Etj37ZE4QHNR3GONbX8jR6+iN6bF8gkYgqZVeDnXWZn8tod64meewHWSNfPWLESlB1LWRDZsfu1PVGP0yU5bf+Kc7j28uzcGtIbpYn5MkmBC6vfcCRN+qBofaqBSwMmS1NH+tpl5nZ/0y6JbQ5N16msS8gscduA+E2n2OCFX9onUG/60nRMrZlaV5nib3WnmLo//j9silDJu4Asxm/SFaoSRYdD4JC2xJzXAjqfJ4tT5AQg987zB4xspjN7Xev4Z7p0uJ+Ny29PxjNUSvt+aV5MuoPuo96z6Eji1TqQLdPq51ChAKIt/S47+41zj/lMtXfkFTPQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: df85357c-232a-468c-999e-08de85e2f4b1
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 18:11:35.3012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFHueLAm48LZ0uZ/n5XKouiXY2KP7Pf1NaGJq2pHj8XaXUD9SHND6mCkolYU/esV2hrpgediiDiWW+gJh0eSDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7398
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

Hi Wang

No, patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 19-03-2026 01:46 pm, Renjun Wang wrote:
> Hi Sharma,
>
> The version 2 for this patch is send by Kamil Koneczny[1], and have CI 
> results. Do I need to send version 2 patch again?
>
>
> [1] 
> https://lore.kernel.org/igt-dev/20260216185231.164130-1-kamil.konieczny@linux.intel.com/
>
>
> Best Regards,
>
> On 2/20/26 04:09, Sharma, Swati2 wrote:
>> Hi Renjun,
>>
>> On 04-02-2026 05:59 pm, Kamil Konieczny wrote:
>>> Hi Renjun,
>>> On 2026-02-01 at 14:11:43 +0800, Renjun Wang wrote:
>>>> Set expected_rval to 0 for planar-pixel-format-settings tests when
>>>> running on VKMS driver. VKMS currently accepts odd width/height for
>>>> NV12, odd horizontal panning for NV12, and odd vertical panning for
>>>> P016 formats.
>>>>
>>>> Signed-off-by: Renjun Wang <renjunw0@foxmail.com>
>>>> ---
>>>>   tests/kms_plane.c | 25 +++++++++++++------------
>>>>   1 file changed, 13 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
>>>> index 21d80847c..57adfe199 100644
>>>> --- a/tests/kms_plane.c
>>>> +++ b/tests/kms_plane.c
>>>> @@ -1313,11 +1313,9 @@ static void test_planar_settings(data_t *data)
>>>>       int devid;
>>>>       int display_ver = -1;
>>>>       int rval;
>>>> +    bool is_intel = false;
>>>> +    bool is_vkms = false;
>>>>   -    /*
>>>> -     * If here is added non-intel tests below require will need to be
>>>> -     * changed to if(..)
>>>> -     */
>>>>       igt_require_f(data->display.is_atomic, "Atomic mode-set not 
>>>> supported\n");
>>>>       if (is_intel_device(data->drm_fd)) {
>>>>           igt_require_intel(data->drm_fd);
>>>> @@ -1325,6 +1323,9 @@ static void test_planar_settings(data_t *data)
>>>>           igt_require(intel_display_ver(devid) >= 9);
>>>>           display_ver = intel_display_ver(devid);
>>>>           igt_require(display_ver >= 9);
>>>> +        is_intel = true;
>>>> +    } else if (is_vkms_device(data->drm_fd)) {
>>>> +        is_vkms = true;
>>>>       }
>>>>         output = igt_get_single_output_for_pipe(&data->display, pipe);
>>>> @@ -1337,12 +1338,12 @@ static void test_planar_settings(data_t *data)
>>>>                     DRM_MODE_ATOMIC_ALLOW_MODESET,
>>>>                     NULL);
>>>>   -    /* test against intel_plane_check_src_coordinates() in i915 */
>>> I am not sure if removing this is proper, maybe move it just below
>>> before 'if((is_intel...'
>>> Same concern below, when you remove other i915 comments.
>>>
>>> +cc Karthik and Swati
>>> Cc: Karthik B S <karthik.b.s@intel.com>
>>> Cc: Swati Sharma <swati2.sharma@intel.com>
>>>
>>>> +    /* Test odd width for NV12 format */
>>> Do we need it here, when just below is DRM_FORMAT_NV12?
>>> Or is it 'odd width' that is worth pointing out?
>>> Same concern below.
>>>
>>> Overall looks good. Btw Karthik or Swati, please find someone
>>> from KMS team and send this for testing, I will ack it then.
>>>
>>> Regards,
>>> Kamil
>>
>> Agree with Kamil, lets keep existing comments as it is. Please add 
>> your changes on top of those.
>>
>> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14559/shards-all.html?testfilter=planar-pixel-format-settings 
>>
>>
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14559/shards-all.html?testfilter=planar-pixel-format-settings 
>>
>>
>> There isn't any regression on CI results, results are okay.
>>
>>>
>>>>       if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>>>>                        DRM_FORMAT_MOD_LINEAR)) {
>>>>           int expected_rval = -EINVAL;
>>>>   -        if (display_ver >= 20)
>>>> +        if ((is_intel && display_ver >= 20) || is_vkms)
>>>>               expected_rval = 0;
>>>>             igt_create_fb(data->drm_fd, 257, 256,
>>>> @@ -1358,12 +1359,12 @@ static void test_planar_settings(data_t *data)
>>>>           igt_debug("Odd width NV12 framebuffer test skipped\n");
>>>>       }
>>>>   -    /* test against intel_plane_check_src_coordinates() in i915 */
>>>> +    /* Test odd height for NV12 format */
>>>>       if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>>>>                        DRM_FORMAT_MOD_LINEAR)) {
>>>>           int expected_rval = -EINVAL;
>>>>   -        if (display_ver >= 20 && display_ver < 35)
>>>> +        if ((is_intel && display_ver >= 20 && display_ver < 35) || 
>>>> is_vkms)
>>>>               expected_rval = 0;
>>>>             igt_create_fb(data->drm_fd, 256, 257,
>>>> @@ -1378,13 +1379,12 @@ static void test_planar_settings(data_t *data)
>>>>       } else {
>>>>           igt_debug("Odd height NV12 framebuffer test skipped\n");
>>>>       }
>>>> -
>>>> -    /* test against intel_plane_check_src_coordinates() in i915 */
>>>> +    /*Test odd horizontal panning for NV12 format */
>>>>       if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
>>>>                        DRM_FORMAT_MOD_LINEAR)) {
>>>>           int expected_rval = -EINVAL;
>>>>   -        if (display_ver >= 35)
>>>> +        if ((is_intel && display_ver >= 35) || is_vkms)
>>>>               expected_rval = 0;
>>>>             igt_create_fb(data->drm_fd, 810, 590,
>>>> @@ -1401,11 +1401,12 @@ static void test_planar_settings(data_t *data)
>>>>           igt_debug("Odd horizontal pan NV12 framebuffer test 
>>>> skipped\n");
>>>>       }
>>>>   +    /* Test odd vertical panning for P016 format */
>>>>       if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
>>>>                           DRM_FORMAT_MOD_LINEAR)) {
>>>>           int expected_rval = -EINVAL;
>>>>   -        if (display_ver >= 20 && display_ver < 35)
>>>> +        if ((is_intel && display_ver >= 20 && display_ver < 35) || 
>>>> is_vkms)
>>>>               expected_rval = 0;
>>>>             igt_create_color_fb(data->drm_fd, 256, 260,
>>>> -- 
>>>> 2.47.3
>>>>
>
