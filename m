Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854B9CED263
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 03:47:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C5410E178;
	Tue,  8 Oct 2024 03:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UnVlWD8B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9261E10E178
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 03:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728359246; x=1759895246;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=plSmhDXJKS3DFYYBpLw7cLJXnN+GIHIaXmSzRKjUxsM=;
 b=UnVlWD8BGeeVMJbCuxTdcM4l1sKfy4mla/sfNdlMMN3LjF5Z4N+G+Z96
 akfMlpMWG5T2LfPdPaVoYjdT+tm2LtU+zi5AKGHC/wh9AuRryOLMOzOAn
 zWMDvvGWpjwezCA6ZmnDf8c05qcK4Jwvaj53AAu12JTPJgjVtF1/nkLz5
 JjgOUoXrobEm+GdFkRTvcA8odr8gX48CJk4Yme7oaSAMMTJzGnbx8jBDk
 N07vpGYzg1aHOiUF3O+fnnPGehGsxf1Amj4By89yDnZQnIqxk5HmT7Gb6
 p5g4GyP6rhXFu+Btp0HbTiwdMoOYPY2fgTBG5U4yqqGSWHuy4s/VnsbmO w==;
X-CSE-ConnectionGUID: Ut1ebgeuSvOxGQrGB1iC/g==
X-CSE-MsgGUID: UAvEdhRiSBi1nMEwROQVeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27618352"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="27618352"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 20:47:26 -0700
X-CSE-ConnectionGUID: 1/CxI6XrQPeulu9QjCcQ/A==
X-CSE-MsgGUID: lPP03NreSACSzglp4jWbdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="75936332"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 20:47:25 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 20:47:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 20:47:24 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 20:47:24 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 20:47:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 20:47:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4yZTIJhd2XjQgMWsHvAD+7nwLz0n/+jVdQty/mV+23itIBLS1zp0l1nTns0WqegDpmrya+uE9wTNk2yt9N2rObgZz6auITgJVxnO4jMJOEWsyEgoYX1BPothG6ag0cCcJGnIlMMnsgque1Cn6AFqEWMJwxDjPl8PEHVdqM7yNdeTIB9RNXYkF6fwoKrmkhAXzXpCU3hzEWW/6K9rVcvIiYvC/8MT+tZC0pwLknlwMrTYyrNqpkiitwyoCScjZWcmYlssMNYwsPaYufnEOmnovAy/Gsb+utgChxay/ll9l1lonLEdzITEXvaaOVvn90nPCO6cc0DLkD/IDEfqxa2Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5qLSn1dtT0F2KcrzQ006bTflql5yxlHARVlQtyF11ow=;
 b=UHzWYOV8jeNpAAYpR+WMC52IibV7E0ZHLlx+eaiRDqZGsKBnsul2OtXL1g46Y1/SozMlXY7zkS38Yg+BEMEpLBmhp3sWwQlpRx7m0vYtF/k1RQns8CcMTN37IJ/1D3sJi6CnrEiDsJVswc4W+YwBGi9QBoUVjHT9ZMcozUOXYnxq1PYtCT1BNiDqLM9yMbtNcme9WsFap+JMl4NLNnideGXX5PXQo4OGsryEK2eRp4kCK+jaftrE47F/vg9c+qBl6eBu/JMShlOvrho+JQow8DcdPcfYthmHZSlEPQfbNO2f5bzH5MxTpppUF0PeUAyCMrDts2KbiqZapb7WP45mtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7762.namprd11.prod.outlook.com (2603:10b6:610:151::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 03:47:21 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 03:47:21 +0000
Message-ID: <5f774c6f-e9bd-4c71-9606-bd2ff0117873@intel.com>
Date: Tue, 8 Oct 2024 09:17:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add an
 assertion on MI_STORE execution time"
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Poosa,
 Karthik" <karthik.poosa@intel.com>
References: <20241007172356.1747943-1-himal.prasad.ghimiray@intel.com>
 <CY5PR11MB62119CD942646EABA7CA5D91957E2@CY5PR11MB6211.namprd11.prod.outlook.com>
 <cc7c6fab-6310-438d-90aa-d7509f06192f@intel.com>
 <CY5PR11MB6211966D197F77629AC4C209957E2@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <CY5PR11MB6211966D197F77629AC4C209957E2@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f60c792-257f-41d3-7ae6-08dce74be9d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azdST3dGU3U0U2Zod0hSSnpmd1h0V3U0VVhaUG9NMjFlZHZObUJkZ040YU03?=
 =?utf-8?B?SUFsR2syV2RlWmgzYi9GWHJUODd1MVhNTzBCbUhpblp4ZTdha0g4ZW5IaWI3?=
 =?utf-8?B?SnNkYVBSZEhOME9WRy9MYjk1a0RsdXlxRS82RGlDTHJXQ21FUXcwOHpQV21N?=
 =?utf-8?B?UzVOWlF0VXBabk40d1V2QllGSU9oeTBieVRNVzNzbDJkOWkwTkVYbStrZ0wr?=
 =?utf-8?B?MzRqQzd4YXRGNHVWSXlES2xLb0c1akR1R3luSWVrWVc1Z2MvOFVOamlWU3RU?=
 =?utf-8?B?TTZtUzdaVklIM2V3dkVPV3NET0IwcWNGT01YbUZ1WHBJdjVDZ1dselBiZ3pK?=
 =?utf-8?B?SnpXOHF5QnNENldBRzExY3VkWGoxb2xhWEtBRUxZOTc2VGY5enBqQ0RXMko5?=
 =?utf-8?B?L0dUUlM0Uk9hczZvWXRFSjFQM09TWUJ0RkxrK1JTVFBlY1JvckhHdVlrWE1H?=
 =?utf-8?B?enhMc2FvYUFYTUtpb3prTERVWlVZUCtmODEyQmlSekJwenFVSFJzNDQ5aUp1?=
 =?utf-8?B?T2JkZVptakhwblMxcXlWcEU0cDRsUkRVMStZazFoUlArR0lWV283NXNTQlZD?=
 =?utf-8?B?RFhwdUU5Z2UrYmpIN0dlVTRib0lzell4aHMwMDZhRDlBS2ovNXFxZDlFck5t?=
 =?utf-8?B?VytFV3IwTndMTXRja3h2cW13Q2QvajdwdWgxbEN2OFF0NUx1NmtRcnNPeUFv?=
 =?utf-8?B?WHFkYmtabEhVRXpXKy9KT3kvM2xQeUwyZWtBc2I2QzE2NkFwS3ZLZWRIOWxq?=
 =?utf-8?B?TVVYTy95QjUrbkdjcml3a3lKQkhwMmlKaCtrN0tvakJFRnFYQWVIOVR4dmpF?=
 =?utf-8?B?QTN1Q2wzMEQ5RGdxai80STVvT3puMkoxT2pLR1RnakJLNXR2QVdtUzAwWVVa?=
 =?utf-8?B?SEd3OGhDNFQ2bnVsZVM4K3BuSVQ5dlk2a1RmU2hnUk9GTGVWVDhrV1F3eHpP?=
 =?utf-8?B?RlhvODNLU2JnZjBTS29lZFlLWXVpTVJhbWVCSWVMQUxOK0FyUFFIMFJqSldM?=
 =?utf-8?B?YjFhSU9kZ0c3SEd3WHlSdjYyQmg4L3JQeUxYZEpQZms3NitlR2FiYjRJVjdU?=
 =?utf-8?B?ZHo3UTJTWVMxZ1dkWmNBc1k2TkJWZnBZMXpDSXUyVXNWRDAxYnVuOWFRTENO?=
 =?utf-8?B?bSs1MEZZWlNNdTFQM21lZHEvMWRlbzltTlpKWTgwOFcvNksvU3ZmNllQWWVY?=
 =?utf-8?B?dk1kWWhXYkxOSGNhcFFCL3pJK2premx3NE5oTEhHdDJKcHkwTE9kVTVycWNY?=
 =?utf-8?B?QVh6aUQ4d2ZYSU1iZElPWE1MeXFRTzh0d0dJbE5vU3loeGFrVUN0bmFJbThS?=
 =?utf-8?B?OGZaQjZ5eDkxOWxnQS9tcTFGd2ovR2w3Qmh5VUtjUVgwSGlrNGcwTythbVNJ?=
 =?utf-8?B?WmV3Z0RLdmtUcWZDWGRrdk1hUGlSUk5McnJYMTNoL2xYc01hRkh3MUJSWVpO?=
 =?utf-8?B?Zld4Yi9UNEY4bk16b1lkNFMwQmlOZlVnY2NjOTdzR2NQRlQ2Q1ErNERKSzhB?=
 =?utf-8?B?NHBKMWF4bVRSNHNxZUx5NUlka1NncnBMeGNDYlNCcEt4T2JIdDRXTkRNUEx6?=
 =?utf-8?B?UVRENDVLMm96OXdBbkgyeVN5dFFHYnhqNU44djFheUYwUFJKUXpYOUlBV0x6?=
 =?utf-8?B?UW1KMHF1eGY3TlpLa21ENzA5MjF6YmFBRTdGUFN6YXFnSDdrdXRkYitVZHZo?=
 =?utf-8?B?YkQ0czhmRVdJZTYxRVpvd2pnbEVRWnlkNFZPczl4emY3UHhIQ0xySTdnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXJxVkluaDFHOU9ZVFZHM01RanB6K1gwN2xHWHVBRk8va0p6WUNpdk55VTdQ?=
 =?utf-8?B?cDlobUJQUG0wV3NINTVQb21Uay94bVRvdVFsSEZEei9RRERJMkJVN0pGbmlG?=
 =?utf-8?B?NVlaUExYbzZwZStTVzR2Y2JETWpKenJFTVhTdlh3YkV2bUhKQm9iSkh5Rzl2?=
 =?utf-8?B?ejMxbmVFYURKM2E1bUxmUktMTXhrblVudlpHajNWekw3RXpETzJCd1RwVWl6?=
 =?utf-8?B?R29pbXNkMFpDa2UyR1FYaENoSmxWa2FFci96RTRLcGhzc0pPYjJYN0hUMFZU?=
 =?utf-8?B?VEU0REFDUGNRN2VZVjRyV1lpSFRCL0ZraHRtcmpJYmVZeWR2NmNCQVJ1VW9r?=
 =?utf-8?B?SVQ0dXBzK0F0YlBQbmFFcjN0NTNxV1JHRHZPdE96TlBuTXVBWUhWT2NtUFFO?=
 =?utf-8?B?Q3hJWTJQR3ZsMUlrRjZUbUZSVGVJMWZtalgwc1ozc3hlUVE2TmkvaW5DU1Ez?=
 =?utf-8?B?dEdiVHlET0F3dE93VG9SbnVONnp1KzhDdjJmWmtZTWs2OTBtaWo2ZjZrRlhv?=
 =?utf-8?B?ZFVTRGlQSTQ2REE4VW1PQVNWSVV3aG1jRnNzQmxKWUhIVzQ0TDdSOXF1dE5v?=
 =?utf-8?B?VFEzT2tRQXR5MnUwV0toZ2JKK2Z6OVRIWmpXTnJMVGdkLytBODZpL2dLUnNF?=
 =?utf-8?B?dHFNUXZMcTVSQUdEZEkveDExWm9hQ05hcEJ0cnVGU2lYN2hlbWI0UEp1Sk9q?=
 =?utf-8?B?WnZ2NVV4NXlzWFhrbWNWcDdhdW5rcmU0aGdpZFV4YnNJcWhaN2dPR1AyUnEr?=
 =?utf-8?B?RDN3bkUrRTBkV3E3Q0RsdGZIUkhZN20zbCtsNHFnakNzSzFLVVBRUXpFN2Zh?=
 =?utf-8?B?V05oNStpWjRhTXQ3aSsyaEQ2cnVKTnB4c0lJc2JpUzNuOXFHWnc0N0o4bDdU?=
 =?utf-8?B?bzBVck5CRldVelZ3MHpYcFhTZnFYQlJ0RVlNcDhZN3lkdEdSUWY1VWdDYjlp?=
 =?utf-8?B?QVZEVy9HZ0FHWVVnWkpZb0VvalBLR1FNUkJOK2NYcERZaTZRdkxQN3pIVUsz?=
 =?utf-8?B?cEd5Kzg4VzZ0WXZibE1jQkJPR0VaQ1FmL0VsVVM3M0lOMDBDL3lLOGt0NUpE?=
 =?utf-8?B?blJXcW9MZDFwQXJKUFFrS2wwR1hIUWZKSUNwclFRYjRLYTdaVEdyTkdPVlhZ?=
 =?utf-8?B?SUI0blFZSW9qWXZhY1dCT0dXT250TVE0TExSaytTNUxvV2dFWXNKNWVuOHhj?=
 =?utf-8?B?WkFvWGdmK2l3SnAvKzBPVnZ0UnI3ZmpEZ3NlOU55QmJBTFQ2WVFlN1p3dFcz?=
 =?utf-8?B?N0FVcWJ4VlFremMzSDduMUZNSUlsQUtpUWRNTVRRYkg0SkZDeU0ySFNESjhP?=
 =?utf-8?B?SWExSnpVT2w2bXlEUmFLdWF0eVZHZmNOZ29vMXdYeHcwdDFUMWNqa2orM2o5?=
 =?utf-8?B?NlhsVUpxdUwzeEFUYWpJeFd5aTdSMWZxbzRINnpPMmVWTThXYlIzV2Rob1Iy?=
 =?utf-8?B?V2J3RmltZ2lKV1o5TWRqNXVTTjVPQVBOUkZtRE1XL3ZHNU5XYWQ4Smt4NGVT?=
 =?utf-8?B?eGlLanJPSmI5cndhMWtRL1BNcTdDZVpFYldaVHJucG1oY2ZUYUxkOE5jb2Uw?=
 =?utf-8?B?ZWpjZndyNHRnc2VScnp5Qm5xam41UXpudmdISzgyY2RickdqQ1BjNmRCd3Bx?=
 =?utf-8?B?d2g5SXZNajVjNExhWjdPTVpKOXdaWHVZNGd0NUUvZHFzNS93VElPdldkdlpV?=
 =?utf-8?B?THJGZWY5NzRIckczV2RLRHF3M2NjdWRLUitnZFFzNGh1cDBXNXNWUGJ4YUtm?=
 =?utf-8?B?bzZUR3hPR0JGK0RLWm5CNmIrd1lkWXFoZFkxRnNWZVYzNlZDOVNGNmdYNk55?=
 =?utf-8?B?ZlZlMFBXay9kSDBGbkorbkZXaUJpNElRcFFkZGtoSkErOWNjeVJxYWdEaGlW?=
 =?utf-8?B?Vnd5Vk9QRFg2a24ydHBWNGF1NVdMdXlTM3BCek42dWZiUWs2UHBkZzhhSFpF?=
 =?utf-8?B?ODhpWllrVUhJd3RwVmh4eWEvL1FEQ282TmpiMlEwdGx2dmYveTY2by8wYlhO?=
 =?utf-8?B?ckJwaGs5ekp1ZFBFTW9OeEkwSmNhTzRNM3RVZFRoNW1NYmVIbTNNbUJNWWZ1?=
 =?utf-8?B?eEdlckdCZU1RbzZweVJDWHFPN2lxZ3VSQXRPK1pWRjNEZ25QazJpU1FLQ0lj?=
 =?utf-8?B?M0tnYllLeEFxL1VabUxtcWo2WnAwT2dJc3ljL2RhUzhlV3R4bnZ5Q3RodCt6?=
 =?utf-8?B?NVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f60c792-257f-41d3-7ae6-08dce74be9d6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 03:47:21.4198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uA+5paw7PwMyFAj+xWiFTwuZEGQ78KXectAKs254z6NX8BbcqvzcbUnaVdpDc8T0UgHH64sCTUEro88gy8Jjhj9xLYtprpe4rEHKhbdTkUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7762
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



On 08-10-2024 08:52, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>> Sent: Tuesday, October 8, 2024 8:44 AM
>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; igt-
>> dev@lists.freedesktop.org
>> Cc: Brost, Matthew <matthew.brost@intel.com>; Nilawar, Badal
>> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Poosa,
>> Karthik <karthik.poosa@intel.com>
>> Subject: Re: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add an
>> assertion on MI_STORE execution time"
>>
>>
>>
>> On 08-10-2024 07:31, Gupta, Anshuman wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>>>> Sent: Monday, October 7, 2024 10:54 PM
>>>> To: igt-dev@lists.freedesktop.org
>>>> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost,
>>>> Matthew <matthew.brost@intel.com>; Nilawar, Badal
>>>> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>;
>>>> Gupta, Anshuman <anshuman.gupta@intel.com>; Poosa, Karthik
>>>> <karthik.poosa@intel.com>
>>>> Subject: [PATCH i-g-t 1/2] Revert "tests/intel/xe_pm_residency: Add
>>>> an assertion on MI_STORE execution time"
>>>>
>>>> The reported time does not reflect the completion time of
>>>> MI_STORE_DWORD; instead, it accounts for the delay in the scheduler.
>>>> Therefore, it represents the time taken between xe_exec and syncobj_wait.
>>>    igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
>>> elapsed = igt_nsec_elapsed(&tv); elapsed is taken right after the
>>> syncobj_wait() therefore it represent the time taken by xe_exec +
>> syncobj_wait, total time taken for completion of job.
>>> Thanks,
>>> Anshuman.
>>
>>
>> That's true, while writing "time taken between xe_exec and syncobj_wait"
>> , I meant to convey in between start of xe_exec and syncobj_wait completion.
>> Will rephrase commit message before pushing.
> Why do we want to remove assertion ? We don't want to write IGT to make CI happy it is to catch the bugs in KMD. Even in this case as well this is a bug from Linux Kernel.
> I don't agree with removal of assertion.

Few issues with this assertion.

1) IGT has --inactivity-timeout of 90 sec, which means you will not hit 
this assertion ever and SIGQUIT will be called if time between start of 
xe_exec and syncobj completion is ~0.9 sec.

2) Even 0.9 sec of delay is something huge for kernel. So why IGT 
assumes anything less than 1.2 sec is safe. Isn't it just to make 99% of 
idle time safe.

This assertion solves no purpose, if IGT silently passes for anything 
less than 1.2 sec, assume 1.1sec (Isn't it huge delay for wq submission).


BR
Himal


> Thanks,
> Anshuman.
>>
>> Thanks for pointing this.
>>
>> Himal
>>
>>
>>>>
>>>> This reverts commit 92825ed72be61c5419d95db944fef1c9dda2215a.
>>>>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>>>> Cc: Karthik Poosa <karthik.poosa@intel.com>
>>>> Signed-off-by: Himal Prasad Ghimiray
>>>> <himal.prasad.ghimiray@intel.com>
>>>> ---
>>>>    tests/intel/xe_pm_residency.c | 9 ---------
>>>>    1 file changed, 9 deletions(-)
>>>>
>>>> diff --git a/tests/intel/xe_pm_residency.c
>>>> b/tests/intel/xe_pm_residency.c index 772fe9b57..f4d05889c 100644
>>>> --- a/tests/intel/xe_pm_residency.c
>>>> +++ b/tests/intel/xe_pm_residency.c
>>>> @@ -144,15 +144,6 @@ static void exec_load(int fd, struct
>>>> drm_xe_engine_class_instance *hwe, unsigned
>>>>    			  1e-3 * submit,
>>>>    			  1e-3 * (elapsed - submit));
>>>>
>>>> -		/*
>>>> -		 * MI_STORE_DWORD generally completes within couple of
>>>> ms.
>>>> -		 * Assert if it takes more than 1.2 seconds, as it will cause
>>>> -		 * IGT test to timeout due to sleep of 120 seconds which is
>>>> -		 * the current per test timeout. Currently there is no way to
>>>> -		 * read this timeout from IGT test.
>>>> -		 */
>>>> -		igt_assert((uint64_t)elapsed < (uint64_t)(1.2 *
>>>> NSEC_PER_SEC));
>>>> -
>>>>    		syncobj_reset(fd, &syncobj, 1);
>>>>
>>>>    		/*
>>>> --
>>>> 2.34.1
>>>
> 

