Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20726C61DBD
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 13:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D4710E2B0;
	Wed, 26 Aug 2026 13:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9R6kOxv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C91D410E284
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 13:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787749633; x=1819285633;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=osnZdfyqT/lPkwSJHz0qTK0GUgFeReU++cLxdAHP34g=;
 b=N9R6kOxv1cLPzXWOQ/UkPNV4Kf9mUzYC4+gadexmrP7WW0vbKb3kPgJw
 PvJanrZsXpNblmUzjV9eIe3DFsll+/U+Rsv7fhWSsJqqtT/ZMj9smypyI
 F7TMWbscTH7JSkblZgwIvOavP9Wp8nB4ryue2qKbjo0XoURzcyAVytWqm
 cGzBgdLxetzXpIqVcFGngo2xL+aF8qMdYDfiX+EuxVIKYm5OP0PD95q6L
 YdFIMWDE1cZJrmAFzEx1aYzkpLl1yvQGLv/WOzUifjOeaGcgSQr2IPxfc
 AcXvd3az8vfeDMfFurqL8jlFRyquAdb+onx/D5s0YekjPFUxO77rPFEFy w==;
X-CSE-ConnectionGUID: +ovHfdhZQCGd3AS5xY8j5A==
X-CSE-MsgGUID: J01qbwH/SESXrJ44pSKZKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="113766261"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="113766261"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:07:12 -0700
X-CSE-ConnectionGUID: IbyrK9uXTEy2IC0/Xk+65Q==
X-CSE-MsgGUID: xfMv0v6HTe2cxQY4NF6UZA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 06:07:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 06:07:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 06:07:12 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 06:07:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=huf42mir/NEmCruqw2LC6w53Gzhcdl/M6S7pqkai0iSykbXufD2P7HlhHccb51axJH4h0KxJipT2SfMB9LdPeo81vaq00xuJAKrCkCgmP0yoNibQvaGuLC4OpfeWrL5N4qs/J89FycM4sV6lbrW1wiciDXEpWlIeGRFIXqOJRqS0bv0xhNieLvvM3PTqLogw8nudQcYm79//jd/7EWBBbdn9rt8Pw4BNcluV//MIHbPuLr7gWPYx7RiNCf7CTidfac29CTrtpAp749gJEuwe+a0+OgOICRYMKNBQoFFJeW5gAeabQbkjABs/ZfbEkS1HrtMiOyEg0ZnnDdH5pquBrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QFJcOEi2dzkkAwy+68Yjf8oOK6YWXA/Jt40Ra8K+Sz8=;
 b=uWeVkFGtNH30TIHFt+OmdclHQbLxQ0OUzpr25r5sKBEJBcf9cOmoi3SxUYlYmZWdhgClhyrOdEYTJmp6ep57gSbNV5EydFVgYkFdHVrbA1pxIpdlQT6nJl2zj2S7MZ9KFFNbOp96jnpyH9/ZjWG/C60SCYRCoILRkxbx0j3TZp10229dRDB/6WAMfeAy77oOZ5hUFbG50R9wZPBXdJQxssauxeSlYNSL6oTemZvO05R4arNIoecUTNl+nDKK/1cxej9GIh+3SEbJunUa+uw1BogoDExtA6J+nnj7mKIau6psjtLonqQgFuyUBNtwjes7hxK3ZOJlFrroVcva45LpOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by DS0PR11MB6352.namprd11.prod.outlook.com (2603:10b6:8:cb::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.8; Wed, 26 Aug 2026 13:07:08 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 13:07:05 +0000
Message-ID: <e5c319a4-8278-4404-a2db-ca944fc47d86@intel.com>
Date: Wed, 26 Aug 2026 18:36:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [2/8] lib/igt_drm_netlink: add get_error_counter support
To: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <mallesh.koujalagi@intel.com>, <raag.jadav@intel.com>
References: <20260729121959.603890-3-ravi.kishore.koppuravuri@intel.com>
 <98fd2a7d-340d-4419-9a63-c20ec8f5972e@intel.com>
 <1254eb6c-481d-417f-b8c4-847c8354739d@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <1254eb6c-481d-417f-b8c4-847c8354739d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::7) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|DS0PR11MB6352:EE_
X-MS-Office365-Filtering-Correlation-Id: 34007a7f-fa20-42f5-6b6e-08df0372ecf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|6133799003|4143699003|10067099003|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: I35aXLtGu0E/jYeZU1IncXOIgRpX33Ra0E+rDABqgNhiSGCX3svO8YTfDIL6fmAI4B1ktG0iBUXa0DvU1L6SE06m90EegpPVa2DQAFY3cVKx7/tv6lkE5EtblkNVd6YmeJb6jX+q7Oqr7KnK6uqqm+mbeSn+D0I8qSPVxQZByqgfloCnDaUx1zmlS9p67iALXLSNOHMwmyUbdX+G5fdhxNqGqsupSgkfpX/IGSMT/vUB+Oy5IMO+nEol0zV5ljOHSsW54pubTID9JjYw4TdWT1LKdLgMqEYcyi0oh7YCzsnI7WqAjepZDAWdgJqztjC2ZL8UNITjPFZz5cT8atK0uhKh/OCPNaT+dzueRICMWqHRPO25kxktam9ZN3BtMkLDUIh5GQ5SaGDNKp+gcW9K0E5ojMjYYyOS3bdut9ZYZK0L0Z5RudacelBEmWylCTeSh6rOLuWrB9/tyRqXlqPShwQsnWFWcHkk4CAgFTP+/IbO5fZbw1gS32SuQSjiJfzHq64ObRHEnNvklktbSbmqRsqr5pAf+nDATJ//DESa5+DJAxtaYWuzWUGssPO8UKgmuOqi4MLGb7XlWQ7+oTalONjdYb1FwaXgREMEbO/dUAKcnKO2+5GiA/jpY/7JVYT7VKeLWY1yoB338MgiZgdXnCaprP0tWzhFuTEa39q9yuc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(4143699003)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STBmeVI0S2gzeVZZREJ2bEZXeXM4QW9zMFBCS3dUOXh4Sm51QjB0NU5hTVE5?=
 =?utf-8?B?cXlGaUdzZEF3a0h5bTZMcUJDb1RLVG5sNzgvMUQxTzFGdUlRR1YvL3BlcjZJ?=
 =?utf-8?B?ZkFpMTV0V01DdkI1ZlE2ZjI3b0EyVnh2WGUzOGU3RlRuUzRPQ2lLTlZEa3hS?=
 =?utf-8?B?azUxN1hOVXRXdmR0aFpNVTdoaE1yQ0tTd0pOazhpLzJ3RjhhYnhIOUpicmJu?=
 =?utf-8?B?bGU4SXNrRVRNUk80VEZSYWNDUURLTGM4c1VlQmpVdWJZTTUweG00eUVZdnNK?=
 =?utf-8?B?dVhSUFRBOXVaR0w1T1diMWt1S1FqS1FOeGZLdmx4aXZ0enhrUlc0cXdtM3M5?=
 =?utf-8?B?ZmlQa3dlR2s5OUhmcnJvZUxZMTVqMjd0S2x4QjFlekV1N0wyZHYrTXgzNlh0?=
 =?utf-8?B?cW5rZzZPd2d0S2JIQSttdlY1N1hFZ0xuMGkwVlE0algzYnRQc1FtQnVhRWJ3?=
 =?utf-8?B?WXhzN0xkcDAvVngyc3JoWGdMNGczNStrWVloSi9zcWpQWXlmc1VTZklKYzQ5?=
 =?utf-8?B?V2JMTHB0cHVka0FlL2p6dEwzZ0syd1NzaWVEbUw1eHlNeEF3cUNRbXZlT0d3?=
 =?utf-8?B?MU0xbnd5Yk1ENGxTNThPSDV4Wjg3N3QwdFJ4T2RqTDE0RTlBVjRueUJJNmRH?=
 =?utf-8?B?eXZNTGhhdGhIL0RjZkRpaENvWkk0MC9ldno3Y3dxeWhEM0VBdGJ6U2oxMlhn?=
 =?utf-8?B?VFZsdTVWNXVPSjBCRVRaNjh5RnFYNkdqMCs2dnJtd2s3bzFSNUNjZExpWDJN?=
 =?utf-8?B?R3h1bUg2RnBXOWRFNmZYYTNwMWdqbmFYSDdjRFdNalQ4YUkxT1QxR003M3hn?=
 =?utf-8?B?c3B3ZDhhVDROeXlnMHBBTDZMdjBoa2VQZmk0cnAyMG9Ja1hQTVdNUEJwdTFN?=
 =?utf-8?B?dVNuK1dsWDZLR3ZuNk1PMVQ4Wng5bWZCRFY0NzRYOWNpWWpReVhpTXN2dmxz?=
 =?utf-8?B?N2RocGRCSHZDTEZGRWxqTTF5c004aHpPK3ErZHNTVHl6Z3hWWjN1bEZDSy9T?=
 =?utf-8?B?OFlMaU42bXV6VnZ2WFVWY1A1THV0U0dzSW5GaHZsaFpoLytUU3p2dXlzQzdS?=
 =?utf-8?B?RFpKY1d4RXB0RnAxN29xQS95Wk83dEgrVjM4cWJwVzdVKzBQQ1Fvb21jSFEx?=
 =?utf-8?B?WVpWM0RGaVZiVVB0cTU3Q240ZzZiOC9sNFE3V3o4VFk1ZlhWaTNLYktITlR5?=
 =?utf-8?B?ME5vSDhUVGxJay9Ea0hHMWlUZ1p6TEVDaHFReDRaakY1OFVzKzlQK1IxVEdR?=
 =?utf-8?B?clRZN1lRdFpZZS94L2t2R2hnQlFTZXVXRWN6VU1keEdyL29KK1lQdkJwUkJU?=
 =?utf-8?B?WDRkalBwS0gzbExEVmExa0o2Vi9HV1FNemNIY0VLSTF3M3RZbGFQYXkveWZH?=
 =?utf-8?B?ekI2NjN2Tkh0OWZyNUd3VGxiZHd0WGxkN2Y5alIxV2FiVWpzazI0Y011OEJ3?=
 =?utf-8?B?WlhUSHBlZUY2WGlRZmIzYTFRQjd1U2F3SXFyZWwzdTFIdmpWOHFyU3hIaHU3?=
 =?utf-8?B?UnNsVFFGOTYzdThtR1FIWWc4RHdVYjBsd3ZGOStvczlMU3FmYi9oTTlGMW82?=
 =?utf-8?B?dzRUOTNHclRsSWtHMzMvRVdMc29LSjUxZk9YNS9MSWQzUHg4VVZWRDU5N3ZM?=
 =?utf-8?B?VUlIUnRieGpzeGJZNE56UEdDOTZCOE04UlpVTnFXRkpHdll4QUc2WlB6N3Uv?=
 =?utf-8?B?RWsvRFBHVGNsZHc3MGg5UnVaZlBJaFRyck9hMzRIeFE4SjhNNDIreEtBQ1FY?=
 =?utf-8?B?OUM5dDJ1djRsTEd4WTYvWXdMM0FmQUF2eDlHdXo4SXByU2VTTEt0NXREWWo4?=
 =?utf-8?B?MC9WeFQ2eVJaVU4xc1RqVE8yeGNhQUxtb2MySGVhZSthYnpkTXYzbUZ0bEZ3?=
 =?utf-8?B?MnhFWjJxMmVsWXRZdnBnZE0xTm80eEgvRmh0Tm1Kd3JjUzlaY01JRDEvNms5?=
 =?utf-8?B?NWs2TlBJWDYvYWtWT3Uxa1N3QUlQOFdBQkNVb0NwMzk0cVZ4TUhRcFVNNGIr?=
 =?utf-8?B?Ulo0eDZ6ZFlSZ3RKN2V5NG1kWEt2V2F2d0VXZ2E0RWRjcGFBbjNtaEZLQ3l0?=
 =?utf-8?B?SnJpUnp4WjgyNnFydW4rRWJoOXlZLzNmQVRWQmhhMFBkWXQrUWtMK2F4dm9E?=
 =?utf-8?B?ZzIwYkN3N2pLam5yWkpZZE9zbW1yMWVIZksvZEJQemVTcEZVdVkyQTV2bDQr?=
 =?utf-8?B?TjRzT3RTVHkwbk0xQTcwRmY0K2hqVzk3dmtUM2Zsd3pLNmpORkQ2MlprR3FX?=
 =?utf-8?B?aktXOXdLTjdMb05BdkhBd3c3STZjZjZBNG5oSUsyaDN6VDJNcHlBdkVRejFN?=
 =?utf-8?B?WGQ1VXRXOU9HY05KeWFiZ0R1SW1UUUhVRHVHSVJWZ0pLdWs2ajBHQXRwdXBR?=
 =?utf-8?Q?kwE2MuxgZgwJCIE0=3D?=
X-Exchange-RoutingPolicyChecked: TqV3pBWmZ271QnsPBezpN52PFdJpWvsoxF75Hq/8HiQvenjwh7yvFt9YZxjrkkLMARafESDPWDP9BViZgetl4pzdINZjQSMxIaTYTuR9GZcUQsZr+xeZY+opJmk3lKLsf2r+oGXlhNuKc5UiEGHlpnVW8GTAlkb+aC4ZAaLNrmw/Z1mS797NlrrlKQkN/j5Ds8bzRlCWfz4LXEXreukvk6Eerm0JnjNYo4i966GcZoqX27OFR5zsLFTPfIlcqH19vov/3l2la7c/OK1kA3PJ8xywGJyPedtLFGOJUXVwEeX0KG8SpZji4enmaC3ECCnzv/nk/xFxKdyDMTMhcYJ8gA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 34007a7f-fa20-42f5-6b6e-08df0372ecf0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 13:07:05.0389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjQF7pjKEECx3U1bw3aRl0PH61UTb42OLb9pXdSVJU6xlpUmvG0RZbv8675TA84jT8HfRUm4+BZdzLRCEGYpiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6352
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

Hi Ravi,

On 19-08-2026 13:20, Koppuravuri, Ravi Kishore wrote:
> Hi Soham,
>
> On 14-08-2026 19:39, Purkait, Soham wrote:
>> Hi Ravi,
>>
>> On 29-07-2026 17:49, Ravi Kishore Koppuravuri wrote:
>>> Add netlink request/response handling for 
>>> DRM_RAS_CMD_GET_ERROR_COUNTER.
>>>
>>> Signed-off-by: Ravi Kishore Koppuravuri 
>>> <ravi.kishore.koppuravuri@intel.com>
>>> ---
>>>   lib/igt_drm_netlink.c | 179 
>>> +++++++++++++++++++++++++++++++++++++++++-
>>>   lib/igt_drm_netlink.h |  11 +++
>>>   2 files changed, 188 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
>>> index 1c07bb2db..4d543275d 100644
>>> --- a/lib/igt_drm_netlink.c
>>> +++ b/lib/igt_drm_netlink.c
>>> @@ -5,6 +5,7 @@
>>>     #include <stdbool.h>
>>>   #include <stdint.h>
>>> +#include <errno.h>
>>>   #include <stdio.h>
>>>   #include <stdlib.h>
>>>   #include <string.h>
>>> @@ -17,6 +18,146 @@
>>>   #include "igt_core.h"
>>>   #include "igt_drm_netlink.h"
>>>   +static int ras_command_cb(struct nl_msg *msg, void *arg)
>>> +{
>>> +    struct app_context *ctx = arg;
>>> +    struct nlmsghdr *nlh;
>>> +    struct genlmsghdr *gnlh;
>>> +    int ret;
>>> +
>>> +    nlh = nlmsg_hdr(msg);
>>> +    gnlh = nlmsg_data(nlh);
>>> +
>>> +    switch (gnlh->cmd) {
>>> +    case DRM_RAS_CMD_GET_ERROR_COUNTER: {
>>> +        struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
>>> +
>>> +        ret = genlmsg_parse(nlh, 0, attrs,
>>> +                    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
>>> +        if (ret < 0)
>>> +            return NL_SKIP;
>>> +
>>> +        if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
>>> +            return NL_SKIP;
>>> +
>>> +        ctx->error_value = 
>>> nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
>>> +        break;
>>> +    }
>>> +    default:
>>> +        return NL_SKIP;
>>> +    }
>>> +
>>> +    return NL_OK;
>>> +}
>>> +
>>> +static int send_and_recv_nl_msg(struct app_context *ctx,
>>> +                struct nl_cb *cb,
>>> +                struct nl_msg *msg)
>>> +{
>>> +    int ret;
>>> +
>>> +    ret = nl_send_auto(ctx->sock, msg);
>>> +    nlmsg_free(msg);
>>> +    if (ret < 0) {
>>> +        nl_cb_put(cb);
>>> +        return ret;
>>> +    }
>>> +
>>> +    ret = nl_recvmsgs(ctx->sock, cb);
>> Is it blocking ? if so, is there any timeout ?
>
> nl_recvmsgs receives messages from netlink socket and processes the 
> message using the callbacks registered (cb).
>
> with libnl library, default mode is blocking until it receives atleast 
> 1 netlink message or an error.
As this is being used by send_command, it will block the process for 
ever if no timeout is used.
Isn't it possible to set this nl_socket in non blocking mode ?
>
>>> +    nl_cb_put(cb);
>> Why the callback is being removed on the fly ?
>
> Here callbacks are getting registered per-operation and once the 
> message is processed using the registered callbacks,
>
> there is no use with cb object and so releasing the respective 
> callback object immediately after processing.
>
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +static int send_command(struct app_context *ctx, uint8_t cmd)
>>> +{
>>> +    struct nl_cb *cb;
>>> +    struct nl_msg *msg;
>>> +    void *msg_head;
>>> +    int ret;
>>> +
>>> +    msg = nlmsg_alloc();
>>> +    if (!msg)
>>> +        return -ENOMEM;
>>> +
>>> +    msg_head = genlmsg_put(msg,
>>> +                   NL_AUTO_PORT,
>>> +                   NL_AUTO_SEQ,
>>> +                   ctx->family_id,
>>> +                   0,
>>> +                   NLM_F_REQUEST | NLM_F_ACK,
>>> +                   cmd,
>>> +                   DRM_RAS_FAMILY_VERSION);
>>> +    if (!msg_head) {
>>> +        nlmsg_free(msg);
>>> +        return -ENOMEM;
>>> +    }
>>> +
>>> +    switch (cmd) {
>>> +    case DRM_RAS_CMD_GET_ERROR_COUNTER:
>>> +        ret = nla_put_u32(msg,
>>> +                  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
>>> +                  ctx->node_id);
>>> +        if (ret < 0) {
>>> +            nlmsg_free(msg);
>>> +            return ret;
>>> +        }
>>> +
>>> +        ret = nla_put_u32(msg,
>>> +                  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
>>> +                  ctx->error_id);
>>> +        if (ret < 0) {
>>> +            nlmsg_free(msg);
>>> +            return ret;
>>> +        }
>>> +        break;
>>> +    default:
>>> +        nlmsg_free(msg);
>>> +        return -EOPNOTSUPP;
>>> +    }
>>> +
>>> +    cb = nl_cb_alloc(NL_CB_DEFAULT);
>>> +    if (!cb) {
>>> +        nlmsg_free(msg);
>>> +        return -ENOMEM;
>>> +    }
>>> +
>>> +    ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, 
>>> ctx);
>>
>> The callback could have been set during initialization to avoid 
>> setting and removing this callback on the fly.
>>
>> Thanks,
>> Soham
>
> It is possible to register all the callbacks as part of initialization 
> and release the callbacks during cleanup.
>
> That enables the persistent callback object and may lead to concerns 
> with reusing the callback object.
>
> As the callback object (using nl_cb_alloc()) is lightweight, and 
> per-operation callback registration helps to
>
> keep the callback behavior local to the operation, I have opted this 
> approach.

Imho setting the call back only once make it more clean and in this case 
you could also use conditional wait if required.

thanks,
Soham

>
> Thanks,
>
> Ravi Kishore K.
>
>>
>>> +    if (ret < 0) {
>>> +        nl_cb_put(cb);
>>> +        nlmsg_free(msg);
>>> +        return ret;
>>> +    }
>>> +
>>> +    return send_and_recv_nl_msg(ctx, cb, msg);
>>> +}
>>> +
>>> +int init_app_context(struct app_context *ctx)
>>> +{
>>> +    if (!ctx)
>>> +        return -EINVAL;
>>> +
>>> +    ctx->sock = NULL;
>>> +    ctx->node_id = UINT32_MAX;
>>> +    ctx->error_id = UINT32_MAX;
>>> +    ctx->error_value = 0;
>>> +    ctx->family_id = -1;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +void cleanup_app_context(struct app_context *ctx)
>>> +{
>>> +    if (!ctx)
>>> +        return;
>>> +
>>> +    ctx->sock = NULL;
>>> +    ctx->node_id = UINT32_MAX;
>>> +    ctx->error_id = UINT32_MAX;
>>> +    ctx->error_value = 0;
>>> +    ctx->family_id = -1;
>>> +}
>>> +
>>>   void cleanup_nl_socket(struct app_context *ctx)
>>>   {
>>>       if (!ctx || !ctx->sock)
>>> @@ -24,14 +165,20 @@ void cleanup_nl_socket(struct app_context *ctx)
>>>         nl_close(ctx->sock);
>>>       nl_socket_free(ctx->sock);
>>> -    ctx->sock = NULL;
>>> -    ctx->family_id = -1;
>>> +
>>> +    cleanup_app_context(ctx);
>>>         igt_debug("Cleaned up netlink socket.\n");
>>>   }
>>>     int init_nl_socket(struct app_context *ctx)
>>>   {
>>> +    int ret;
>>> +
>>> +    ret = init_app_context(ctx);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>>       ctx->sock = nl_socket_alloc();
>>>       if (!ctx->sock)
>>>           return -1;
>>> @@ -58,3 +205,31 @@ int init_nl_socket(struct app_context *ctx)
>>>             DRM_RAS_FAMILY_NAME, ctx->family_id);
>>>       return 0;
>>>   }
>>> +
>>> +int get_error_counter(struct app_context *ctx)
>>> +{
>>> +    int ret;
>>> +
>>> +    if (!ctx || !ctx->sock || ctx->family_id < 0)
>>> +        return -EINVAL;
>>> +
>>> +    if (ctx->node_id == UINT32_MAX ||
>>> +        ctx->error_id == UINT32_MAX ||
>>> +        ctx->error_id == 0) {
>>> +        igt_warn("Invalid node_id (%u) or error_id (%u) provided. "
>>> +             "node_id should be >= 0 and error_id should be >= 1.\n",
>>> +             ctx->node_id, ctx->error_id);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    ctx->error_value = 0;
>>> +
>>> +    ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    igt_debug("Retrieved error counter: node_id=%u error_id=%u 
>>> value=%u\n",
>>> +          ctx->node_id, ctx->error_id, ctx->error_value);
>>> +
>>> +    return 0;
>>> +}
>>> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
>>> index c20d5452b..e539bc030 100644
>>> --- a/lib/igt_drm_netlink.h
>>> +++ b/lib/igt_drm_netlink.h
>>> @@ -9,17 +9,28 @@
>>>   #include <stdbool.h>
>>>   #include <stdint.h>
>>>   +#include <linux/genetlink.h>
>>> +
>>> +#include <netlink/attr.h>
>>> +#include <netlink/handlers.h>
>>> +#include <netlink/msg.h>
>>>   #include <netlink/netlink.h>
>>>     #include <drm-uapi/drm_ras.h>
>>>     struct app_context {
>>>       struct nl_sock *sock;
>>> +    uint32_t node_id;
>>> +    uint32_t error_id;
>>> +    uint32_t error_value;
>>>       int family_id;
>>>   };
>>>   +int init_app_context(struct app_context *ctx);
>>> +void cleanup_app_context(struct app_context *ctx);
>>>   void cleanup_nl_socket(struct app_context *ctx);
>>>   int init_nl_socket(struct app_context *ctx);
>>> +int get_error_counter(struct app_context *ctx);
>>>     #endif /* IGT_DRM_NETLINK_H */
