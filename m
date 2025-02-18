Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180C9C021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 20:06:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7DEE10E11B;
	Tue, 18 Feb 2025 20:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bgpAcIKY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4A410E11B
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 20:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739909166; x=1771445166;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LtJSWHUvGg6aBLp2KGEwaBUgR01DT6HwGWX4kZ0rpOs=;
 b=bgpAcIKYGp7aJRsAg7rp45+iEx2fqTlsi/xfnCRHfIejULXyN72izAnr
 Q8exsmL5PJaq6jxYTWo3S7uoFOxeuzlbld2iXxh6X2ou7RoQRR/rtveiV
 IHz7gNsfto9fLIyQc3UKIAA8yWyLlGo7o+0DXvUFd5G+A21SmQZfV/xPa
 XDuwzJ2OYJfvZnoZRqpo2h8YtKSb5IPQd+pTQ2RI24J/TAS+SsbAztNK5
 XJGb1/l9WSoyDChlNyf6nOfo9K0HeS9iyFO1sEvQJL3seFRj//KhK8P+f
 nrweMpIltJdfmRlfAg/E5je9CGwcZhKbIqaXrBt1Mzma6Jm9xuK37iFZp Q==;
X-CSE-ConnectionGUID: JkvrzIPoR82zbgiJzOrheg==
X-CSE-MsgGUID: BlBBqPCeQ0SeU1CqPPXnPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40748903"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="40748903"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:06:06 -0800
X-CSE-ConnectionGUID: AB2sxnFKSViDJZikFtQ0WA==
X-CSE-MsgGUID: xbxyyd4fQDWy2LCjQ/ETtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="119431903"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:06:06 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 12:06:05 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 12:06:05 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 12:06:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbBZ5p0cIe2vy+mOnilEVpq1FOihxGAXOhB/p119F1JcyfVm58JFJAEoey4DTyU2NfVQvyR/zDu/mbVcu17Sq0HjT21GOZoopEMHyi+KWn0YhHMUz2kRgrrvxdsXntbPkKLq0I4E8xVmrkfJ3wRUhCR8fnSNQXTZQbfVpgf9ZsunWDWD4xjofHEcZjn059ZN0vj6eodP6mw88wMzrj8W/pmme7MwvgR3zIsUMggPRfJGaBp/5RuSFq+YpNxfVxBKq+5c5oPwLLhVhWVu45nVTJXpXEhVrjwDia4ssf7qjTKH4NdGxx45SZcMs4Sd0j3kyqIaQFAvnJdgzEgcCXwefg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8M6aR1gl4s9HcEGsDX4xksVelztldDAaqPhZge6JbqU=;
 b=CFSTuO9a9P9+oZ1hl1sVeCsuLDI3671xUByeTlCW140JUfAx+1fyS2GbQF5QzrymkollSgashwpDIGS5KxRhb/yap3h/CnY5wGxoCz7jQMnMzqUbIFq7Bpnj7EnJaOijwTWHjyj+gJz7W4eZBHSHhaHHDTghsym3ol+B6gNqunGarZXy83WUUFp5hpuVDkx0dnb2qZnUC2jv8a4shNZVdosZOGsn/8xE22EyC0MISAjcqS0zoh+Ubkht1ZIBm4pmOl5/85wvi6EhhO1BnA9wmjvhbKGaU+utwkDeFBo4NKZFGjllg8Uc8KbCjxDF5AccpP1Pp5K7MR+h4sTxX17mzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW4PR11MB6716.namprd11.prod.outlook.com (2603:10b6:303:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Tue, 18 Feb
 2025 20:05:55 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 20:05:55 +0000
Date: Tue, 18 Feb 2025 12:05:49 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@linux.intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v2 2/3] tests/intel/xe_pmu: Add PMU test to
 validate engine activity stats
Message-ID: <Z7ToHfhCJbH/kYw0@orsosgc001>
References: <20250217142021.951467-1-riana.tauro@intel.com>
 <20250217142021.951467-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250217142021.951467-3-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:303:b6::31) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW4PR11MB6716:EE_
X-MS-Office365-Filtering-Correlation-Id: 303b721a-4684-43dc-a376-08dd5057a715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHhremkyRkRUS3NtaFU1YkxVaHJTY3lVclg3T1EwUG9vUWRCVk9FV2VQb0hW?=
 =?utf-8?B?WXdXOWEvRURiSEpaK0gyS1VUUUl2Y3B0L29uSU1uc2dLNTJ1RnZqSTJPT3l0?=
 =?utf-8?B?VjRmbGZLMml6dDRSWGNVNk1HVVRPOTJCTERqVTdMTlNFaDc3TFZKNy9nalB4?=
 =?utf-8?B?b3R1cm9YVUoveVRBREtobG80ZUpIbWxBRnNjSE54YU9MTWVSb0F1T3Q2WVIz?=
 =?utf-8?B?djY0RU5YakxRaXVFNmVZbGYzeEtHUGFldEZLdGNVbWdPUFg5b1ViaU1Hbzht?=
 =?utf-8?B?Y2RVdzJFNlEwOE9veFA5RnUzSXhGZ1F0Yi9INXdjWUc5bUN4TlV1TWZHaDdU?=
 =?utf-8?B?UWg3NXZMVlh4TnliWm1YYnVzekVrWnY3QlNoQTJOUjdtd2p0UmR6WnFPdzFT?=
 =?utf-8?B?UHFpWmp5cjltWisyQ0hleDhGSU1kTk11ZThkcHA5U2NSbmdhdEVob2pINTlw?=
 =?utf-8?B?a2FvQm5qRk5peUhQbUlyUjhGR0h2WXZodDYvN29NNFIzaStNZUErcXYrZUp3?=
 =?utf-8?B?NmJNSXR3QzVPc0kyaHVZeHBkOXlncm42NGM5aHpQaUt1Rk83elBCYjZ2Sjk3?=
 =?utf-8?B?UGN2RXc2L25PZ1FFMkFDdWtYWk13TkhROXpybFB4Sm5BYnlWZWJmbFhBeTJL?=
 =?utf-8?B?dTBta095bVBYWmI0blhMTGtURFM2L3czYkVlRTJWWHJ0bTAvQTJJNnpNYWpr?=
 =?utf-8?B?S2dYd25OVzd4eWtWVDlWdHZ2cjVadWtZYWt6cncxZlFIR2J0MlFOZDcxUEFn?=
 =?utf-8?B?SmZhbHFvazYwL1BkVXBYODhwMERmdEFXdjdYOUNYbkQ5RDJLNkI5eFBYMUoz?=
 =?utf-8?B?eE1jZ0ZsWW11ZWhEN2JVVHh4SmM3YWVpM3Vtbm4zS2hicUZZUXJ0K3pJaEtF?=
 =?utf-8?B?NWNVbEUwN3NOVW4zUmRpSzdaTWFnUHRnU3BRNU03c0R6NFdtbXFTeVhrdCti?=
 =?utf-8?B?RGxxT2tKSk5CaVMzU2V1cHp6Mzl5WEVndzBNLzJZeU5IaGNhUk5wRHEvSFdp?=
 =?utf-8?B?SVV6K2lYdzVLYm4vQWIyN0tCT3huamtGcG13Wjl2TVlYWG1QTXRnWGxVb1h2?=
 =?utf-8?B?V2RZOHhLNFd5MzJvV2xvTjFNQVhTa3NTWXpST1ludURVdlN2R09WZUMvOEpq?=
 =?utf-8?B?dzhjRzhMSkNtK29qcUtGeVZSdExieE1aeDcyU1ZMZlVqTjNsb3U4aVdBOUN2?=
 =?utf-8?B?eFMvZkVPc1JNbzN1N2xVNzlkYzZtblh2YXpndmtnZVFNL3d3NW9lMnBwQVNB?=
 =?utf-8?B?V1oxVjlzMUFsSzQ3bEZlcmJFTzVld1lVSDVWUm1rMVc0ZnNGaWxXVzU0UVl0?=
 =?utf-8?B?V0l0NllPK3BBODQ5SWp0elNjeXFmSDZwcTJoRGNGTE4va0lTM1pqT2RFbjZM?=
 =?utf-8?B?d1MvQWVTQVJ1eDJBNk93OW4vMk9OWXpNNjQ0dVZvbUVvd3pyWU0yL0Z0WjVa?=
 =?utf-8?B?Z0U1OXp5a0pnMUgvdjg0UzJIUjFReFIrQkp2L3lXcEtiRU5mWHE1Z2lqK2s0?=
 =?utf-8?B?Y05QR2s1UUdaTk9tc1dLeWxrWjBRSVMwM0dzOEMxZFpmanhRYmM0Q1BIQis4?=
 =?utf-8?B?cE5CV1dZa1ZDL2x0Z0FXY2N1MWs0Nlh0MU5BSmpFVXk3Uk1aNTFRZkkzbGc0?=
 =?utf-8?B?eFYvampkdjJoUUQ4N0lGdkhBVEQxd2szUHpodFBsajZWOGpCT0k5cVN4YkhU?=
 =?utf-8?B?cDJvdTJRdE5mWWdvcVluQm1pNjBhUHNiamkyd0hoRXZHaVNOZi9xYU9QQ1JB?=
 =?utf-8?B?Qmc1Vy9JRCsrNzZxMk1VM2JuMlE0cmhhK3BYaFhtcC9UT0xCOEYxRG1hY1Bn?=
 =?utf-8?B?VTVCQTFoV1NIQUVRcWo4NmNRaUJMVlVDYkszZTVoOHEvS3NhQllEMXBrRFpw?=
 =?utf-8?Q?aInTrfZJbeO9I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUtvWExqSnduWE5ZQkZvMDkxS3hHb01RbE1WZ0lDNnhLVUVlZjhHQ2Vsa29Q?=
 =?utf-8?B?N2lzYVNkbDY5S0hvNFhDOWtQVzVlT1NlaElqMStpRWJqQTF2aFFwMFY1M2VI?=
 =?utf-8?B?S2tmVUxoQTVRU093YVhOQXlMVTdzTXFpWTZzeTJBYkZNTVdOT01EaGhsVzZr?=
 =?utf-8?B?Y25NMG9HOU4xN3pDSWZoVFQ1NmNZaWc2ZkRDTkhneFN2djdoQVExK1VjcCtV?=
 =?utf-8?B?dUNBOWo2UlVjUmRLSWRqNDZRKzY1c1BVK1dSZ1h4OWdWcng3eFh2ZlhqN3lL?=
 =?utf-8?B?NU9iYnN2dEtXaCtqMm1EN3BCNDA1ckQrV3FoSm91aXc5aEpIYnNRSG5NQVVF?=
 =?utf-8?B?MlVKbDdKUWZFbEhzSmxDeG9ZVzNFS1BEMzErTitUcGkwcElHNE5tb0JPeEs4?=
 =?utf-8?B?OEVRT2dnRWc0MFZ6dmRPaEw1aGZDaDJvL2tvc3huMS9PcHp2UmtLUDM1NnBG?=
 =?utf-8?B?eGk0a25QMkFPbHBYZ0VYOFFGSnZMcUFwNDBZUk1zWXZKeFdZSXVJQXF2c3Zt?=
 =?utf-8?B?OUFmaWJRbXVaeE5Gby8rOTdRT2EvdURXYzFBWUkyTC9HblNsYTFHREg2czJl?=
 =?utf-8?B?TWR2b2t4dExsN0lITFY0UTJueWw2TjNPdDg2US9paEtMeXpPOEN6Y1Z4cUpK?=
 =?utf-8?B?bDFvZ3BVcEhtR3RlcEFsaTF4V3J0VGRrenBvTG9uTTBLWTNrVTJBOEEvWUhC?=
 =?utf-8?B?Zi9HTll3MXAwK0hOWDQwRmVpTXhTZERCZVBIQnlQTGpBRElpS1V3NTRTUGRD?=
 =?utf-8?B?bW5mTHZLN3krTDJManFOM0NOOVE0RXh5MEJhVjJSYUhtQWhXR3d5V0M2cTJr?=
 =?utf-8?B?SThtMnMwSXlITUJSbzBzMGhTenV1N1FYRFMyZmRVMEhESWt3WEM5MmppbXVE?=
 =?utf-8?B?cVRFbzhiOEdaZC9sNHVVdU9wTWM1R2ZoT1VnY2kyQjZ0Q05PUUNzNHVEY2ND?=
 =?utf-8?B?elVDWSs2aHpFbDlxeHQzcjlZZjJXSHpUTzdHQlVabTVTOWdjK1lRODNKUVpr?=
 =?utf-8?B?WmRkaklxak5EK0k5Yk94MWVuSVhHaXZPT3RETzIwTTVFeXZuVG5BZDVMSkh3?=
 =?utf-8?B?S2JzdC9xK0Y5L0FQUnZVNmN5K2FjbjZNamxiNm1PTVc4aHZacFlNS2hQbjJ4?=
 =?utf-8?B?aXJ4WmFacEowaDhwU0xyaW5JMlZadXd1Qi9tU1NVUkFHb2EyQncwTjdDV1dv?=
 =?utf-8?B?MFg3TUNKQU10TXA4cWdQNFhFa1BwNFhUMmlzUHJsbUFzV3ZYT2NGKzdKM0NZ?=
 =?utf-8?B?VzZ0akVBdUZPZ3RIaE1RWEYyemMxZElWcndCM2lMNnNQdDV2NjNycFBTZ3VK?=
 =?utf-8?B?a0JPZU5VQ0RrL2dxR0ZzTkFXaDNOSWRkVjBMZXFMSUp2dkJSMXlZZ09YUEpP?=
 =?utf-8?B?S3NoS0h2WHk3eGNwQnpnL2FOUVNrRkdZYWozK0NqTHo3YXczMEZYdUJsZktv?=
 =?utf-8?B?ditoNHFLeTkrbVBReDZRMVNON3dmWDBmN0twdm1LbHRUc3lKcUhIQ1JOeWlr?=
 =?utf-8?B?YzVhcWtkWFNYbUluenkwalFpVHV0dTljYWQ5dVdWS3k1ZXc4dkIxb1Q5ZXhC?=
 =?utf-8?B?blVvaXI5eHoyREdRYUErWWpiUktlSmVLb1VLb2xVVzNPMUxBZllYMVJSamVN?=
 =?utf-8?B?TjFYRW1JeDU3NXpVZDNSd29hdnpKWmtZaVh2UGR1TFM2U3hVNlZhbFpEM2FZ?=
 =?utf-8?B?S1BLV0lUbFBybmtkSUVTK0did3o5OFErSUpFcFVvVWdhRUhxWEFEOHVrb29P?=
 =?utf-8?B?dTlDRXFKNDBOWkRMZDFVNmk4VU9zYUwybmg2eFhsRlRqT3htdEdYYlVrSXdi?=
 =?utf-8?B?VTVXTnhxRTJXT0krR2JrdVd3RjlqTjVzMjFDK3VWbTROblB4S05XQ282ZFZk?=
 =?utf-8?B?UlMvcnFVU0VDZ3lySURwNjByY3JXbnRsL0tVL2lnUnZuY0E2SjZ2OVVLd2Q3?=
 =?utf-8?B?S1FmdXYyZDVNbSsrVmhydUtRMnFzV1VKWm04VzhmNTczTmdpVzNoYVVrV1gy?=
 =?utf-8?B?dVhUU0xsM3FydEZ2NVJkbjBZSGx6Zyttc0RzTUExbUF6bDNHUE8rYnNSTFo2?=
 =?utf-8?B?WVY3dnpzZHNoZGVzRHE4NTBtK3JlRitCU2ltR2s1QTloYjNYc2pDODFZbWh4?=
 =?utf-8?B?MnFuWEJWRXNXUGtaeGJvVlRXd2VwSEZzYkNJV2FSZ2E4ZExEbGxIS2JIU0NQ?=
 =?utf-8?Q?cAWW4DJp2CKMpfTOtjvAPkI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 303b721a-4684-43dc-a376-08dd5057a715
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 20:05:55.3937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPIFnVndYOtowam3HDAQV9dDPPchCLnDgybVWk9FbykGEy/VSYeJSHxJnIeJ4vcqj7NHdlCU7HM/ILCLeZ0WkZaqPmvf/O/UYDpeRl8zytA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6716
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

On Mon, Feb 17, 2025 at 07:50:17PM +0530, Riana Tauro wrote:
>Add a test to validate engine activity by reading PMU counters
>(engine-active-ticks, engine-total-ticks) when running
>workload on every engine
>
>v2: rename busy to active
>    add assert to format events (Umesh)
>    add a helper macro
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> tests/intel/xe_pmu.c | 156 +++++++++++++++++++++++++++++++++++++++++++
> tests/meson.build    |   1 +
> 2 files changed, 157 insertions(+)
> create mode 100644 tests/intel/xe_pmu.c
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>new file mode 100644
>index 000000000..aa7d53523
>--- /dev/null
>+++ b/tests/intel/xe_pmu.c
>@@ -0,0 +1,156 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+/**
>+ * TEST: Test Xe PMU(Performance Monitoring Unit) functionality
>+ * Category: Metrics
>+ * Functionality: Power/Perf
>+ * Mega feature: Performance Monitoring Unit
>+ * Sub-category: Telemetry
>+ * Test category: Functional tests
>+ *
>+ * SUBTEST: engine-activity-load
>+ * Description: Test to validate engine activity stats by running a workload and
>+ *              reading engine active ticks and engine total ticks PMU counters
>+ */
>+#include "igt.h"
>+#include "igt_perf.h"
>+
>+#include "xe/xe_ioctl.h"
>+#include "xe/xe_spin.h"
>+
>+#define SLEEP_DURATION 2 /* in seconds */
>+const double tolerance = 0.1;
>+
>+#define assert_within_epsilon(x, ref, tolerance) \
>+	igt_assert_f((double)(x) <= (1.0 + (tolerance)) * (double)(ref) && \
>+		     (double)(x) >= (1.0 - (tolerance)) * (double)(ref), \
>+		     "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of %f)\n",\
>+		     #x, #ref, (double)(x), \
>+		     (tolerance) * 100.0, (tolerance) * 100.0, \
>+		     (double)(ref))
>+
>+#define test_each_engine(test, fd, hwe) \
>+	igt_subtest_with_dynamic(test) \
>+		xe_for_each_engine(fd, hwe) \
>+			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
>+				      hwe->engine_instance)
>+
>+static int open_group(int xe, uint64_t config, int group)
>+{
>+	int fd;
>+
>+	fd = igt_perf_open_group(xe_perf_type_id(xe), config, group);
>+	igt_skip_on(fd < 0 && errno == ENODEV);
>+	igt_assert(fd >= 0);
>+
>+	return fd;
>+}
>+
>+static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
>+{
>+	uint64_t buf[2 + num];
>+	unsigned int i;
>+
>+	igt_assert_eq(read(fd, buf, sizeof(buf)), sizeof(buf));
>+
>+	for (i = 0; i < num; i++)
>+		val[i] = buf[2 + i];
>+
>+	return buf[1];
>+}
>+
>+static uint64_t add_format_config(const char *xe_device, const char *format, uint64_t val)
>+{
>+	int ret;
>+	uint32_t shift;
>+	uint64_t config;
>+
>+	ret = perf_event_format(xe_device, format, &shift);
>+	igt_assert(ret >= 0);
>+	config = val << shift;
>+
>+	return config;
>+}
>+
>+static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_class_instance *eci,
>+				 const char *event)
>+{
>+	int ret;
>+	char xe_device[100];
>+	uint64_t pmu_config;

pmu_config should be initialized to 0 above in case eci is NULL.

With that, this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh

>+
>+	xe_perf_device(xe, xe_device, sizeof(xe_device));
>+	ret = perf_event_config(xe_device, event, &pmu_config);
>+	igt_assert(ret >= 0);
>+	pmu_config |= add_format_config(xe_device, "gt", gt);
>+
>+	if (eci) {
>+		pmu_config |= add_format_config(xe_device, "engine_class", eci->engine_class);
>+		pmu_config |= add_format_config(xe_device, "engine_instance", eci->engine_instance);
>+	}
>+
>+	return pmu_config;
>+}
>+
>+static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
>+{
>+	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
>+	struct xe_cork *cork = NULL;
>+	uint32_t vm;
>+	int pmu_fd[2];
>+
>+	config = get_event_config(fd, eci->gt_id, eci, "engine-active-ticks");
>+	pmu_fd[0] = open_group(fd, config, -1);
>+
>+	config = get_event_config(fd, eci->gt_id, eci, "engine-total-ticks");
>+	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
>+
>+	vm = xe_vm_create(fd, 0, 0);
>+	cork = xe_cork_create_opts(fd, eci, vm, 1, 1);
>+	xe_cork_sync_start(fd, cork);
>+
>+	pmu_read_multi(pmu_fd[0], 2, before);
>+	usleep(SLEEP_DURATION * USEC_PER_SEC);
>+	pmu_read_multi(pmu_fd[0], 2, after);
>+
>+	xe_cork_sync_end(fd, cork);
>+
>+	engine_active_ticks = after[0] - before[0];
>+	engine_total_ticks = after[1] - before[1];
>+
>+	igt_debug("Engine active ticks:  after %ld, before %ld delta %ld\n", after[0], before[0],
>+		  engine_active_ticks);
>+	igt_debug("Engine total ticks: after %ld, before %ld delta %ld\n", after[1], before[1],
>+		  engine_total_ticks);
>+
>+	if (cork)
>+		xe_cork_destroy(fd, cork);
>+
>+	xe_vm_destroy(fd, vm);
>+
>+	close(pmu_fd[0]);
>+	close(pmu_fd[1]);
>+
>+	assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
>+}
>+
>+igt_main
>+{
>+	int fd;
>+	struct drm_xe_engine_class_instance *eci;
>+
>+	igt_fixture {
>+		fd = drm_open_driver(DRIVER_XE);
>+	}
>+
>+	igt_describe("Validate engine activity with workload");
>+	test_each_engine("engine-activity-load", fd, eci)
>+		engine_activity(fd, eci);
>+
>+	igt_fixture {
>+		close(fd);
>+	}
>+}
>diff --git a/tests/meson.build b/tests/meson.build
>index 1a731fc73..a385e9cd4 100644
>--- a/tests/meson.build
>+++ b/tests/meson.build
>@@ -309,6 +309,7 @@ intel_xe_progs = [
> 	'xe_pat',
> 	'xe_peer2peer',
> 	'xe_pm',
>+	'xe_pmu',
> 	'xe_pm_residency',
> 	'xe_prime_self_import',
> 	'xe_query',
>-- 
>2.47.1
>
