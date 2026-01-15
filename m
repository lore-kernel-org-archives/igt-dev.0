Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244F4D41157
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 10:05:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE66310E733;
	Thu, 15 Jan 2026 10:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G8fHfFij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECC010E733
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 10:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768471537; x=1800007537;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GBXGKWKpeu+StleXfEtxo97ZL9c7ehv4QUc0cx/45TU=;
 b=G8fHfFij5w5TLPPHcSVVCrCjIDC1v9e92DmVE9gKTvb069a4Z9t/GJ8O
 0h8rGbEummF3NuyINiumckP2KDMHvwiItU187ISQ7i4DNBK6JPduV1v/U
 zSU77eLRu1pXbffmhX0N2CEST3aYEUjgZR2k51QZs8b/qwZyPQDTggxX3
 AGaHzoHeVaJxV+K5SD55XfJtFBWcXX1uxPBYrBFS/+4rTR++xyzPLoxC5
 8DUcqogoY0pynLATh7X6qE5x8xYJDcOAfAbyaT4wMAEfccRhdY+0fsOO4
 sPcrehIksLFXJIlzSWCtTlS+DXb8BPCIxHoPhtU3rJhg4LL2lYYGTAhBs Q==;
X-CSE-ConnectionGUID: PCszj4hXQ5elnDTGh3qZBw==
X-CSE-MsgGUID: gjnlMwyeQQCwdAuITTFlrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="72360181"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="72360181"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 02:05:36 -0800
X-CSE-ConnectionGUID: Ug9/NTlQTd6WanWhFjJRhQ==
X-CSE-MsgGUID: nmf/YbMHQMKR9eAnPebg3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="236171865"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 02:05:36 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 02:05:35 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 02:05:35 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 02:05:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcNEAcqTUQFBpvLEqubqo0jMGc+ypir69EWjCgvwtddGN7JgYrTROyEsmReAED7WmqkFbBtol3BGr/G4B4qPv6coDuqk8Wly6NLDseum37xc2BuPPDesOvlSuKvwzeQuF7gTZMRMtIxAQWAMU1Bz2Q6wCnCt9gIAXEhwL6eJJWHL6xliugUXGZkr/ZcW8IFCT09uwkKBp8YMFLkYUCbzwJrRK1O961sPrpG5gfADM2720KtYvJ3dZw4ZZd6oE+7FC5nkEBeHUX0B9UOGKj68Hi5oJhUXKva/CeahAM+hi12qbRoA9IUs94UJQmaCpWd6PEPsZBJHc3ZASJqHBlSzpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/a5laOrYOC/rPugFf8Mo1o/qW9TELwUrdrH9DegRYoA=;
 b=fb+AtS0StFy/zN0cIAHgEW7iyClOcdJU7GNEcCg7u1LOPGQbpOfrE9AdEYljkf72e9VR+lSwd+45OfXZ+AEwsBUFTOocjVL0KsIBRQ2j/F5fIosHK1CLFRfCZ+pCWuYe45anUDXQiRlfbiB9arwp+lmKAdMi9JrcjT1DQfxV2zFhOopiKszRqOmbXlLI36u1o42cbAlogAbw0WKicHagWu3zn9B1JqgqXEd9LoYeMZ4msujMMKPrgszoV1HbgEcBPsJg0DtgYncql4ivhFrwoDNZP6IYSgk0h4cv2+rn/VIw1QZOmYk6L0Q2aFc11KM1py1RA1anf1iTRN6E+DSlrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by IA1PR11MB8831.namprd11.prod.outlook.com (2603:10b6:208:597::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 10:05:32 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 10:05:32 +0000
Message-ID: <0f201c67-14a9-462a-9491-fff56866821b@intel.com>
Date: Thu, 15 Jan 2026 11:05:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 10/10] tests/intel/xe_sriov_admin_profile: Add
 SR-IOV admin sysfs scheduling attributes tests
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <jakub1.kolakowski@intel.com>,
 <michal.wajdeczko@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20251125102312.43142-1-marcin.bernatowicz@linux.intel.com>
 <20251125102312.43142-11-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251125102312.43142-11-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::35) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|IA1PR11MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: cbd31abc-566b-494f-10e6-08de541d9e34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cm5lMWRhZWw5UWdDUEc5K0N0SUdLZmFxVCt2My9acGRoZWoybDQ2U1Q1VE9x?=
 =?utf-8?B?RnVJREJzNTJKRU1rMVo3S2RTbnlQT0xxaytQTzBVRUEvSENFZy9aMENBZ1J5?=
 =?utf-8?B?Nng5c2hHNmdoT2pnejFrbEVhTXEyekZQR0dOVjd4TWEvM2pNSTFVWnJQUzQ2?=
 =?utf-8?B?YzhyUmxIYS84TXBjYW1MSDBhR0NyZkNoUUV2OW5iQWpyNEU5cVFXZ09jYWhk?=
 =?utf-8?B?VkNuUklqSXBWaWliYkh2Zyt2bUVWMWRqZmRFcTFqc0ZGL1VsdGttYTUvWVV0?=
 =?utf-8?B?ekVuZ2UxTFQ2ODljVVArZldLSGpkOHlxZ1ZzdHRUUUxmR3VkVGRjTHRUamQ1?=
 =?utf-8?B?dytIdVRTanlHQzlzNXg2dVE5d3VpVm5LaEh2c0gyVFY3b1gzUUNPbk1IT0pU?=
 =?utf-8?B?bEprQW10TW1PTlBpZWYwUUR0V01kdHM3cHdBRmlnZkM2aVF4eHhaMFRUcHFJ?=
 =?utf-8?B?YTdSWGgrMU1xWEd4VitCWmNPK3l6MzA5eVAxdFlwMnRQWlN0RnRncUZFdmZM?=
 =?utf-8?B?V2FIaTllRVMxdVQ5RFBZK095VEIyYXBoeWtFclFQb2l4ZExTa0Fha3E4WVJ5?=
 =?utf-8?B?cGYyWTFoS2VrWUU3YUhSM0w4TEhROTBDYUIyeW5pYW9Tck9DRnNlMGVxaG5J?=
 =?utf-8?B?TDdyaWt4eWJBejJEMk1TRnhmSTRhVjRmQVpUSGNSOUdqcW9KMTZwbVl3T2tw?=
 =?utf-8?B?eFF0eEpNcWxVTE53QS9NNnBmK1I1OStKdXMvZjdVbE83VXNnRVRrZ1RZVUJi?=
 =?utf-8?B?OXlqTDhhWSs4VE5kL1FvY0ZnK1ltMDFkQzFIdXhlVXJvVnJrM3luOUc0Tncy?=
 =?utf-8?B?cXVvQzdBVi80OElYTDlvZUdTV2xDNU5vZXJsN3pRZThaejRSZXJBUEZKWVQ0?=
 =?utf-8?B?ZlA5VXYyTWhUekRHcm5xZkVmUmkzVC85WlRCNkZEZ3l4S3VLZ1V6U3orbmQv?=
 =?utf-8?B?d01LMjRDWkxRQ1lzajYrYk1PRFI3bnUxN1Y2V01TQUxXRHhIOXhmNC9zS0hJ?=
 =?utf-8?B?Q2dhS0tDWExZK3p5Q2R1ME11SFNxK25wSmpwVXQwckMzL0J2SEFwYXNSb09V?=
 =?utf-8?B?TVlLZVE1ZU0zTXhXRnYwQTVIWHVIbDFUNVJmRThtUC9adTVmVlU0a2c2WHZv?=
 =?utf-8?B?YUpQYzZhanNZdGNBRUFYei9LaG1Pam9Idjk0WTdGbzlFLzl5WG85YVdkZzlz?=
 =?utf-8?B?SEVzYTd2SG5tdS9YZWhaNlYrWjEwRXNxQTNBTjhEY1ZMK3pwWFNybWt2bC9Q?=
 =?utf-8?B?K2xWSHJOUFhFQUZLUFAzcDhMbzNjR2dQNmhaQlc5azQwRElkaXB1Y3BxVmNW?=
 =?utf-8?B?WGhYUUlhSFZzOG5TZnNWM0N0R1crY0ZzY2tEL01uUkZ5clBPWVJ2Zk1BT3N2?=
 =?utf-8?B?Vm9KTGxCRVZTL1RaY1dmeWhDb1FFcSttN2k1NHdES0lQZlVkVmVpY3VCMU1X?=
 =?utf-8?B?VDEvaWZWWWdYMVY2d0xmOHlaODhNZXc0ZVF3RmhMZTlqbktLS1dISHppNjdQ?=
 =?utf-8?B?YnozbHk0RWNzWWprYXVtaFZBbmQrRW5taVZzMUNKQ1VRTmV2Zm5GbC9qYWRv?=
 =?utf-8?B?Rk5EUWo5T0FLSmdKeldTRmU1ZFQ5M2hEVjhDS0xwaHJMdTJQZzc3NTlQbk1k?=
 =?utf-8?B?eVJVYy8rQWE5ZW1RU0tUWVhYcFZ2VGZmTWUxYklteWJVZndzK2ZpbW8zUEJF?=
 =?utf-8?B?VkxCSDZHbnF5OVBIQXh6cktsVHZOR1NVelVGTTYySkV2czhVT1hzUGNhY1hl?=
 =?utf-8?B?TFBGK1ovWmVBOUVvTVJxRTF1aU8wR0d0WlJZNWNNalVGVHE1cXk2NHZDS2NJ?=
 =?utf-8?B?M2lMbFpTdmJnTlh2aVREcWlPQWxscmxXRC9WZ3ZEL3pCZ3g5WEpEWUhxTmZG?=
 =?utf-8?B?OExtbTVPOTBtaEU0Q3JTaDI3Z0NONnRYU2w4UWY2UHBCM0EyVGY5SUttWlZo?=
 =?utf-8?B?THlrOUVYU011dVJjVnFsR1kvZTgxUllkZkdqY01HRUkvN2pvdEd3NEEyckFa?=
 =?utf-8?B?N3hETWtvWXpkaVpzcE0vWTRUL3E2bklFMEpvekxKd0MyaDNZZDBSNENRSTdi?=
 =?utf-8?B?a3l6bDlReVRyNGJqVU0zNE9yaEh0OFYrSHNiN3RFZE4ySUF6TmJON2Z0ZFBW?=
 =?utf-8?Q?/Sfw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(7142099003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2ZWNUVzMGdJVEdhQ0dUQ0hkMzl2SDJMcVV6K2NIcjlDaFM2SGU3YUNoMERT?=
 =?utf-8?B?MFd1TzRuUVNDZC9JcVBoNEZ3bC9LTWcyVnhVY2hidnJoYW5OaGhiRHg0OHpo?=
 =?utf-8?B?UE92QUFjcTIxRnFuZUVQeFFMalRvSThHeDg4MC9ucXhkVURLak5lSWNMV2Nx?=
 =?utf-8?B?TmtqZ09wVVl3NjFiQjBnUVZEbUo1TGROamQyWDN6dk8xOEpPL0hyZVpHdUdy?=
 =?utf-8?B?V2FUb01HTllZeFM0M01SSEdLejgwOUp1RCtoaTFYR0tHNHFLMWpDQ0ExNTdi?=
 =?utf-8?B?MU90U0FCcFpmTWYrNTNVV1NuU3pUL2RzWjlkTDQ0ek11Y3duTnpUWFp3WEdN?=
 =?utf-8?B?VEtidDFSaUQzTVUyL3Y3a2trZ1lOTmJCWVRtTDFmM2MrOStaTVpjN0Nvdyt0?=
 =?utf-8?B?elFmM1ExR0N0WG5sNjBtU1pkWGZuYnppOXZIK1dqM0Z1aHJxQnpEeTg2ODY1?=
 =?utf-8?B?SXNjWC96Z3dWS0xaalJYYUFTKytaWVc2UWNmT291TDdFdENiOVdVMzYxY1ZH?=
 =?utf-8?B?bnBlb1ZMYU1iM3JEOUZwLzdlTVl1M1IzWXM1UFRrNzFLclA3eWNrMnhZKzds?=
 =?utf-8?B?TXdndnk1YitsZWZsbk9CcnJGaUZ5ZWpXTHhOa1NJY0I2WXl1SXFhdGIzNkVZ?=
 =?utf-8?B?RktxTG42VkR6WFdoT2dINHg3QkYzRkVVTnRLT0VMVWxaK05aQmloYjViY3RS?=
 =?utf-8?B?TkxydFRzL0lZMUpadXNhS0l4dU5nOThFMkxiekREOFdoaVZBQm5xcVB1ckpr?=
 =?utf-8?B?bU81U1doRDBWN3JXeFhId08wbWthVVlLUm9wSzBnS2VuRUN4TVB6UTc4b0o2?=
 =?utf-8?B?NTUwUDQ3SFJ2YzRMREZvRVZDa052OEh3cmpMODBlYzlPRnVsdWpDQVh2K0xq?=
 =?utf-8?B?VXB6d1lJK0h1RVFyb2FyL0RJLzQzZEJCYzdnZktxczdUYjBTUDBhdWtZT1Bn?=
 =?utf-8?B?MVcvd2l0dDJKbGZ1OVBkR1F2YVlYWHgrM0J6ZlZqbzR5Q0VDQk1yWThmVzVW?=
 =?utf-8?B?bVJ1VXdrL01YTFFxZkt2cFd1SmZFTk94MWlNdzZkeUpQaTN3ZkE0alRaQW9n?=
 =?utf-8?B?dGZYdlNxRXJKK3cwcXJFV1Zjc0N0VytGdm5CZnNSMFlFRmtxZ015Q1lxTzZl?=
 =?utf-8?B?YW95d2JreklFbnFFMU56UjR5VFAvUlFGc25ubFdIWXpNczl6dFFJNlJZbW9w?=
 =?utf-8?B?UEhQelUwU0Q3Y0RKRlNQRGFnOGJtdDNMMzJwRUE4bEZ2WFFjclgyYXZHenNa?=
 =?utf-8?B?djdpUXRMeWhJUCs1eFRKalV3ZjMxTUhiNlhOcHVvSnJMQ2tNUTVnN0RaTjlY?=
 =?utf-8?B?eTh4QkVDVWV3TUhmeTFwUmhMMXFKaXZYME9ZREhmTDJiWUV0UWtsbC9tV1BL?=
 =?utf-8?B?bStEQnQxb2R5OUplaEZLZmZ3T3NMOURhL0xQYVdEb1BCa2h6cit0eklBdXdK?=
 =?utf-8?B?VVVYSklJeG0vY1djQ3V0Y3U0VjNyU2J2VjFxTHBkR1cxM1ZXMEh5dTBVTlVN?=
 =?utf-8?B?T0FXUm5IWktSYjY5VkhGT2xKNmVWMFgwaDJmSUM5aTc4SXBCSGw1WGViM2JG?=
 =?utf-8?B?NVRoVmZ0THFkdjBrRHlMand5NktuWVNmUy96S3k1TXExbzU3aDlSUUZZYkVN?=
 =?utf-8?B?ZW1KZFd6Tk9sYkUrNVBnRHZuM3pUZHF1OEJLSWIyWU4zUG9JcTZSVTJDQmJ5?=
 =?utf-8?B?QjgzUnBGNi80OHRaSmVLbzdBVFJBdFpycG5EcXBseFQwNWtMUVp1ZnNPcldI?=
 =?utf-8?B?QkRYRXBNdEI4SDkzR2dlQkJJRVRRVEx3UU9mdXpWdGM1MjBrN1UrN2dqQ0tL?=
 =?utf-8?B?bVlXdVkrVDlFbGlwa0JzUnkxSUhnckxVZWdaejQxcS9KQVFaOUhpS0VuQkR0?=
 =?utf-8?B?MHlwNktNcHBuSmluTEpGQUhpZDcveSt4VDN4WVJDMnlHUHZJSWE5YmNIcE5N?=
 =?utf-8?B?M3F4VXFSdFd3bEtpRkltT3NtL2w3MmF1Z2E4OEF0eHZFVEtWbno3L0Rkajlh?=
 =?utf-8?B?K2RoQisrNkcxRmgwdUlIYWR1Rm1wODZWWEdqa1Z2WGZUVjZPM3ZxQy9YeXUv?=
 =?utf-8?B?NXF1dXpGeWsyU1JxY2ZwY2tPNktwMWNZc2EyRXNHbHhLWVdvSTQzMi9DZWI2?=
 =?utf-8?B?clZSZ2pBdjFBbXVZVm5iZjVUK2grSUw0VXVjNHk4L1hBK2kxOU56SytOdWt4?=
 =?utf-8?B?UEgyWmFLM0hlNFF2aVQ2UGxXcHJkSVMwc2FOWnpLSkd6dnFKRjRzbTUyemRU?=
 =?utf-8?B?Nnk0VlBsSzFUV0h6VjNzM1ltUXBocnhLbEZIMEdVWTlRUnNxYitsZjFzaDhP?=
 =?utf-8?B?aVlFRkgweDJoTGMrWmIwb0tmSHNvNGMxOXYrMG9ySk15VU8wSVNDUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbd31abc-566b-494f-10e6-08de541d9e34
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 10:05:32.6343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8QGZ80Nb1RMRRbwFoaSAtABVVC34/317SB7yiQhzpEWCBgg3IrwZ7E1Ls9dlYEmrlGjv3SiUqNlIsRuFEAlG2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8831
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


On 11/25/2025 11:23, Marcin Bernatowicz wrote:
> Add tests that exercise SR-IOV admin sysfs attributes for PF/VF functions
> with VFs disabled, covering default values, write -> readback behavior, and
> bulk updates for exec_quantum_ms, preempt_timeout_us, and sched_priority.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>   tests/intel/xe_sriov_admin_profile.c | 414 +++++++++++++++++++++++++++
>   tests/meson.build                    |   1 +
>   2 files changed, 415 insertions(+)
>   create mode 100644 tests/intel/xe_sriov_admin_profile.c
>
> diff --git a/tests/intel/xe_sriov_admin_profile.c b/tests/intel/xe_sriov_admin_profile.c
> new file mode 100644
> index 000000000..6f4ed31b1
> --- /dev/null
> +++ b/tests/intel/xe_sriov_admin_profile.c
> @@ -0,0 +1,414 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation

2026

> + */
> +#include "igt.h"
> +#include "igt_sriov_device.h"
> +#include "igt_sysfs.h"
> +#include "igt_sysfs_choice.h"
> +#include "xe_drm.h"
> +#include "xe/xe_sriov_admin.h"
> +
> +/**
> + * TEST: Tests for SR-IOV admin sysfs.
> + * Category: Core
> + * Mega feature: SR-IOV
> + * Sub-category: sysfs
> + * Functionality: SR-IOV admin sysfs
> + * Description: Verify behavior of exposed SR-IOV admin sysfs attributes.
> + */
> +
> +/**
> + * SUBTEST: default-sched-attributes-vfs-disabled
> + * Description:
> + *   Verify default scheduling attributes under sriov_admin
> + *   with VFs disabled.
> + */
> +static void default_sched_attributes(int pf_fd, int vf_num)
> +{
> +	igt_dynamic_f("%s-default-exec-quantum", igt_sriov_func_str(vf_num)) {
> +		igt_assert_eq(0, xe_sriov_profile_get_exec_quantum_ms(pf_fd, vf_num));
> +	}
> +
> +	igt_dynamic_f("%s-default-preempt-timeout", igt_sriov_func_str(vf_num)) {
> +		igt_assert_eq(0, xe_sriov_profile_get_preempt_timeout_us(pf_fd, vf_num));
> +	}
> +
> +	igt_dynamic_f("%s-default-sched-priority", igt_sriov_func_str(vf_num)) {
> +		enum xe_sriov_sched_priority prio;
> +		unsigned int prio_mask;
> +		char mask_str[64];
> +
> +		prio = xe_sriov_profile_get_sched_priority(pf_fd, vf_num, &prio_mask);
> +		igt_debug("PRIO=%s\n",
> +			  xe_sriov_sched_priority_mask_to_string(prio_mask, prio, mask_str,
> +								 sizeof(mask_str)));
> +		igt_assert_eq(XE_SRIOV_SCHED_PRIORITY_LOW, prio);
> +	}
> +}
> +
> +/**
> + * SUBTEST: exec-quantum-write-readback-vfs-disabled
> + * Description:
> + *   Verify write -> readback of exec_quantum_ms under sriov_admin
> + *   for PF and all VFs with VFs disabled.
> + */
> +static void exec_quantum_write_readback(int pf_fd, unsigned int vf_num,
> +					uint32_t eq_ms)
> +{
> +	int ret_read, ret_restore;
> +	uint32_t read_val;
> +
> +	igt_require(xe_sriov_profile_get_exec_quantum_ms(pf_fd, vf_num) == 0);
> +
> +	xe_sriov_profile_set_exec_quantum_ms(pf_fd, vf_num, eq_ms);
> +
> +	ret_read = __xe_sriov_profile_get_exec_quantum_ms(pf_fd, vf_num, &read_val);
> +
> +	ret_restore = __xe_sriov_profile_set_exec_quantum_ms(pf_fd, vf_num, 0);
> +
> +	igt_assert_eq(ret_read, 0);
> +	igt_assert_eq(read_val, eq_ms);
> +	igt_fail_on(ret_restore);
> +}
> +
> +/**
> + * SUBTEST: preempt-timeout-write-readback-vfs-disabled
> + * Description:
> + *   Verify write -> readback of preempt_timeout_us under sriov_admin
> + *   for PF and all VFs with VFs disabled.
> + */
> +static void preempt_timeout_write_readback(int pf_fd, unsigned int vf_num,
> +					   uint32_t pt_us)
> +{
> +	int ret_read, ret_restore;
> +	uint32_t read_val;
> +
> +	igt_require(xe_sriov_profile_get_preempt_timeout_us(pf_fd, vf_num) == 0);
> +
> +	xe_sriov_profile_set_preempt_timeout_us(pf_fd, vf_num, pt_us);
> +
> +	ret_read = __xe_sriov_profile_get_preempt_timeout_us(pf_fd, vf_num, &read_val);
> +
> +	ret_restore = __xe_sriov_profile_set_preempt_timeout_us(pf_fd, vf_num, 0);
> +
> +	igt_assert_eq(ret_read, 0);
> +	igt_assert_eq(read_val, pt_us);
> +	igt_fail_on(ret_restore);
> +}
> +
> +/**
> + * SUBTEST: sched-priority-write-readback-vfs-disabled
> + * Description:
> + *   Verify write -> readback of sched_priority under sriov_admin
> + *   for PF and all VFs with VFs disabled.
> + */
> +static void sched_priority_write_readback(int pf_fd, unsigned int vf_num)
> +{
> +	struct igt_sysfs_choice prio, now;
> +	enum xe_sriov_sched_priority prio_enum;
> +	int ret;
> +
> +	ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, vf_num, &prio);
> +	igt_assert_eq(ret, 0);
> +
> +	for (size_t n = prio.num_tokens; n-- > 0; ) {
> +		igt_warn_on_f(xe_sriov_sched_priority_from_string(prio.tokens[n],
> +								  &prio_enum),
> +			      "Unrecognized sched_priority value '%s'\n",
> +			      prio.tokens[n]);
> +		igt_debug("Setting priority string '%s'\n", prio.tokens[n]);
> +		ret = __xe_sriov_profile_set_sched_priority_string(pf_fd, vf_num,
> +								   prio.tokens[n]);
> +
> +		/* Not settable on VF */
> +		if (igt_debug_on(vf_num && (ret == -EPERM || ret == -EACCES)))
> +			break;
> +
> +		igt_assert_eq(ret, 0);
> +		ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, vf_num, &now);
> +		igt_assert_f(!strcmp(now.tokens[now.selected], prio.tokens[n]),
> +			     "'%s' != '%s'", now.tokens[now.selected],
> +			     prio.tokens[n]);
> +		igt_assert_eq(now.selected, n);
> +	}
> +	__xe_sriov_profile_set_sched_priority_string(pf_fd, vf_num,
> +						     prio.tokens[prio.selected]);
> +}
> +
> +/**
> + * SUBTEST: bulk-exec-quantum-vfs-disabled
> + * Description:
> + *   Verify that bulk setting exec_quantum_ms under sriov_admin applies
> + *   the expected value to the PF and all VFs when VFs are disabled.
> + */
> +static void bulk_set_exec_quantum(int pf_fd, unsigned int total_vfs, uint32_t eq_ms)
> +{
> +	uint32_t read_val;
> +	unsigned int id;

nit: vf_id

> +	int fails = 0;
> +
> +	xe_sriov_bulk_set_exec_quantum_ms(pf_fd, eq_ms);
> +
> +	for (id = 0; id <= total_vfs; ++id) {
> +		int ret = __xe_sriov_profile_get_exec_quantum_ms(pf_fd, id,
> +								 &read_val);
> +
> +		if (ret) {
> +			igt_debug("%s: failed to read exec_quantum_ms, ret=%d\n",
> +				  igt_sriov_func_str(id), ret);
> +			fails++;
> +			continue;
> +		}
> +
> +		if (read_val != eq_ms) {
> +			igt_debug("%s: exec_quantum_ms=%u, expected=%u\n",
> +				  igt_sriov_func_str(id), read_val, eq_ms);
> +			fails++;
> +		}
> +	}
> +
> +	xe_sriov_bulk_set_exec_quantum_ms(pf_fd, 0);
> +	igt_fail_on(fails);
> +}
> +
> +/**
> + * SUBTEST: bulk-preempt-timeout-vfs-disabled
> + * Description:
> + *   Verify that bulk setting preempt_timeout_us under sriov_admin applies
> + *   the expected value to the PF and all VFs when VFs are disabled.
> + */
> +static void bulk_set_preempt_timeout(int pf_fd, unsigned int total_vfs, uint32_t pt_us)
> +{
> +	uint32_t read_val;
> +	unsigned int id;
> +	int fails = 0;
> +
> +	xe_sriov_bulk_set_preempt_timeout_us(pf_fd, pt_us);
> +
> +	for (id = 0; id <= total_vfs; ++id) {
> +		int ret = __xe_sriov_profile_get_preempt_timeout_us(pf_fd, id,
> +								    &read_val);
> +
> +		if (ret) {
> +			igt_debug("%s: failed to read preempt_timeout_us, ret=%d\n",
> +				  igt_sriov_func_str(id), ret);
> +			fails++;
> +			continue;
> +		}
> +
> +		if (read_val != pt_us) {
> +			igt_debug("%s: preempt_timeout_us=%u, expected=%u\n",
> +				  igt_sriov_func_str(id), read_val, pt_us);
> +			fails++;
> +		}
> +	}
> +
> +	xe_sriov_bulk_set_preempt_timeout_us(pf_fd, 0);
> +	igt_fail_on(fails);
> +}
> +
> +static void build_common_sched_priority_choice(int pf_fd, int num_vfs,
> +					       struct igt_sysfs_choice *common)
> +{
> +	int ret;
> +
> +	/* Start from PF */
> +	ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, 0, common);
> +	igt_require_f(ret == 0,
> +		      "Failed to read PF sched_priority (ret=%d)\n", ret);
> +
> +	igt_require_f(common->num_tokens > 0,
> +		      "PF sched_priority exposes no tokens\n");
> +
> +	/* Intersect with every VF 1..num_vfs */
> +	for (int vf = 1; vf <= num_vfs; vf++) {
> +		struct igt_sysfs_choice prio = {};
> +
> +		ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, vf, &prio);
> +		igt_require_f(ret == 0,
> +			      "Failed to read VF%u sched_priority (ret=%d)\n",
> +			      vf, ret);
> +
> +		ret = igt_sysfs_choice_intersect(common, &prio);
> +		igt_require_f(ret == 0,
> +			      "No common sched_priority between PF and VF%u\n",
> +			      vf);
> +	}
> +
> +	igt_require_f(common->num_tokens > 0,
> +		      "No common sched_priority across PF and all VFs\n");
> +
> +	if (common->selected < 0) {
> +		igt_debug("Common sched_priority has no selected token, "
> +			  "defaulting to tokens[0]=\"%s\"\n",
> +			  common->tokens[0]);
> +		common->selected = 0;
> +	}
> +}
> +
> +/**
> + * SUBTEST: bulk-sched-priority-vfs-disabled
> + * Description: Verify bulk sched_priority modification with VFs disabled.
> + */
> +static void bulk_set_sched_priority(int pf_fd, unsigned int total_vfs, const char *prio_str)
> +{
> +	struct igt_sysfs_choice read_val;
> +	const char *selected;
> +	unsigned int id;
> +	int fails = 0;
> +
> +	xe_sriov_bulk_set_sched_priority_string(pf_fd, prio_str);
> +
> +	for (id = 0; id <= total_vfs; ++id) {
> +		int ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, id,
> +								       &read_val);
> +
> +		if (ret) {
> +			igt_debug("%s: failed to read sched_priority, ret=%d\n",
> +				  igt_sriov_func_str(id), ret);
> +			fails++;
> +			continue;
> +		}
> +
> +		selected = igt_sysfs_choice_selected(&read_val);
> +		if (!selected || strncmp(selected, prio_str, strlen(prio_str))) {
> +			igt_debug("%s: sched_priority='%s', expected='%s'\n",
> +				  igt_sriov_func_str(id), selected ?: "NULL", prio_str);
> +			fails++;
> +		}
> +	}
> +
> +	igt_fail_on(fails);
> +}
> +
> +/**
> + * SUBTEST: sched-priority-vf-write-denied
> + * Description:
> + *   Verify that sched_priority cannot be modified on a VF.
> + *   A write attempt must fail with -EPERM or -EACCES and the
> + *   current priority selection must remain unchanged.
> + */
> +static void sched_priority_vf_write_denied(int pf_fd, unsigned int vf_num)
> +{
> +	struct igt_sysfs_choice before, after;
> +	const char *new_token;
> +	int ret;
> +
> +	igt_require(vf_num > 0);
> +
> +	ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, vf_num, &before);
> +	igt_require(ret == 0);
> +	igt_require(before.num_tokens > 0);
> +
> +	new_token = before.tokens[(before.selected + 1) % before.num_tokens];

Missing loop to try all possible values?

> +
> +	ret = __xe_sriov_profile_set_sched_priority_string(pf_fd, vf_num, new_token);
> +	igt_assert_f(ret == -EPERM || ret == -EACCES,
> +		     "Expected -EPERM/-EACCES when writing VF sched_priority "
> +		     "(token='%s'), got %d\n", new_token, ret);
> +
> +	ret = __xe_sriov_profile_get_sched_priority_choice(pf_fd, vf_num, &after);
> +	igt_assert_eq(ret, 0);
> +
> +	igt_assert_eq(after.selected, before.selected);
> +	igt_assert(!strcmp(igt_sysfs_choice_selected(&before),
> +			   igt_sysfs_choice_selected(&after)));
> +}
> +
> +igt_main
> +{
> +	unsigned int total_vfs;
> +	int pf_fd;
> +
> +	igt_fixture {
> +		pf_fd = drm_open_driver(DRIVER_XE);
> +		igt_require(igt_sriov_is_pf(pf_fd));
> +		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> +		igt_require(xe_sriov_admin_is_present(pf_fd));
> +		total_vfs = igt_sriov_get_total_vfs(pf_fd);
> +	}
> +
> +	igt_subtest_with_dynamic("default-sched-attributes-vfs-disabled") {
> +		for (unsigned int id = 0; id <= total_vfs; ++id)
> +			default_sched_attributes(pf_fd, id);
> +	}
> +
> +	igt_subtest_with_dynamic("exec-quantum-write-readback-vfs-disabled") {
> +		uint32_t eq_ms = 10;
> +
> +		for (unsigned int id = 0; id <= total_vfs; ++id) {
> +			igt_dynamic_f("%s-eq_ms-%u", igt_sriov_func_str(id), eq_ms) {
> +				exec_quantum_write_readback(pf_fd, id, eq_ms);
> +			}
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("preempt-timeout-write-readback-vfs-disabled") {
> +		uint32_t pt_us = 20000;
> +
> +		for (unsigned int id = 0; id <= total_vfs; ++id) {
> +			igt_dynamic_f("%s-pt_us-%u", igt_sriov_func_str(id), pt_us) {
> +				preempt_timeout_write_readback(pf_fd, id, pt_us);
> +			}
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("sched-priority-write-readback-vfs-disabled") {
> +		for (unsigned int id = 0; id <= total_vfs; ++id) {
> +			igt_dynamic_f("%s", igt_sriov_func_str(id)) {
> +				sched_priority_write_readback(pf_fd, id);
> +			}
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("sched-priority-vf-write-denied") {
> +		for_each_sriov_num_vfs(pf_fd, vf_num) {
> +			igt_dynamic_f("%s", igt_sriov_func_str(vf_num)) {
> +				sched_priority_vf_write_denied(pf_fd, vf_num);
> +			}
> +		}
> +	}
> +
> +	igt_subtest("bulk-exec-quantum-vfs-disabled") {
> +		const uint32_t eq_ms = 10;
> +
> +		bulk_set_exec_quantum(pf_fd, total_vfs, eq_ms);
> +	}
> +
> +	igt_subtest("bulk-preempt-timeout-vfs-disabled") {
> +		uint32_t pt_us = 10000;
> +
> +		bulk_set_preempt_timeout(pf_fd, total_vfs, pt_us);
> +	}
> +
> +	igt_subtest_group {
> +		struct igt_sysfs_choice prio = {};
> +
> +		igt_fixture {
> +			build_common_sched_priority_choice(pf_fd, total_vfs,
> +							   &prio);
> +		}
> +
> +		igt_subtest_with_dynamic_f("bulk-sched-priority-vfs-disabled") {
> +			for (size_t i = prio.num_tokens; i-- > 0; ) {
> +				const char *prio_str = prio.tokens[i];
> +
> +				igt_dynamic_f("%s", prio_str)
> +					bulk_set_sched_priority(pf_fd, 0, prio_str);
> +			}
> +		}
> +	}
> +
> +	igt_fixture {
> +		int ret;
> +
> +		ret = __xe_sriov_bulk_restore_defaults(pf_fd);
> +		igt_sriov_disable_vfs(pf_fd);
> +		/* abort to avoid execution of next tests with enabled VFs */
> +		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
> +			       "Failed to disable VF(s)");
> +		igt_abort_on_f(ret, "Failed to restore default profile values\n");
> +		drm_close_driver(pf_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index ecc0f4c7f..6516a0a9a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -327,6 +327,7 @@ intel_xe_progs = [
>   	'xe_vm',
>   	'xe_waitfence',
>   	'xe_spin_batch',
> +	'xe_sriov_admin_profile',
>   	'xe_sriov_auto_provisioning',
>   	'xe_sriov_flr',
>   	'xe_sriov_scheduling',
