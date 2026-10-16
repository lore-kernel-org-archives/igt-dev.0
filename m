Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE77CC6B38
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 06:28:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0CF10E1A5;
	Fri, 16 Oct 2026 06:28:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDDB10E2D6
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 06:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792132046; x=1823668046;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CXb6ghpV9GkrIOnG0fHUccGmEuLr3w4Fg4ouz8deLjU=;
 b=YtQ+WXj1d5/+UaJiVToRhlpoQlHtQ1Yrx4zcSyHT4Z3Ws5sYjrAlORI4
 Ab1swf348SffSuahR+QB/pgkes3SQ+qNShv/q7v92+U3jE7Uwq3VlrpSo
 XiDN8yvYSue1+QzIv+fl/Tyvkgh7X/tJzioaqlBb17oSHyRHauQNVfZ/y
 Bdw4ssXYC8x6amQSXFP+IbOmD37uhK0gAlmuwXAnRiQSMRR+7PP06f7GZ
 e+UUGZ9B5U3bv3rZoR2yLuBugKm1dmGY+BKbil/wHL3845Ej9ST7Oy/iC
 LFOyLbK4bQZx0fcpg6hEuUt2SHA9JSjtyHmSsJclGsn5Mw686zM2v+F4W Q==;
X-CSE-ConnectionGUID: Z9nfZa78QwyYc+spZuRL4g==
X-CSE-MsgGUID: RdlsK0xpRnujqvxG7OTDNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="813131"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="813131"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 23:27:25 -0700
X-CSE-ConnectionGUID: KLpXsCpdQEq1EcbtGc12CA==
X-CSE-MsgGUID: OVIKAoDSSKuHD2Emft9+yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1845342"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 23:27:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 23:27:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 23:27:09 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 23:27:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcQrshKLJfi9yeywOyu/WzSIEu0tXS3VRyqJJiQjN+Zi7SoSvM82BkinXxoqRC6HpRyFDPIFs2aiLOaylCQFfTBP2MQ9b5AcNKy+XhItyzsWDfNUhenndTe+FqDdGYUOpLRNv3BHbVDMhPAjmVcRxVGvuuE0T1Y5PatZMjVGQwq6C5mKzi526HCLt8gSZn0O5CjTMywpejWBGrlED2okd7qPBgu/ilW4RPS/cRJpCEiHEHaCMc5HTyiNAvYsqab7/gtPw7WicQs4pumZm3/kJI+Yz0c7mPh1fOC3iylWiVlcQXQ43+d2LKD19WSvA/u0snEyYAnm1f4ZfMUUuH94lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5GKHYPD8uPZNASBLflyRHGbBN2RMHGX6jua1egVFQgU=;
 b=nx1MCGbJgrF12RkeUPMehPZbHQoPtLiPCBDMF/ulqbuFp7EiBPbl3x8RJPxpa9sA4+Q2H5/VQDw2Kg4W//I4FRM/RCa3ccc7xpDCkbX2/FB6eb/rCgke8tDrJFC4Bhb+BVOv4EXTn+DZ1anXicgsnBGkEer0C25hm4+JumJb8xhz1wv1gAo57exIK8UnFk/5KXYK9KEWvbdRicsIqcPJBrlrtBpfp0EA7PTbfLpb1arJgjEZtkQgPldRnFoUjMf7P2zR7Qw/SO36K9WmvSOLVIJWXpgsietPdeP+eoLl1om1oHt96C/9dIXclI/qG+JtU1ctACSwnxel56vfxnlI0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6209.namprd11.prod.outlook.com (2603:10b6:930:27::16)
 by SA2PR11MB4924.namprd11.prod.outlook.com (2603:10b6:806:113::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 06:27:06 +0000
Received: from CY5PR11MB6209.namprd11.prod.outlook.com
 ([fe80::a805:a5ac:cf5c:8671]) by CY5PR11MB6209.namprd11.prod.outlook.com
 ([fe80::a805:a5ac:cf5c:8671%3]) with mapi id 15.21.0522.012; Fri, 16 Oct 2026
 06:27:06 +0000
Message-ID: <9e741a1f-c4fa-4c83-b838-0e32d63d4bdd@intel.com>
Date: Fri, 16 Oct 2026 11:56:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_wedged: ignore expected CORE_COMPUTE error
 in dmesg
To: "Tauro, Riana" <riana.tauro@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <igt-dev@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <badal.nilawar@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>, 
 <raag.jadav@intel.com>, Nishit Sharma <nishit.sharma@intel.com>, "Shuicheng
 Lin" <shuicheng.lin@intel.com>
References: <20261014115047.352174-2-mallesh.koujalagi@intel.com>
 <20261014132143.k3z6i2aqzsv3cnyi@kamilkon-DESK.igk.intel.com>
 <f5584f42-6f36-4dc9-bf7b-6e7c7b4385fa@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <f5584f42-6f36-4dc9-bf7b-6e7c7b4385fa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::11) To CY5PR11MB6209.namprd11.prod.outlook.com
 (2603:10b6:930:27::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6209:EE_|SA2PR11MB4924:EE_
X-MS-Office365-Filtering-Correlation-Id: 40cce563-20d1-46e8-b0b8-08df2b4e7fe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|4143699003|11063799006|921020|56012099006|18002099003|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: wU8U3uA/2ZzRAQa77uIbGzhTc/2KR4wsfRp6zTWF7cpSEPsgO69jQom81Lm6I5Vfi18yf5uptWAyAsULZo4lyw33lRE4YJHrcbCr7rjgFclQbi6Aa+Mu58WvNsJ2H01JwXqGoXaNXatGDR62X+JIUeoFL0SWUcL7TabpOl2qEfjjjGnWc6+Swqo7xkNVzKldNFpLsn2Y6YkDTIwKFNWIzY9IYZauhDKY5Oa3a9Rzfjylci0GSAFlfiipNwAOsXlZ6kMlCHlP8WlQYyFQmvrBkQHG4ZsCXxw/gHoJxArMSmzSqV0dWTndIvfUlVYUftyj9QdhLGCR+dITFwjWU7wynpYa1WVAA7w9SCpbwjr1rWgU8H8ORolM19iJRmrBBF/5laaFIkarnLKPJEpwrFnQBRqR7KR0smpOMLnM9tB8KbCG016jzi4D4YOOKrH4GMNAM4Zkklp/yhnlDOyQO51jcGFwsecO38Lz89hM/Is3Uv8zfWD3/DD7mHaFBV1U3WQJkZvaslzZMWw0+LmqTBb1rY6+Evb27I71qwZ7abbsx17OJj/4dcK0cvXVWoHYbxQKwbJHY2Lzn/pwFkKQaLwAFjaNIeQrhf7A0RJ8w233reBgI/uyZRHcXCpUdw7fL+eTS8MEX4TfN7LMC5N0oSAa0D5fBuX4WRr8e5wiC+TbiNJwnEjSQ9/8MItVXQ+XRc5wONjvdFsdeMZ0qr07PjHG/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6209.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(11063799006)(921020)(56012099006)(18002099003)(22082099003)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkhkNVFmeStQNFNjTlZZOTJjTStyUklaRG9VeVNIVnltbVFEK2pkMmllUEpP?=
 =?utf-8?B?aVN3akx6enFDd3BSV21GS0lPNUNiVWZiQTZibmRpK1gzamZ0Lzhqb0pjeDBH?=
 =?utf-8?B?dW9BcWZ5ZS83elVWNVF2MThYMmE2Y3hOWUoxK1hCaTF4MThvWHh2VFZBZzM3?=
 =?utf-8?B?LzhmSno1VmdHMnpSU2YyQUsxUlFNVE1Pdi9mdWJ4QlZUODQzRThRS3l0ckht?=
 =?utf-8?B?MVZFWmlPUFY0RUlGczQwWUxFOWhRZHdyL3pKemt1aFJPQ0dLWGlWSUJNUkpD?=
 =?utf-8?B?U3lCKzhOVWtvdE41M0V3VE1BMStjR200Z2FoRTk1dEk2RkVJTTJxeWJlSEFK?=
 =?utf-8?B?V2V1VXYwMy9LamtXaGt6bDRmaGdoYlVCNnRVVVhycHBiTytTZ2d5REFqcEpr?=
 =?utf-8?B?YXJGOEJzVGVoV3pQNHhmc3VCdXVPSkE2a1kxY3dmRGpTdzd5dGhrRDM1TVMy?=
 =?utf-8?B?OGlYTnM0ckpFUHZvVldST3pnMjQ4TC9WT3IwbGpwVXY1QW16WXN2RFRxNEdZ?=
 =?utf-8?B?bnZKTDA2ci85MGVwNmNObDlVRnk2ZW1hNGMySkdTS0tXMkZuUGNLQ3UyZG5P?=
 =?utf-8?B?d0VzVzNVUXVCa0FWWklhOGV3c3BDWHNiTVkzWTBDeFFadFR5ZFk4a0NaNERJ?=
 =?utf-8?B?YXg2WVJwNnZYMG9RVCt6UEpZQWttNE1jVU4wdFF0Z2VQdit1ZmF2eWVGNGly?=
 =?utf-8?B?N3htQkNPUklNUDZvMjMrK1pza0Z3WUQyN3Bmd1ZzQkVGMUcveE5ycVZlKzhE?=
 =?utf-8?B?OUU3NlZPb28yajlwTk5aRWR4c1JVNjJmMHc1eUtTcVJQVDFKMWhBUU5jbUF6?=
 =?utf-8?B?cnVaSlNCNHRHUDJFWFNOYmRnWUJNZEgwZmVkZnNhd01qMFkwejlvWEZIeXRO?=
 =?utf-8?B?V1d0dkJ0cW4yMldyQmVqd1BWSFpIU3RaZTZkaThNVzlGcWt3ZXl3cW41RDY1?=
 =?utf-8?B?YlpGaDZHUkJoUXpaWk9uTkcwN2NOYitJa0hLeklXZzRRQXJkNGpqUFBGTkdl?=
 =?utf-8?B?MXpwOWZNUW9zcWk2U2tnb1pCRVBsVTlXbmxad2VwOW9TN3pGOE9LOUk5L0x6?=
 =?utf-8?B?RW12T0ZicE95VXB5VFpldm9FSnZ5VFZWSnUrajEvYWFsWDJCbHJUREM2d1hj?=
 =?utf-8?B?VEFCNXV5RlFBT2VTSUFrSXFkSHYyL00xeE4weit2WElBZTdxQzhoRkRJZXYz?=
 =?utf-8?B?c0Nmb2pTMUxjSGxmRStnRzlJS2g1akMxR3NnYVNqTTRDdUV3V3BxSm5yU2g4?=
 =?utf-8?B?c1Q0T0lGRm1WMGtWdExjWWVhSWxXdEVaOXYwL0VHN2lPdXQzR2dReGZuT0N0?=
 =?utf-8?B?OEYxc3ViN0FaWkNHNEIvYzBaeHlCeGRseXBXU2d3T2JDcUJVV2FVdDdpSFJr?=
 =?utf-8?B?STR6eGVRNklBTUhPRDdNdVJSY1E2bGVRTzZnbWxtVmVjVFR1Q2Z2OWlPLy8z?=
 =?utf-8?B?cmdySk5jeEJwSlk5Y1FBaS82UkFGZGFLZWhPazhSWm1Db3RHa09HY3RCbHZJ?=
 =?utf-8?B?UlhTRmdFSHVVWFBkaTF5QTFOdmZhOWs4bTlWeEJMSVZIZk1oc1RneWtzbGty?=
 =?utf-8?B?T3owbnhFU3FYZW5wVWRFTVpINDZQdE4vbGVQTGQ4bzB0QkpjRWYvamV0NVR1?=
 =?utf-8?B?UnI3NEt3akNwY0JieGRmQzlFczEyS1NIU1FWOVRnNndaQTZ6ME9CNERyeHU4?=
 =?utf-8?B?WlpjblZmMXBxcmZVbHJQcVFHTG90RThtL2ExSnNVZWthOHZ0c25MUVVjcGhl?=
 =?utf-8?B?eTNQVWNQaUwzSVpSZWdZYS9uMiswYUUyK0pwMTJLZVkzb3JYbnlJekRxM0RU?=
 =?utf-8?B?SEcyT0VVa2VZOEwySHVKa1l5WEJjUW5KVXlPcUlyckhuN1A0U0ZOVEV2WXNH?=
 =?utf-8?B?TFhtNDRUZEtYNEQ2eXRjM0F6OU9lSUd6dnJMbkU2dzJhTWkrak5CQnJqTmhN?=
 =?utf-8?B?eUpyaXBuKzJOaEJRNU5SejJ3NU9oZ3h5TURveWxCcnNtcHFtR0ZSNWVhU1VY?=
 =?utf-8?B?MFZTQ3NjY1A0N2FzaEFLbDBraGtiUy9TaGlrYkRkaTZVSFpkc1dwSXJvNjRI?=
 =?utf-8?B?MklNZVYrRE9hWFpXTkNTejdxaC9ONFJJb3lab043ZGowVnBiUDB3bEc5azlm?=
 =?utf-8?B?NzFTTE1uZERzQlNPa1k2Y1BUdGZEUU1qSDJKVHV5UzhOLys5TitYSkl3MklD?=
 =?utf-8?B?YzB1WTVGckw3WlpnQjJZMEtHUkRVOUtkQ0IyMWNyemJzNkR3MmtiR1NwNUgr?=
 =?utf-8?B?czdYNUpOQ21RZUVmQnR3R3RaN3N6ZjFoaE9DSmpBUHEveFR2bkN3VDdHZDEw?=
 =?utf-8?B?WjlOdHFpUjZ3ZlViNUZzaEhEMnJBMkI5OEtkRDR5akM4SUJPUGVWQWRReTVn?=
 =?utf-8?Q?3TTBoKjlocwTIOtk=3D?=
X-Exchange-RoutingPolicyChecked: 5HBNbV9+yUuymZbeDRXN5cy4JyXGcsBT577SHTfhUDaljHy7owtM4c/+IJHCYEFMdlZQ/Lsm+Co+hr3uly9mev6WsGVjMQg3FnI1cYHJddDFzVA0tAS1Ro8UllzR2L6xMvAc7a7Xpoq6VKaFcjmrLV6OoqfQxnzJy04NpbKNMNZeBZGk1ASSf9hahPgrNnTuSyPDhFoojXTeN0AYcbtGQHCrkmv0/Sog0ehoOjtBUB5ZjFZwMvGyL4eg6HU/xbQqIC6/PjVVteuaBXT2PMW8DDoaUaDVEcBf+WcqINnrNNNpneLHzM4M56F0ZPahiNebYzfYPoy8nT4E8BwK+Rap3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 40cce563-20d1-46e8-b0b8-08df2b4e7fe2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6209.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 06:27:06.6570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEsy6OQUwOCYuM4u3QboiT4o5PvTcO2QAlZpyBF5Pp0B1rL0rOAMBQ6uvWgAk4dO5HtvGJrvbTzZ5PJjwwM+tfEg0qw//j5+YjyXjA3judk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4924
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


On 16-10-2026 11:05 am, Tauro, Riana wrote:
>
> On 14-10-2026 19:24, Kamil Konieczny wrote:
>> Hi Mallesh,
>> On 2026-10-14 at 17:20:47 +0530, Mallesh Koujalagi wrote:
>>> Wedge tests intentionally force a GT reset failure, which can trigger
>>> a CORE_COMPUTE hardware error (SIGID=203) in dmesg.
>>>
>>> Ignore this expected error so igt_runner does not treat it as a test
>>> failure.
>>>
>> Add cc before your s-o-b, also add few more devs found by git blame,
>> so also +cc
>>
>> Nishit Sharma <nishit.sharma@intel.com>
>> Shuicheng Lin <shuicheng.lin@intel.com>
>>
>>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>> ---
>>>   tests/intel/xe_wedged.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
>>> index 4f5197e2a..fe8ea6969 100644
>>> --- a/tests/intel/xe_wedged.c
>>> +++ b/tests/intel/xe_wedged.c
>>> @@ -54,7 +54,8 @@ static void ignore_wedged_in_dmesg(void)
>>>                       "|EngineClass: [0-9]+ [a-z]+"
>>>                       "|EngineInstance: [0-9]+"
>>>                       "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: 
>>> Unsuccessful -EINVAL"
>>> -                    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT 
>>> error");
>>> +                    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT 
>>> error"
>>> +                    "|SIGID=203");
>> LGTM
>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
>
> We have to ignore this string as well
>
> *ERROR* Tile0: GT0: GuC: Uncorrectable local error!

Patch is already merged, so I'll create follow up patch to ignore 
string  "Tile0: GT0: GuC: Uncorrectable local error! ".

like:

Tile[0-9]+: GT[0-9A-Fa-f]*: GuC: Uncorrectable local error!"

Thanks,

-/Mallesh

>
> Thanks
> Riana
>
>>
>> Regards,
>> Kamil
>>
>>>   }
>>>     static void force_wedged(int fd)
>>> -- 
>>> 2.48.1
>>>
