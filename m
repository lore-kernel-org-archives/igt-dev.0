Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC269C04FF6
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 16:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7713710E862;
	Fri, 19 Apr 2024 16:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z7PtAb/z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C84410E862
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 16:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713542732; x=1745078732;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jFCw2mvFFZOmskJ605fTp7CsxrJ4gc/kCZt17x+fq1o=;
 b=Z7PtAb/zuV6RIgyzqLQW6rgtHOJC77T43niq5W7oRw6POVV1AIeCB4Aj
 OwCwcYbYRk6H14bClGykdCXQySX2IZA+Clv9Rg8yxjNG54TKirUf4kxBx
 zpDtyaO2TFpzuscgkXiQX2L+wIIdCUqLV84R2lvqW2qQeaKPDaDw2QGRb
 sWL8sFVrYgwTGVQMr8XdubVs4hGwEt8McFAJ8tpI+5pyqyaARN8Lwk0tS
 oR8WyeaipZ5lksvZzd2PhjFeGgAyFPAa64/jSUXyY5jiWzddON3A++RYQ
 Qp8MKN52zWJwMg/UsZQ6bXSuYC2jo6/6LcZI5P60H4panLK89sAPP0Z/D g==;
X-CSE-ConnectionGUID: yym9JgcVQvu5pq7OBP6DTg==
X-CSE-MsgGUID: oygm+kH1R8a/Srnw3eAO4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9307303"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9307303"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 09:05:32 -0700
X-CSE-ConnectionGUID: /5hbWOs9S+yhysgvYzI9cA==
X-CSE-MsgGUID: LFjj7XkhQMyE46RwYYs7kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23824095"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 09:05:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 09:05:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 09:05:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 09:05:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTYiXiG56vWJVf2otYYftX9ZAKxET3BFcD+ap7I/XGrAfJe27+wrk5uj39AbLi1fbDjPElqeeHL508DnN72QQh4ipP9jmeT2W+bQI16WzIHGuF9pW6fIuZ8fViK6HwaNjp8Jw3wZkntGjJkSYLEE+SfA4pZ9jLbmVp0LUPdcTeZDqsdeECFRO1glkIpz5Mdabz9HFw9ExeoFXzMFEWx5WJptMN3U3AbnxmMlDFVttxgW2ck+XXlLHiG1rSpxxcREVDZ3TR69cvNNhmY3eypZhOtnvTT8AQ8fQuuWUO+KVmtxDV2wHSyg+czzYX6jigb19xqDV410MDDsZHC3Jmq1/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wp7PQYnfPHEZmEeeqxcTQ7bZQg7jVjoRq/Dzf7KS+WY=;
 b=A42Ud7ygvCD9co+kBcTH1/GTPMdGSM3U29F26ws8iXSai7aWyVZCNooNFGvzpcbs5QvcIdTkpN9cC5gjmUKH+En0qUdpRsGsduOJVJlaoCq/cVUO5eSKOcxwq6i3mFaZkOHfVKnGUB9DT6Qjfl+VWwVd5Pmho9bvtfWFwpovg7fchOABfSTsSdoLNisQ7Nz5ZQn8QI8FagwU9npgB36TkhGPMUIzg7x7PiuXARG2qlXlMLgsCGFR2MBoJxtrHCUbRjFHkIwFrdTwl3oJ5t60acvMQx3jJda4cZvfhQKv8ly+QqDZYCZUp/0xQFJAoib58NcaJfCCg7vbj0SkS/hQcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7902.namprd11.prod.outlook.com (2603:10b6:8:f6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.31; Fri, 19 Apr 2024 16:05:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.010; Fri, 19 Apr 2024
 16:05:14 +0000
Date: Fri, 19 Apr 2024 11:05:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t,v1 0/4] L3 bank mask
Message-ID: <ops66kninzyesubvvcg7bsjxpbfd3p6hl4kljm6xt4fzywnurr@mbqqtjb7bpkx>
References: <20240417145049.7-1-francois.dugast@intel.com>
 <sx44ek2wi3megbrlu5pxzny55n6didg7kwopygzzywgcjs5ic5@wq56mdm4s4wi>
 <ZiEfuLsKfFtoZ4LA@fdugast-desk.home>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZiEfuLsKfFtoZ4LA@fdugast-desk.home>
X-ClientProxiedBy: BY3PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:254::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: 1888c661-8ca4-4b15-9a33-08dc608a7f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g+Cv86sMSS5Zi3JEau39Mmr9bh1cdQncQqcKyDIOo9knkft74iOMgElu2Klf?=
 =?us-ascii?Q?8Szafv1OVeBc1ty/joBFJ2k7K2CLJofmeXFfnIC8HyNeHZkPnNr7yX5JJ0eI?=
 =?us-ascii?Q?nUlXPA5jErkNtR9XdqGBi8DiD7gbZpztvWth8KnZpP8hvNp/U6tGjE3ZJUJF?=
 =?us-ascii?Q?FVoIjzUok+XOxQep+1K5bjIHfRTvoQw8lXAh72U5vH843iixhkb12+Gff0Q2?=
 =?us-ascii?Q?VYBZETLtbpZFuZF0AIm2A4tS/9+5lPwZ0N8AHHVLuZIwaED7qiOuSDcFj5Sv?=
 =?us-ascii?Q?cXn4ygch9ROpuk11VRpOGDR0rkmrqturRo+cIM2RjbMOCDURbP476fj3dJUU?=
 =?us-ascii?Q?/xX7STwcXNfD6rvUYUc25yI28DBNYoHFeVISrg1J/+TlJ+0b/QtDr9o1fP5b?=
 =?us-ascii?Q?LZIBMt3+Q/S3pWeyJQSz87MnxZwqn5ov8xli8zRTFWsptEms2/cHRrv8bNQA?=
 =?us-ascii?Q?7wUbt0k85ey3Or0HPytnPptr7GiwLvoltGBF4JY/NIeDkq5OyFaIzUU8TGie?=
 =?us-ascii?Q?pAWlJlU2tvTCcXkdcgoJom/a7mN9SQDV1KIglnhQ21l/igV5WZTO7AQNG+yS?=
 =?us-ascii?Q?8UGddoHuJRpcGZQp2btHSy88B3yen7vUBRzQZobWV8LDjIhXO+zYNa9qBuoE?=
 =?us-ascii?Q?dzTXuT9pNCw5/LW7sUxmx1RmdFK5murvxvxR17R5s+cpR2yZjADgFbfJElRt?=
 =?us-ascii?Q?hWLnzPFJWNzfkLdfOg5AUbMIk9C8LgaOy+LA7agbf4Tf5DHuc8BM9H7EDN+D?=
 =?us-ascii?Q?tPabPpdotxNjuPobWLsHoqFemOhNm57+LFa+K3dDlkoiY4nTeJf9gh2zCN7Z?=
 =?us-ascii?Q?OzEKgyLDAO8f42PVFOTkjFz7jS47oEcO5uIf7JFo3+DOTT/7+8OGuoon50G7?=
 =?us-ascii?Q?xebCR3opShiASuEmvPQV1PVBThJxiiZpIJc1Vbezvq87r6ZXVsuXvQwcD3sb?=
 =?us-ascii?Q?yJK4Pp81MMnOxRMASv+WushpHDr5DJerIlS/qIgdgQBjgxKfebcRXMqswZg0?=
 =?us-ascii?Q?zi0rcPf1quKoU6olo/SEzjNZ5RuhSzC9IH4es4py/J/xXxznOUexi6mcPymi?=
 =?us-ascii?Q?Wy3Boxy7aF2qEccaLi4XwUAK7c+VLOIRHlgVeUKmQSJ27oCXZrCrE/tt7zX2?=
 =?us-ascii?Q?lxoqIRXJkoUHYYKYiVNsEUKJfU1Nawwhb7eAeVRxCjvq0h1wduObrZLk2g2e?=
 =?us-ascii?Q?FfMTNL4xRegkkuIwyVmPwMRtNkBOmnSJV0QZuroTP6r8GF3rW9oMbtZg8Kc?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XxpLHTwRsNHEDuwGM1gH6steXaYdA2fR42kcDszJigo9A9vDGZ7zPfCuoBLn?=
 =?us-ascii?Q?sJB8WhKPCtklcLFBxjZM0fXKmGFJN6hgg6Mgsb+Z43QE+oh+c07uYYI+bnld?=
 =?us-ascii?Q?P+OZPcy3D7VbctINaId8/xXIPES8Px75+FaVpa8bfDMAOAZoxhKUBGtzlGgo?=
 =?us-ascii?Q?0KBCRyZINjz8E2SWD5ihdTOV74kfC9HEF/OolH2anOn7hh+cEtvxVb/6EiZh?=
 =?us-ascii?Q?oDmhZk9UzfxHTq33u4d0WChS+tyde9pSv63tYt4gVx9AWfLE6aKxkXLgfw7s?=
 =?us-ascii?Q?dnKaz24OU/vWlLGsk/9l244kwB2KgJZE2vGasF0rtNR71ptJkqdiyp5njsoL?=
 =?us-ascii?Q?gijSh78OxtF+TrhPADIaYS0x0Tzyyc3KRdvcV1YdZvTmhB7+vH1/3ghveU95?=
 =?us-ascii?Q?xZFSn5gHUXFE7Wmp09xI1tGXiKoLZc+4+/7L+Ry/gQp2O2FTg9DnvZPnzyR1?=
 =?us-ascii?Q?RGHl2Ckhl1dQ1rE4X21cZDCOsb2exbsnmvmj5CS/TZADFJi7IZipYkiqOMQN?=
 =?us-ascii?Q?EPTWqOZRXAT0deY+g5yTVHjsUSTkDGKS1s3RUo3v/K5xf3WKk2marDrMo7na?=
 =?us-ascii?Q?7r5q1uZSRLlMc+rbiXCZhSxp4OLSchVwYDQ4WWe+zMzTycd6m2oaywj9moN7?=
 =?us-ascii?Q?5wb04lR4RnLJzyCgZa3+pcm+EEQNH/Wvbhk/ttnKA3Q5mayPQsevd+3n0uDg?=
 =?us-ascii?Q?KyK1iPDO2rrOmdPCawASabszkA6Sil4Vxbs5ocSHecrarAKXTq4ZSKmIeLM2?=
 =?us-ascii?Q?UUSqM0G5/O1+xmflJosah6Xx9nQJ9VUaE2HWjVHtwqIowPSRZvaidvK07GK1?=
 =?us-ascii?Q?8DfPeL4MPbpaWuO85+PT8sqguOnxBGYoho/zoMv/05Z7HFwca6kOTRaYtIb5?=
 =?us-ascii?Q?MdmWhoKD8LVzqEtE7Dhl84WlxeHf8tgfCCaZI98JxJ/AG04VQgxGu/5t8cmG?=
 =?us-ascii?Q?/RYCwjSa3IEnWZOyBT26hB24SQS/UAAvwpC8nU9TmE/tJ4DNKK75vThVt0PO?=
 =?us-ascii?Q?6oH6D7VtKD6JG4Q989U9O66MmqNtvZG/kAU0pL4RQZjxIL29VTnEzyN7PD+0?=
 =?us-ascii?Q?I0zLMzuWrZeqjAAR/+tdROKxom/seLMugezl1HqYGbs+/hvEb/XbYVm7wSkg?=
 =?us-ascii?Q?Gr8qhes25F+j2VuPZtfJjxA8/yYUBZhbyyC2FwLLsoj/yNON+BS1SHB3gBte?=
 =?us-ascii?Q?j6I/V+JFuEwL3mxO3p1/jW4JU/T+dwzJ2bmOuFR5bw2jEsl+VfMOotcsxf1K?=
 =?us-ascii?Q?JKKDGpJo3pxupPfVxlgrEsjgp8lUMSHdMAxrGEzViCNs7bTJtd/1M8S7BtZT?=
 =?us-ascii?Q?+F68oq66ao2iCAymZRQ8afjS1Y4j1q0rYAPdt1UsFNSSTjaZenyvmPYwroZf?=
 =?us-ascii?Q?b6GbzWZN4CBOGhwDLxs/5cq8nqFkstDU9Aq+Y1TJvyjYV8LhHjjC1+bp+d+z?=
 =?us-ascii?Q?Fmp0crSh6DiOOlrQMsrEzaAoKHhqLpeW/1JSxKr+InOHGewkiqP/QwFBnXHC?=
 =?us-ascii?Q?YduKqbYamJCRvPqsblJGEv4MpFFNJeyngJWUUHFRjLm/Df+tqRONhOfm4jav?=
 =?us-ascii?Q?YTzVCSkN+Tc3xkO8KzxSHZNYbykatvIZFRpz7X3WqECe6qqwCeQOsVl/W7RM?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1888c661-8ca4-4b15-9a33-08dc608a7f90
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 16:05:14.3119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AI7oPwz3Joq7BdWeURGzihMqxqxaDwPiDjrwV4TiF2BXFrQpVQEtaelI/qwMMOmRI2hNszG3NGgbKSkO+VSdd9JHPtmFSTJVhijrKzFMyco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7902
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

On Thu, Apr 18, 2024 at 03:27:20PM GMT, Francois Dugast wrote:
>Hi Lucas,
>
>On Wed, Apr 17, 2024 at 11:07:54AM -0500, Lucas De Marchi wrote:
>> On Wed, Apr 17, 2024 at 02:50:45PM GMT, Francois Dugast wrote:
>> > Align the XeKMD header with the current version and add the L3 bank mask
>> > topology query proposed in this KMD series:
>> > https://patchwork.freedesktop.org/series/132075/
>> >
>> > This series first includes some patches to align the XeKMD header which
>> > have already been reviewed but not yet applied, from this other series:
>> > https://patchwork.freedesktop.org/series/131816
>> >
>> > Francois Dugast (4):
>> >  drm-uapi/xe: Align header with drm-xe-next
>> >  drm-uapi/xe: Define topology types as indexes rather than masks
>> >  drm-uapi/xe: Expose the L3 bank mask
>>
>> no, I don't think we want to merge these as is in this series. It can be
>> used for premerge testing, but this is just reintroducing the same
>> problem fixed in patch 1.
>
>The first two patches were not meant to be merged with this series, I
>should have made that clear in the cover letter.
>
>>
>> I applied patch 1 locally and then did a diff with the current
>> drm-xe-next:
>>
>> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
>> index 4353595a4..0b709b374 100644
>> --- a/include/drm-uapi/xe_drm.h
>> +++ b/include/drm-uapi/xe_drm.h
>> @@ -518,9 +518,9 @@ struct drm_xe_query_topology_mask {
>>         /** @gt_id: GT ID the mask is associated with */
>>         __u16 gt_id;
>>
>> -#define DRM_XE_TOPO_DSS_GEOMETRY       (1 << 0)
>> -#define DRM_XE_TOPO_DSS_COMPUTE                (1 << 1)
>> -#define DRM_XE_TOPO_EU_PER_DSS         (1 << 2)
>> +#define DRM_XE_TOPO_DSS_GEOMETRY       1
>> +#define DRM_XE_TOPO_DSS_COMPUTE                2
>> +#define DRM_XE_TOPO_EU_PER_DSS         4
>>         /** @type: type of mask */
>>         __u16 type;
>>
>> @@ -871,10 +871,12 @@ struct drm_xe_vm_destroy {
>>   *  - %DRM_XE_VM_BIND_OP_PREFETCH
>>   *
>>   * and the @flags can be:
>> - *  - %DRM_XE_VM_BIND_FLAG_READONLY
>> - *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - Valid on a faulting VM only, do the
>> + *  - %DRM_XE_VM_BIND_FLAG_READONLY - Setup the page tables as read-only
>> + *    to ensure write protection
>> + *  - %DRM_XE_VM_BIND_FLAG_IMMEDIATE - On a faulting VM, do the
>>   *    MAP operation immediately rather than deferring the MAP to the page
>> - *    fault handler.
>> + *    fault handler. This is implied on a non-faulting VM as there is no
>> + *    fault handler to defer to.
>>   *  - %DRM_XE_VM_BIND_FLAG_NULL - When the NULL flag is set, the page
>>   *    tables are setup with a special bit which indicates writes are
>>   *    dropped and all reads return zero. In the future, the NULL flags
>> @@ -1085,19 +1087,6 @@ struct drm_xe_exec_queue_create {
>>  #define DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY               0
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY              0
>>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE             1
>> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT    2
>> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT           4
>> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER           5
>> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY            6
>> -#define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY       7
>> -/* Monitor 128KB contiguous region with 4K sub-granularity */
>> -#define     DRM_XE_ACC_GRANULARITY_128K                                0
>> -/* Monitor 2MB contiguous region with 64KB sub-granularity */
>> -#define     DRM_XE_ACC_GRANULARITY_2M                          1
>> -/* Monitor 16MB contiguous region with 512KB sub-granularity */
>> -#define     DRM_XE_ACC_GRANULARITY_16M                         2
>> -/* Monitor 64MB contiguous region with 2M sub-granularity */
>> -#define     DRM_XE_ACC_GRANULARITY_64M                         3
>>
>>         /** @extensions: Pointer to the first extension struct, if any */
>>
>> I seems we don't need patch 1 and 2. We only need the commit used to be
>> closer to drm-xe-next.
>>
>> include/drm-uapi/xe_drm.h should always and only be updated by copying
>> from kernel from specific commits documented in the commit message.
>>
>> WIP changes while the kernel side is not merged should be moved to
>> another header. Traditionally we used LOCAL_* defines for that. But that
>> comes with its own problems as it's more work to  go find them all and
>> drop when we sync the headers.
>>
>> What about doing this?
>>
>> Add include/drm-uapi/local/ to -I in build system *before* the non-local
>> one. Something like:
>>
>> meson.build:
>> 	inc = include_directories('include', 'include/drm-uapi/local' 'include/drm-uapi', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
>>
>> Example content for
>> include/drm-uapi/local/drm_xe.h:
>> 	#pragma once
>> 	#include_next <xe_drm.h>
>>
>> 	/*
>> 	 * Local definitions - delta with WIP UAPI while the upstream defines
>> 	 * are not yet merged. These are supposed to conflict whenever the
>> 	 * upstream header is updated and break the build. That is intended.
>> 	 * Commit updating the upstream header should garbage collect these
>> 	 * local definitions.
>> 	 */
>>
>> 	#ifdef DRM_XE_TOPO_L3_BANK
>> 	#error "Already defined by upstream - remove"
>> 	#define DRM_XE_TOPO_L3_BANK		3
>> 	#endif
>>
>> The ifdef + error could be optional as it's harmless (and allowed by
>> compiler) to redefine it multiple times to the same value.
>>
>> Thoughts?
>
>Neither this solution nor the LOCAL_* defines have been in place for Xe
>until now, so is there a particular reason to introduce it now? Not

patch 1 tries to fix something that only happened because neither of
these solutions are being used.  Then later in the series you just
reintroduce the same problem.

>questioning the benefit of doing it and I am all up for continuous
>improvement, just wondering if I did something different here.
>
>The proposal looks good, once it is in place it will be easy to add new
>values. I prefer the stricter but cleaner ifdef + error to prevent
>duplicates and to keep the local header to the minimum. But I will let
>others chime in especially if there are lessons learned from i915.
>
>>
>> If we don't want to decide on this and you only want to unblock this
>> test for the kernel addition, then maybe just do the same LOCAL_
>> approach currently being used. See e.g. lib/i915/i915_drm_local.h
>
>Sure, will do for next versions until a solution is in place.

just remember to dedicate a xe header for that, don't conflate with the
i915 one.

thanks
Lucas De Marchi
