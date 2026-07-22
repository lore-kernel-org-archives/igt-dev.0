Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D56C44512
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 06:24:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D2110E2AC;
	Wed, 22 Jul 2026 06:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QxjxVejl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8F310EC52
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 06:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784701413; x=1816237413;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pWfyW41KgjePR2BQ48Q8jjG/+y5YSZ3pylqFqruWHQs=;
 b=QxjxVejlpMPRPnUNjUXdBSobfOBqYsWfpzp67N8YDx3dPLwG9JgSoxPv
 3E1k8v+pZf1hoJb6SmbeqPNjLZICyHhu29pwBRSetbWMc6f+qb59sxIW9
 e9PROGXCKqKsZGy+flP+9dOLp8rebbxyu2y8PEMnMUKoLG6hhlsyWCJVz
 wTAJczTaSki9AFI1QLRDus9DG0MjeJiU04neid6BidL2QWwX7Puk3h763
 dLlscSv+GvrKjtVT5pGxeqoVsnH2mBF54zyfZIwFRfqYdvY5eZFAfXxUN
 +f3sIE+mXdmaDs7MxtpDKvY1x+hPC/f3cEQPcVqYRsRwsp6DSzBBPcppZ Q==;
X-CSE-ConnectionGUID: n9Dve43/TQ6yxEDRP990aw==
X-CSE-MsgGUID: ++8CVjTDTcy3wgcnevuYlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85268162"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="85268162"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 23:23:32 -0700
X-CSE-ConnectionGUID: vrSySvcASbeAW4BvIV61Rw==
X-CSE-MsgGUID: 6er0k8ruQQSmf7uouoAQ2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="262930809"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 23:23:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 23:23:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 23:23:31 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 23:23:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4UK3AlGkCwSIMNRGaTONQv++NAJJODpeHv1zV220cKosU0jRWJzMCYcy4L3wPH7wLcDZFwIedxgBI21LMtZ2LnEShBP6LwLE86+e3o3x0niLSOMEYmd+MHSAh90wKba1NSDP6IsFJJyVyUtjtVpXoE3Pky/9zikHaXgGxdx6lyIVLbgIENdqmrfUsHCu3qo629k37ajyAk16EL0BzaF9QUPRgbG+LOMSiQTfanQhx48Gak1Xl/zXa5NbEOI8GJS1nniyJBGyj8iDfS5kZGtuWiaNzVZDXhPmw1bdKS3MorGhNtv87/7gJnjvBHWwnDu+rlKApJNEP5eF/eJOvwmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMVB91KRQSLE3YRA4/SUiY442vEWnBPSu5AbVPize/U=;
 b=Qn8FJyDo88c0+4yJiPk+VmJU2vwR7dwX5xNiulJ7j9xF4YNRmrV7AD1Vm3BvvsNn0eYA+B9pRyN2gMdUKqoBtjMepJGLRjBO+JmZ6+mVnlp1/vbb0U9ttzpjQCd7Tl1XVwyZoGCG7vcw7o9FAngM17miGoQlzHoXcUFN3Lwth5wF1cB3c3/pIBIEKkgPFuIPk2Pi5CY/04iYvavTJWUIMbO3qAi5sWjXMNKdRLWSYyCzVtI8xU3QYUsuXeA4t8O95fiycqIrflkry3u563cUslba/NwxndfJW4p9R2MUbMTz/jM6io1G2EjXzTHy3kPm5NLoK7lhfDX7ZHXMHNbSYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by CO1PR11MB5139.namprd11.prod.outlook.com (2603:10b6:303:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 06:23:28 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%6]) with mapi id 15.21.0223.015; Wed, 22 Jul 2026
 06:23:27 +0000
Message-ID: <7a0afc4a-0d28-4dba-8ab3-e06886053f88@intel.com>
Date: Wed, 22 Jul 2026 11:53:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] Revert "lib/kms: Set
 display->has_plane_color_pipeline automatically"
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: John Harrison <John.Harrison@Igalia.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20260714144532.351294-1-chaitanya.kumar.borah@intel.com>
 <88217722-843f-46b7-a2e5-a05262243b4c@intel.com>
 <63abb020-7f9a-4974-85d9-d9a7f3a0dc81@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <63abb020-7f9a-4974-85d9-d9a7f3a0dc81@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0250.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::11) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|CO1PR11MB5139:EE_
X-MS-Office365-Filtering-Correlation-Id: a794b767-dc75-463d-b09c-08dee7b9bda1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ZqJPiYb+f31oIPRj+Vyoh3EIseF7MgABdHqBTbA7+gta38CXyCwWPkb6G4XLyt6yR6BM26byS/Y/s4jJeB7IpncsZxuQQlJXCdyXafet9kXNn046/mdQYbAQHc93vhYsTV2SsbZiZKTGEGKCjt8m83yTrAA/tZBnKiB5CRJ1KHz5TlJVfb8tmyQardFuH37ZklhIcKlEvt/1xBIJdzZE5RnvMbJ+c/KvRj4PrU9y/Xqa5nDeFw+EnclWB90QNWH5PnXyVwk31tfItpReA+vCaaQcPHaoaBmVnWn8zoBINjaX2/h910/7kAlvk9Doi02nHUX3BsuBa5N24o1OW01y/7lyMfRYLYdWmJh0VTPOm/5VfXnanvB7Z4DH4wBdk+kKrF3Rkk0BZjLtYHkvdseWeh5fMs0Fhofml3SI/eyyJU57G/YF7xuyo/s54NoIi3wX8CAtD+cdYTgkYIqJaS6m8YtfQ63g6TMaKAkorBQMEkBEFBEvcSLD5ABHwy1yWFUNo4oDjLGQAHcS5ivivC0td2wbG5BA2BFI9HFBo0N9LQq7sStzCDLfQM4jwTvE/9jwBX2Uy3lFwb5Ui/UNcvliDKsdqpxd5gsFkYuBneuvutY9RJGOW38tzjoWDARLWy6ieM8WvVd7Olk1Ss29Rgj21CQUW71fxpnjHGm2usEQdME=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmZHcGVQM1ptNmhPT09YS1RoQUh3RWVlL3Z1VGJYUUJaeE1nUUh0dmM2a2ti?=
 =?utf-8?B?MGgvOCtXN3JyWHdGVVpieGpVMWhiVUY4QkpyWkVqUE5jYytwR0FiR0dnRVlL?=
 =?utf-8?B?R0ltRWg4ZXlYd3JieXowVzI0Y1F4UGVBc1o2L1QrZFo1UTFNbTBzSTNVL0N4?=
 =?utf-8?B?QmhjaDdDMExkTFlxYnV2eGMxdlJVdmJ0aFdTalNHbzZJUWJnNlZxQ2wyNTIv?=
 =?utf-8?B?ZWg1cUFBRUVXV0lvWCtEZmZSL2REQTNQc1hXTktBdGZYbjk3cE5mc05DY0RR?=
 =?utf-8?B?MGdkUDNVV3hVU01Mb1BxbkFqRnorYWhKMk44T2dsTUMwci82M2lYak4zV1hh?=
 =?utf-8?B?TlZrcEtZTWxLaVE5VGEvdk9xRHgvZVJwMHF6bnRIZkZMbklMdFNCS2Z3NnZ4?=
 =?utf-8?B?MVlhYy8rNW1XMEI2eFZFckpDYU1GMW5JUDQweFBDdHE2bElJN1VuNFJsK2Fx?=
 =?utf-8?B?ZkRSM1JUT2tsRWl1cHkzTThwK0V5M3VzZ2s2Y1dMTnk4cjlmZ0VIK0JJM2VP?=
 =?utf-8?B?THd6alFKbk1oTkRIL3VDTTY1djhTb0JMV0J1NjNqUFBhRjM2ZU9sTmlwUTlJ?=
 =?utf-8?B?TFpxZjJqaTF4WThZbWsxakZwQTVzRlJkekVpdVpzam1YN00yVGptbktSQldr?=
 =?utf-8?B?VjJlZVZadXRCWVdBNng0MGx6cFkwQWw5R2JpRTdqVzYzWW4yVDMzdzhxRGRa?=
 =?utf-8?B?WXYzTkwrTUdpVVdQQk9hdFFCSk9PM0dTSU83bWE2M0JFREFNdlloMEUyM0k3?=
 =?utf-8?B?NWFCUTlHUUJ0MkZFQXh3Y09CM0kycitsS0RyYmhMZ1hvTW0zUGdwSEMxQ2g1?=
 =?utf-8?B?OEphck42Q0pMRzUyK0VwVDhSTjdhdXN1QWw0SlpLaXBzZzI3dXIvUXBvNENH?=
 =?utf-8?B?eG9lakRXdlF5Vk9UOXFmREd3WWRpbWFmUjF1akwvLzJEaG1MTWt4cjFrbnV2?=
 =?utf-8?B?Wi9OcXFhaE1VQURENk8wcWNYSmlGVDVjcXJuMytXams5T2Y0T3IvcWM1VmtC?=
 =?utf-8?B?UlR2aFV2TVBSNEZ5VElNaVR1UTMwS24xczJnekR0RmI0aW5FdHh1MGg2a29i?=
 =?utf-8?B?R3FxZnQ5eU56c2ZHSG9DbGNlUjhGRkpXMStuN1ZGL1AvZFlXU3hPQTNXRFJZ?=
 =?utf-8?B?WEV3ZXJzdkpFU24vaENUQUZDK2E2dFk1WW1iSGs5bjJ0SVo0YmJEVDkvWGlR?=
 =?utf-8?B?SjV2RE9VRXlPNjEvRkdLZ1B5UHFDYXNneDduamk0ZnRPc21NR3hOWkg2eVdT?=
 =?utf-8?B?QkNRcTZmY1JES1dpZWY1SllSd0tHWE9wODhpYXRpb2NEWVdFRno3bHRtRlc2?=
 =?utf-8?B?T1JneWltWXZtUmdVMWxrQkFrc0RNMHNqb1dITGowUDE4dHBONHVycTF6ZThh?=
 =?utf-8?B?UUlhaEppNmt4NzlGNlJGTWg1QTIvRzNHekxsc0ZGR1RGTGxzbHE0NlM2b1VX?=
 =?utf-8?B?L2pXNDBGSVAwVjgwWkNlYVBRTGt3bVZLV2NQcGxCM3huTEpmZ0g0U1JMMyt4?=
 =?utf-8?B?YlZaeFM4Z3NoWGRBQnJ4dUx2Y0hkWW9kQkVXRmd2akwrMG9jRXNjR0xqR2h3?=
 =?utf-8?B?N2hoY3FoNFhBcjVWalQzdjVJZUFxQzZCYjBnYURqTnpNdGFyWVlRU2Q5US9k?=
 =?utf-8?B?dXZaVW83VVFsc3RnSzJNUWNYaldyeGNOb3dXL3VZdEpheGZiMVFzNWcxT2pD?=
 =?utf-8?B?N2Vqc3kvaERGZndTSzlLdUw2VHRhTTFLU0ExQ3JJS3B6Y2hUVUlRUXVTQWdT?=
 =?utf-8?B?bTI3aWszMENyTW8wb0NLUVBscStUc1pHVTAyU2o3MGFFVU5VeDl0RG5jTGFm?=
 =?utf-8?B?SUdIMGpuRVgzRm9sOXYyOXphMVJTUklTRmdCRHJrVGM5VkhNVEVxQTF0Wm45?=
 =?utf-8?B?RnZOMjR2WjRsdzkwcmJ3Si9qV1orbFR4ZG5yWUh1NTdyTVhTajc3cDFrbzlN?=
 =?utf-8?B?REN2WW9HVXlTK2tXU24yT3dWeXJwRnNLYlFvSkxMbDN1bVNaQjNJMnRLY0Jt?=
 =?utf-8?B?em80MU9PRElUMDlUMGRVbFBmclFrM2lRdmZYYksvcTBLTzhLVUpqVDZ6amRr?=
 =?utf-8?B?aXhCc3V1dnFzZGNQUlNxQW56SGdHSTZ5TkNIT1V6eVcyWFJSVjdON05IVUlT?=
 =?utf-8?B?R3lrWUhMeU5lUFJCamdiSDRJWVcwd1YrbjBoSW9IOEprN1VZWmV5bC9BUkZS?=
 =?utf-8?B?Yk5EMlNnc0RVbi9ZSTNwSVR1UFI4d2M3ZHhKamZFVHFydlBORUxIMmVxNE5J?=
 =?utf-8?B?a2tBdEdlVEduNDBDM0lYcDl2clJEWGJZNDNIYVZjNkVUVEZOUmUzdU5iSGJC?=
 =?utf-8?B?dnZCL1ViVTBOcWRPM0FhMHAvbWt3OXRhZ3Y5QVM4ZWlUZy9xQm84UT09?=
X-Exchange-RoutingPolicyChecked: pZHRNy6q+kK6ucs7K6B2FY26+28OUwBm80RMnFcmSJVvLTKP5RXrX3KSKYRnWmCfOovz/UNHzOXj0NeFtERIX7qTn1o041KkGOB8Zhx3ogFNXaXZCPoLlVj87+izJNXFZwltOeoB+bXfORXRZNeyenWCyDULrmPxwgU/rVgnX6tbXx4cUcyNuL+hsbEc2ie5iMuImUCE+cELPoGIJBg0DjMkYgdhscsPMYAXC1Z2fQpuPJ8fqOH0Pbpky0NiIlC96pACQPEJR7kBR+aYZoiK3wAYUkkZ4RsLpaPXOzB5r+RlEbPqQqlU96AicKErYTdYNIx1aNigQREzc8BmpyMnxg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a794b767-dc75-463d-b09c-08dee7b9bda1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 06:23:27.5645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s31l4SfzTTsNMRJFzSqxc5oUn8UTa9ytdls13uGME38rFGjq3kUAxRR7IEyptAJkulgf6qqOlDwA7ri6r1u8ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5139
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

Hi Chaitanya

On 21-07-2026 04:30 pm, Borah, Chaitanya Kumar wrote:
>
>
> On 7/21/2026 4:25 PM, Sharma, Swati2 wrote:
>> Hi Chaitanya,
>>
>> On 14-07-2026 08:15 pm, Chaitanya Kumar Borah wrote:
>>> This reverts commit be4e98c3b79e8bb843f7bb762616742691fee72e.
>>>
>>> Enabling DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE from the common
>>> igt_display_require() path makes all IGT display clients opt into the
>>> new plane color pipeline UAPI.
>>>
>>> With the color pipeline client cap enabled, legacy plane COLOR_ENCODING
>>> and COLOR_RANGE properties are ignored during commit preparation.
>>> The driver cannot distinguish this case, because enum 
>>> drm_color_encoding
>>> and enum drm_color_range do not provide an explicit uninitialized 
>>> value.
>>>
>>> Revert the global opt-in and keep the cap enablement local to the
>>> color-pipeline-aware tests. kms_properties colorop coverage shall be
>>> preserved separately.
>>>
>>> Cc: John Harrison <John.Harrison@Igalia.com>
>>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>> Cc: Swati Sharma <swati2.sharma@intel.com>
>>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>> ---
>>>   lib/igt_kms.c              | 2 --
>>>   tests/kms_color_pipeline.c | 5 +++++
>>>   tests/kms_colorop.c        | 4 ++++
>>>   3 files changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>>> index 2eefb773b..c56127c42 100644
>>> --- a/lib/igt_kms.c
>>> +++ b/lib/igt_kms.c
>>> @@ -3201,8 +3201,6 @@ void igt_display_require(igt_display_t 
>>> *display, int drm_fd)
>>>       if (drmSetClientCap(drm_fd, 
>>> LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
>>>           display->has_virt_cursor_plane = 1;
>>> -    if (drmSetClientCap(drm_fd, 
>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>>> -        display->has_plane_color_pipeline = 1;
>>>       plane_resources = drmModeGetPlaneResources(display->drm_fd);
>>>       igt_assert(plane_resources);
>>> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
>>> index 6119a830f..78860a845 100644
>>> --- a/tests/kms_color_pipeline.c
>>> +++ b/tests/kms_color_pipeline.c
>>> @@ -349,6 +349,7 @@ run_tests_for_plane(data_t *data)
>>>   int igt_main()
>>>   {
>>> +    int has_plane_color_pipeline = 0;
>>>       data_t data = {};
>>>       igt_fixture() {
>>> @@ -363,9 +364,13 @@ int igt_main()
>>>           if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) 
>>> == 0)
>>>               data.display.is_atomic = 1;
>>> +        if (drmSetClientCap(data.drm_fd, 
>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>>> +            has_plane_color_pipeline = 1;
>>> +
>>>           kmstest_set_vt_graphics_mode();
>>>           igt_display_require(&data.display, data.drm_fd);
>>> +        data.display.has_plane_color_pipeline = 
>>> has_plane_color_pipeline;
>>>           igt_require(data.display.is_atomic);
>>>       }
>>> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
>>> index 4db83470d..16db0b8ad 100644
>>> --- a/tests/kms_colorop.c
>>> +++ b/tests/kms_colorop.c
>>> @@ -418,10 +418,14 @@ int igt_main_args("d", long_options, help_str, 
>>> opt_handler, NULL)
>>>           igt_require_f(!ret, "error setting 
>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>>>           igt_display_require(&display, display.drm_fd);
>>> +        if (drmSetClientCap(display.drm_fd, 
>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>>> +            display.has_plane_color_pipeline = 1;
>>>           kmstest_set_vt_graphics_mode();
>>>           igt_display_require(&display, display.drm_fd);
>>> +        if (drmSetClientCap(display.drm_fd, 
>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>>> +            display.has_plane_color_pipeline = 1;
>>
>> Can't we follow same local variable pattern as kms_color_pipeline? 
>> That will avoid calling drmSetClientCap() twice.
>>
>
> We can but since this is a pure revert we can take it up in a separate 
> patch.
>
> I can float one if this gets approved.

Sure, lets get this fixed as well as part of a new patch.

Above changes LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
> ==
> Chaitanya
>
>>
>>> igt_require(display.is_atomic);
>>>       }
>
