Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCECCA600B
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 10:37:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBB510E7C5;
	Thu,  8 Oct 2026 10:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPsz9HPT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40D810E4FC
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 10:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791455774; x=1822991774;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HnN1YSTRGl74Rg+rzxopNk0cU/pKEEpIW9WntsgFHYA=;
 b=DPsz9HPT331FKLWGRBpKcPttTaA0HIH9tNRYyuJSH31rWYlAgCTFbo+b
 1UDwu5rDKlKjKB+XafmEGoHL2D9CIX1iFlrWTRhT6EWTGQfcmgdo5Q++F
 T+57rFHw/vQqFMetiP7g6isrHuV3D03FB6ZXNVs2ZyGYha4oUa/WBqXaO
 ZU5TzmWU9y2McVOpFt8J3aLGXSSAmaUcvh/unXdb2S4HNYxNYKp+eq3zS
 D7tFyQvHR49gz/t2Td2L94fQyS5qbCfiPN92bs+nrpIEW9JFLHTW0Cq9c
 s9ZFeWHFnua2xPJrlT247HqdZTnWX78RKUPALfu1Y0G4afy1mTQxZA4nY g==;
X-CSE-ConnectionGUID: 2hb7Q7A3RaW+Rn8pvl0i+Q==
X-CSE-MsgGUID: 6n2WxtszR2O/Urq+uTQWAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="336293"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="336293"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 03:36:14 -0700
X-CSE-ConnectionGUID: n0hWO/VST9ePSjQlCGXHDg==
X-CSE-MsgGUID: Q18IPp4kSHWxm7ZULpswVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="12527"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 03:36:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 03:36:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 03:36:13 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 03:36:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUZ3t8q2sDNDRHHa5Aq06HqtSAFF5FLDYCwV2SIub6XQULPH2ukusFt4g6H5REfH8wxdU5QkyIKJbUQDZzqXd0FNZHZUugajsS0kFRwDH1Mzli2VdSv1MhtWRRO2Bd10qDFPxwQWCw+4H2CM8EJrNByPz8maO4HBqMH/br6D1ZK9jVRnQ/sXVdZc+jzkdeZLWWBPzYedZ/fWTL6OrodwDzPvXaDqPi1EROKKl7jiEeQkQWAVR6TGTJvTUye4rUYKfl+MJ0p/ZAF5UVAmxlPuDaHMNlVbmkYJNfzg0ZnOAPF5g9gUgWkOWw4+iwGn1MqyyzTf5EoLhK5NukOoVh4DAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMbRpCp1K/I9zHN9pNlnMZPHi7BpkybIuv1DHIRGJ3o=;
 b=xldU6NNt1SKB8kIwuBP8fVqBaY/ERmBE1rcsSisDNjdbzgARn1adaXkf4EoWs+5b4hICPM6q5CeaRtVK3obB9N92+wJiJf/qPNcJ3CjOQ/vIq6rltrEpYFAbGgZTihRitVzQul+m9S0qf49QK4TMP35xFAeH5c5uEQTOw1hFi4L7ZRZWCGWiTXZsisYYeL1KSLJBycA9mKPoOwi4eqnopR07bXzj/8UWesC873ive/sXooTl3aCMWb4DKhw1CmRgmnOFo7p9NrkpnNDzArw666wPVRtkjTBr+QM+GGlROhS2Fpb4bNsj+xGLZHDVEZHiiUj0zKcJo9HJMKI34idtRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5411.namprd11.prod.outlook.com (2603:10b6:610:d2::12)
 by LV3PR11MB8766.namprd11.prod.outlook.com (2603:10b6:408:212::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 10:36:06 +0000
Received: from CH0PR11MB5411.namprd11.prod.outlook.com
 ([fe80::c652:8ca0:ade3:5df]) by CH0PR11MB5411.namprd11.prod.outlook.com
 ([fe80::c652:8ca0:ade3:5df%5]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 10:36:06 +0000
Message-ID: <82f59c67-6c47-403b-b052-4920bde49fd0@intel.com>
Date: Thu, 8 Oct 2026 16:05:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 4/5] tests/intel: Add threaded random-size
 allocation stress tests
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
CC: "Sharma, Nishit" <nishit.sharma@intel.com>
References: <20260922110438.2402109-1-sobin.thomas@intel.com>
 <20260922110438.2402109-5-sobin.thomas@intel.com>
 <CH3PR11MB8434785B888540B99D8B4BCF8D962@CH3PR11MB8434.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Thomas, Sobin" <sobin.thomas@intel.com>
In-Reply-To: <CH3PR11MB8434785B888540B99D8B4BCF8D962@CH3PR11MB8434.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To BL1PR11MB5415.namprd11.prod.outlook.com
 (2603:10b6:208:315::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5411:EE_|LV3PR11MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: c17f9518-0285-4cf4-26f1-08df2527f517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|56012099006|4143699003|11063799006|10086099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: GOxMGPdmf8Zow5UGc3cCVz0CTeFO19yneSohfjdZv71w9uDf4h4RBysu4WDHB0/C9g7sphRlYUqKCbIFbltPys1MlGvI33QpNWOIAX+FD5Pr4b5kH6cr1QuAlSMwIMP6nnQEwczVfNkIgC8K3wAkonRjdzwfGNwvdX3uH6woKeeu7DK/RxvbpVg5oEtZY7AMY+UvIb/YZ09BZmd7O/JpwVuTnzQAONdbMEwDz69gRkegAmdnZijdI4zuhSWcMyQQrbA8V0dHcQC/58ZqHycTG4X/FBMbrlocn/6fjX4bAV9Ioc+IOBfEoJUoBXBYwSaRb+g8PySaaAd1IgHZWSuSklawNP4QGTUDCirdyMSq6uRXmmdO9FnmLSqxBfK90Xw4kjaN7ik0p/+BssNhJFMfjj0/Zgf/Z4NhXYpBuN4fOikdHOgi7/VDklOKKHVJ2BZ67m4AJ/E8Gn4RgksK/3uqoht715a3A5BgYSGs9i+/OZ4ZEmp/nM+3ipTYD5atdzCtK5GcpDGs5mt8HCPta5f3lnDpkO0cjoHkZyPUShi+Ei7djNsGwPlPlocnGih6MN0F3J+nMh9cbL/HpzucjAz6K4xB0fIqkzCiv1/E+JXHsRHMJp1RZI+wmwZFfZQXcROwyi4ekODesAdiKkwQAx9fXhpTJhjunMt6G19B1ixGbbk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5411.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(10086099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TThreFU1YTdmY3VCL0pNeCtmaW9ROHprYWFtVUYrblZTenhvbnBvTS9GS01W?=
 =?utf-8?B?L1RvcGtJR2RZMnBKdDNSM3FzNmZJNHNBTFRLUkFJOVVwRkF5SzV6RThzU2wr?=
 =?utf-8?B?cE9WWTltMEJVS2IwampOeTdKTkRJVjFKWStxd2hJcXFBaVFwN3dVNXllZmxl?=
 =?utf-8?B?WWRJemdQNjl3NTBRTEU0ajNoUWpTTTd5MmZvQkpCSGVEZzkxOEtndjUwT0lU?=
 =?utf-8?B?d1pyck1HeS9sdGoxRkhqOFNSMUpnRzJ5TytJeGZnbzEvV2h1cjdTVWU3Ly9O?=
 =?utf-8?B?ditPckpSMERqcWVCTXVFQkFUL1BCLzZPbTJuQ1RSODl4SWNMZWdxQjFJN3o5?=
 =?utf-8?B?UGg5Y1dKTFdQZFdzM1U1TEJXWUc4Y1pvSmw3czlId1gyQTFBQUxNWmxINURG?=
 =?utf-8?B?c01Jb3FETlBibFNENGxvLzhsMElucVRFK05Ld3g4Tm9KWlJOY3IydGIreHZt?=
 =?utf-8?B?eWpxbDdPejZTMEZZS1VxNFR1YUNXSUdrU1hzdUR5U3AvSWxKQmZmY0VXUzVP?=
 =?utf-8?B?c1dLTTFVNXdGM0d6MGNNM2JpZmErOUdSbmFvY25XV09JS2tSMDdFcHR5NmQ3?=
 =?utf-8?B?TTdjM1ZNckcwYUtnZHp0bnJWbkR6M2ZhT2Q1YXJTOTdwYitUYTZTbTRTY21O?=
 =?utf-8?B?cFpnb2VKRU5Ickd2aG5TbUo1WllkcmUrMS9VcE91SnJ1K0Q4N0xNdk9XTVEz?=
 =?utf-8?B?S1V2MlpvbGU5ZnFIb2hIY0o2dGUvOVZsOUFoRmxNbWRlMGZ5STZzeFFNS29I?=
 =?utf-8?B?ZEk5K3BCMmZiNHIwaVZzVDRWTmRtMzZoaGxjbHFHMnc2M3AyME16SVhEcmlx?=
 =?utf-8?B?b2dUOTFuMHhQU2x1WUpJVWl0Sk5KQTlxRnNKV0c5cUlkWTBKZ2lEQ0N2THZI?=
 =?utf-8?B?eDM4OHB4bEY0czRrZEVvWnJOSDAxMW8yZ3hlK2RFVXR5d2o5RGpZRGNkaDBl?=
 =?utf-8?B?MjlhQW5NOVhEcEp0azF5Vjh0RTlMaG0wV0tQenVHZjcxS2NjTlg2d0tZMTdO?=
 =?utf-8?B?Uk01ckdaeTRQYWphV0FxQVBPaVgwUlh3Z0szb1VwR3NTa0RnMnJXTjZLc3Nz?=
 =?utf-8?B?S2RROVpMekxJSlNEcG5VQXZ2bm9UUFJSVHFRRDB5Q3RjUVRrRStnYmozU05z?=
 =?utf-8?B?dTg4eVF6c0lobHhhTExmVmh3RmpXSEhxQ2JPVFpZQmZ6c1ZBL05xa2FPTEJt?=
 =?utf-8?B?RzA3TVNDdXY2R2VwLzU1SWNORjZlM1lYUEdVc25rODUzQnVHbktaK2FrMlJF?=
 =?utf-8?B?dTBTWnpVaElJLy9aSHd1Wkh6YVBJMW1MY3ZsSDdDeUJnazI1VW4yRHcxQ3hs?=
 =?utf-8?B?Mm4xSDYwUTdocjFJVnBpVGU1NENkOERiWmIvdEo1dnJiMXcyeGE2NXhxTUNm?=
 =?utf-8?B?bTQxZzJEZ2N0Z0g5V3Y5a21NUWtZRkMza0hNQXZkMFRtSzk0ZEJFOEdBelhx?=
 =?utf-8?B?M2REZHVlcE9CdmdUVml4WGlob0xmY1ZhUWZYbzMvcTIrRzdQbjVEUUFwQXZO?=
 =?utf-8?B?WHAwSFc5YlZOZ2lNTWxMam0wZ1hTYU45RWlaNkdoczNmYVBaU3dRZVNYcDZl?=
 =?utf-8?B?NnNxNkRNaVBOc01ZZnRCcWZ0MkFHbmhFSUhxMzBjK2U1SGM3TnNBcmp0VExt?=
 =?utf-8?B?aXJNTHBSQ3dHQVJrUUgxYWU2cnFiaC9yVmNGdk1tazBHTnpqVU0vdk50amh4?=
 =?utf-8?B?WG5sZDZjek16RG5MQUVmNldLTUgxeHZjZTk0aUNmVW1TZG85RUpUT3VGallB?=
 =?utf-8?B?VE50SUFSMTMyTHVFY1hlYTFxWCtsSUh6ZGIrR2RpUURSelZSaG1iOWttZXZ4?=
 =?utf-8?B?eXpQMFRtemlkZTF5eUdYU0piSk1RRE0wYUtrTGJHOStIdUZaei9qbTFYUndU?=
 =?utf-8?B?bjI0SDhPRFRIeUhSRkNTTzFBU3VjTW5ocGNDWGU4K0FtdnNEeHYwMEQwTkIr?=
 =?utf-8?B?MnRNN1djTjJFbDZ2ckZwdW56cE1PUkRvalVlRUp5NTFlNkkrZDlRS3A3clNr?=
 =?utf-8?B?U3ljRWJZS1IyUTE1cHZrc01tS3FhUlZqYVowV3hYOVJUd0FhM09sSDgwMlFF?=
 =?utf-8?B?am5vcDg2c2RkTkFqL2lsMzRBdnJIOE9FaHBtUDExaGJ2ZytXM0hlOWhGWUph?=
 =?utf-8?B?OWk1RkpaWENvQkJsbjRjMnkybEJUK0VZMzhNNU1na240WHFlYW5pQ0RyY1NX?=
 =?utf-8?B?bWNCdEpRYmhFZlMvYW9xSnpDTUJmUlFvQWc5SEI4UHk1ZmUrZGdWeDViTzc5?=
 =?utf-8?B?NHNPa0Nod2g5eVkzaytGVWtLK3d2cjBvZVovY2JFY2MyZ3NqYnUyaC9Hd2ZW?=
 =?utf-8?B?ZDV3bHhkM0xkeGlEbTdYTzhIbjhUMXo3YVdyelh5WTdObUtnL29JQT09?=
X-Exchange-RoutingPolicyChecked: jG/oWbVfpPR1k+8eax0xn+cbhMGr066Flpap/Su5QbQrFnmGyZvUE8oEFvSQst/K+kJBnO1WwEWZ1KwZTdGPYMn5demDDhe6+auaz08gORBdkXkc8muu8wsaKpzXUCrvezkIPE7CUnyhqVcp5qb1OJhkwg1AhT0yV+GPgg88VIt0vV+2fSxKF0k5XuAZ5zhxjCaD48/iWJZZ0OGAtcCklHQ60vEOJ/XrkxWiRXkdStJF9n9BVBDIVSOnUwNkiqb06DDjF50LEU4OjCT/7hv7bgv6EWa2+VFbzl2jyA4P7echs5KjINSbcTqzRC3wWbbHoUt46njAqoEmkDiU1pSLBQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c17f9518-0285-4cf4-26f1-08df2527f517
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5415.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 10:36:06.5720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUGh8WEQIaU0kLS5rc4/DqzZUhkb+SKllx9V2h8i+0oFzVWCVsALSxTjdSAtRWDj3+Nd+GUwQZtNVb5ZWGvHYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8766
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


On 10/5/2026 12:26 PM, Dandamudi, Priyanka wrote:
>
>> -----Original Message-----
>> From: Thomas, Sobin <sobin.thomas@intel.com>
>> Sent: 22 September 2026 16:35
>> To: igt-dev@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.com>
>> Cc: Sharma, Nishit <nishit.sharma@intel.com>; Dandamudi, Priyanka
>> <priyanka.dandamudi@intel.com>
>> Subject: [PATCH i-g-t v5 4/5] tests/intel: Add threaded random-size allocation
>> stress tests
>>
>> Add a new TYPE_THREAD test mode that creates a worker thread per available
>> engine and performs random-sized BO allocations concurrently.
>>
>> Each thread creates its own VM and execution queue and exercises the existing
>> allocation path with both aligned and unaligned bind addresses.
>> Additional variants cover leaked bindings.
>>
>> These tests provide additional stress coverage for concurrent BO allocation and
>> VM bind activity across multiple engines.
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
>> ---
>>   tests/intel/xe_bo_alloc.c | 149 +++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 148 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c index
>> 343d07626..d8368087b 100644
>> --- a/tests/intel/xe_bo_alloc.c
>> +++ b/tests/intel/xe_bo_alloc.c
>> @@ -56,6 +56,26 @@
>>    * Description: Test 10 batches of 10 random BO allocation sizes bound together
>> as a single
>>    * array of binds, unaligned bind addresses
>>    * Test category: functionality test
>> + *
>> + *
>> + * SUBTEST: threads-rand-sizes-50
>> + * Description: Test 50 random bo allocation sizes in test table with a
>> + thread per engine
>> + * test category: stress test
>> + *
>> + * SUBTEST: threads-rand-sizes-50-unaligned
>> + * Description: Test 50 random bo allocation sizes in test table with a
>> + thread per engine,
>> + * unaligned bind addresses
>> + * test category: stress test
>> + *
>> + * SUBTEST: threads-leak-binding-rand-sizes-50
>> + * Description: Test 50 random BO allocation sizes in test table with a
>> + thread per engine,
>> + * leak the binding
>> + * Test category: stress test
>> + *
>> + * SUBTEST: threads-leak-binding-rand-sizes-50-unaligned
>> + * Description: Test 50 random BO allocation sizes in test table with a
>> + thread per engine,
>> + * leak the binding, unaligned bind addresses
>> + * Test category: stress test
>>    */
>>
>>   #define GB(x) (1024ULL * 1024ULL * 1024ULL * (x)) @@ -82,7 +102,8 @@ static
>> uint64_t *alloc_sizes;  enum test_type {
>>   	TYPE_ALL_SIZES,
>>   	TYPE_RANDOM_SIZE,
>> -	TYPE_ARRAY_BIND
>> +	TYPE_ARRAY_BIND,
>> +	TYPE_THREAD
>>   };
>>
>>   struct test_case {
>> @@ -129,6 +150,20 @@ struct batch_data {
>>   	uint32_t data;
>>   };
>>
>> +struct thread_data {
>> +	uint64_t va_base;
>> +	pthread_t thread;
>> +	pthread_mutex_t *mutex;
>> +	pthread_cond_t *cond;
>> +	struct drm_xe_engine_class_instance *hwe;
>> +	int fd;
>> +	int count;
>> +	uint32_t vm;
>> +	uint32_t flags;
>> +	unsigned int seed;
> seed variable is not used anywhere in this commit.


Will be reused in next series along with rand

>> +	bool *go;
>> +};
>> +
>>   /*
>>    * Reserve a chunk of process address space to use as the VM bind address
>>    * for a BO, and hand back a pointer inside it aligned either to bo_size @@ -766,6
>> +801,103 @@ static void alloc_random_size_bos_array_bind(int fd, struct
>> drm_xe_engine_class_
>>   	free(leaks);
>>   }
>>
>> +static void *bo_alloc_thread_fn(void *data) {
>> +	struct thread_data *t = data;
>> +	uint32_t q;
>> +	int i;
>> +
>> +	igt_assert(!(t->flags & LEAK_BO));
>> +
>> +	pthread_mutex_lock(t->mutex);
>> +	while (!*t->go)
>> +		pthread_cond_wait(t->cond, t->mutex);
>> +	pthread_mutex_unlock(t->mutex);
>> +
>> +	q =  xe_exec_queue_create(t->fd, t->vm, t->hwe, 0);
>> +
>> +	for (i = 0; i < t->count; ++i)
>> +		test_alloc_size(t->fd, t->vm, q, t->hwe->gt_id,
>> +				alloc_sizes[rand() % N_ALLOC_SIZES], here  rand_r(&t->seed) can be used instead of global rand()
>> +				t->flags, t->va_base);
> Same va_base is being. t->va_base is set once per thread and never advanced between the 50 iterations.
> threads-rand-sizes-50 is fine as it binds and unbinds+releases after each iteration but for leak it might collide with previous one.

Agreed: Will make changes


>> +
>> +	xe_exec_queue_destroy(t->fd, q);
>> +
>> +	return NULL;
>> +}
>> +
>> +static void run_threaded_bo_alloc_test(int fd, int count, uint32_t
>> +flags) {
>> +	struct drm_xe_engine_class_instance *hwe;
>> +	struct drm_xe_engine_class_instance **engines;
>> +	struct thread_data *threads_data;
>> +	pthread_mutex_t mutex;
>> +	pthread_cond_t cond;
>> +	bool begin_work = false;
>> +	int n_found = 0, n_threads = 0, i, ret;
>> +
>> +	xe_for_each_engine(fd, hwe)
>> +		n_found++;
>> +
>> +	igt_assert(n_found > 0);
>> +
>> +	engines = calloc(n_found, sizeof(*engines));
>> +	igt_assert(engines);
>> +
>> +	i = 0;
>> +	xe_for_each_engine(fd, hwe)
>> +		engines[i++] = hwe;
>> +
>> +	threads_data = calloc(n_found, sizeof(*threads_data));
>> +	igt_assert(threads_data);
>> +
>> +	pthread_mutex_init(&mutex, 0);
>> +	pthread_cond_init(&cond, 0);
>> +
>> +	for (i = 0; i < n_found; ++i) {
>> +		threads_data[i].mutex = &mutex;
>> +		threads_data[i].cond = &cond;
>> +		/* reuse engine 0 if only one exists */
>> +		threads_data[i].hwe = engines[i % n_found];
> Here i%n_found is not required just i is enough as both are same.
Agreed
>> +		threads_data[i].fd = fd;
>> +		threads_data[i].count = count;
>> +		threads_data[i].vm = xe_vm_create(fd, 0, 0);
>> +		threads_data[i].flags = flags;
>> +		threads_data[i].go = &begin_work;
>> +		threads_data[i].seed = i + 1;
>> +		threads_data[i].va_base = BO_BIND_BASE_ADDR + (uint64_t)i *
>> THREAD_VA_STRIDE;
>> +		ret = pthread_create(&threads_data[i].thread, 0,
>> bo_alloc_thread_fn,
>> +				     &threads_data[i]);
>> +		if (ret)
>> +			break;
>> +		n_threads++;
>> +	}
>> +
>> +	ret = pthread_mutex_lock(&mutex);
>> +	igt_assert_eq(ret, 0);
>> +	begin_work = true;
>> +	ret = pthread_cond_broadcast(&cond);
>> +	igt_assert_eq(ret, 0);
>> +	ret = pthread_mutex_unlock(&mutex);
>> +	igt_assert_eq(ret, 0);
>> +
>> +	for (i = 0; i < n_threads; ++i) {
>> +		ret = pthread_join(threads_data[i].thread, NULL);
>> +		igt_assert_eq(ret, 0);
>> +	}
>> +
>> +	/* vm is created for every slot up to n_found regardless of thread
>> creation success */
>> +	for (i = 0; i < n_found; ++i)
>> +		xe_vm_destroy(fd, threads_data[i].vm);
>> +
>> +	ret = pthread_cond_destroy(&cond);
>> +	igt_assert_eq(ret, 0);
>> +	ret = pthread_mutex_destroy(&mutex);
>> +	igt_assert_eq(ret, 0);
>> +	free(threads_data);
>> +	free(engines);
>> +}
>> +
>>   static void run_gt_dynamic_subtests(int fd, const struct test_case *t)  {
>>   	struct drm_xe_engine_class_instance *hwe; @@ -849,6 +981,11 @@
>> static const struct test_case test_matrix[] = {
>>   	{ "array-binds-rand-sizes-10", 10, ARRAY_BIND, TYPE_ARRAY_BIND, true
>> },
>>   	{ "array-binds-rand-sizes-10-unaligned", 10,  ARRAY_BIND | UNALIGNED,
>> TYPE_ARRAY_BIND,
>>   	  true },
>> +	{ "threads-rand-sizes-50", 50, 0, TYPE_THREAD, false },
>> +	{ "threads-rand-sizes-50-unaligned", 50, UNALIGNED, TYPE_THREAD,
>> false },
>> +	{ "threads-leak-binding-rand-sizes-50", 50, LEAK_BINDING,
>> TYPE_THREAD, false },
>> +	{ "threads-leak-binding-rand-sizes-50-unaligned", 50, LEAK_BINDING |
>> UNALIGNED,
>> +	  TYPE_THREAD, false },
>>   };
>>
>>   int igt_main()
>> @@ -864,6 +1001,16 @@ int igt_main()
>>   		const struct test_case *t = &test_matrix[i];
>>
>>   		switch (t->type) {
>> +		case TYPE_THREAD:
>> +			igt_subtest_f("%s", t->name) {
>> +				if (t->requires_evict_ram) {
>> +					igt_require(xe_has_vram(fd));
>> +					igt_require(igt_get_avail_ram_mb() >=
>> +						    (xe_visible_vram_size(fd, 0)
>>>> 20) / 2);
>> +				}
>> +				run_threaded_bo_alloc_test(fd, t->count, t-
>>> flags);
>> +			}
>> +			break;
>>   		case TYPE_ALL_SIZES:
>>   		case TYPE_RANDOM_SIZE:
>>   		case TYPE_ARRAY_BIND:
>> --
>> 2.52.0
