Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65386C624C6
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 09:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33D810E3C6;
	Tue,  1 Sep 2026 09:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GpjNXHbU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1672010E3C6
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 09:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788255691; x=1819791691;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N01zyWfmuobDlXxRdCf894fk9GfJIPqS200W8hdFSMQ=;
 b=GpjNXHbUYEdut6Bj00WZCIr8qUYD7/oxCaL7eagnyNNyVWdH4yQZo75o
 +JOZ/OZpcGFMKqMnzkmkPv5Vkd8kuiTust9YfS3ORqMsI0CumEIxKw2mi
 0y03fI2ImvU70LK5YMwfJuKnouLjYMHRpRU72EPJI29SPuouvYIh3mp4A
 m6eq46UM3T8o1BgKIlzzMmKvNjBCpNWZWohjb0jJqWrZOcQdu0fbyLmYi
 XmJeQdeaygT8g7on638VpiP/tOf2vxe2n3ageKyXQugSyIb1VuPIydZm1
 vH+NEvXzcEazc+Zz9GYjiyl/c2LVR14NZDPR2YBXAcgDX8CanixYUUv1f g==;
X-CSE-ConnectionGUID: REgWtRw7SVqajonbGl8Zjw==
X-CSE-MsgGUID: a59InM8mRpGvmqdPvuqt7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="92496153"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="92496153"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 02:41:30 -0700
X-CSE-ConnectionGUID: JDAXV8bbQ/agL91dP0KaYA==
X-CSE-MsgGUID: oaaXU3BGT9KTf0cV+y9s2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="270991906"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 02:41:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 02:41:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 02:41:29 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 02:41:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbHf5KZgzCFGLxmGF6ja1XPN1ZKaaCXzF6vTRN+KmRR6OWtPt3hyTviMaB3ErMsRh7PvpufjMbyXYfseV5kSAJncdmGg/gFeolD5OOu8w/c5evmeZMaadtkPRCFoTKy7tqbkN/AolxW5VqOD0W2MNb/aFeSYLsrMlUb2QHR/sWi8z9YSC/9+OtXbpYFt1oS0BSFcPnO3GCmDzdiAfzXt02ZiTeZiDIMcgSr7zTcF9zTcx3Oi41/hwqGp4vTXlvPrlqlsg1ZlydNQmvihd+Pzya0Z3f6KeAYbJm0MpZD2CkRQTbiWDm62VB5bCNbtwEvddLhl7FckNUSAvoUDjHgf3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4jAkITbhC+R6Ams3B9zIgmipO/8mbZ2aM3rXubDE+M=;
 b=efp9IKqS4v8hKCgftvJl5ViXqTpD53bmquT83j8z/mHcqeLIZVhpTm65YztWaW1q3tau1GeX2580VU0LaZg25e8Ztl5HOmE/998fBjJg1+DtQa4S3ZO2/tN+rUiHZ7XNfT3/TrAp0EeZ+HcpU1h934DW1hAcOpSM6r7uLMJGlByGMAFXbR8HCiwgKF09wOAdBM7kGCwM8hv/W1OgCE7q4AyYQokb9Blc0mn2H0/dNckxsugM/NkiTl2mb0Foq82WWaWmfOU/ZwkoSYX75mslKDmhLoddTY1h+g2RM2iYK1hRLF493jciV0g366yocrH/q0jRGNMF84p8EjwFvBY5IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 PH0PR11MB9703.namprd11.prod.outlook.com (2603:10b6:510:399::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 09:41:27 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0382.007; Tue, 1 Sep 2026
 09:41:27 +0000
Message-ID: <3da47c44-d6e6-497e-ab63-adea518bf73b@intel.com>
Date: Tue, 1 Sep 2026 15:11:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] lib/igt_drm_netlink: Introduce DRM RAS Netlink
 interface library
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <mallesh.koujalagi@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
 <20260824164133.129138-4-ravi.kishore.koppuravuri@intel.com>
 <c9b431c59949a9499d79e166886413591de113e4@intel.com>
 <19d17250-946f-46dc-a640-44ed08aa6dde@intel.com>
 <a5e6c6f48cca679ef182b533cfd33079e20f5522@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <a5e6c6f48cca679ef182b533cfd33079e20f5522@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0185.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::13) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|PH0PR11MB9703:EE_
X-MS-Office365-Filtering-Correlation-Id: b4ff95b3-a320-4f93-5b1a-08df080d315b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|4143699003|6133799003|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: hZDxANNPL2YXKRtwGoFo3MiAXDOrqiOdJROMysBI9185qImJtQMMLLGFvurfF1y7kFTKZnx0eI/UBu+9OR+cWnFFZsIh+z9AU0jiZjsNEiPseNXxE+YY1CFplbUHYFqULwX+8tCRfWER0ycH/dGYZZBn8ri2pzLNF6kuomnP9qjNQHxq05CD9FM0OmLbDvZ0RpyglyN4tjGusrQG1yfo+8guK7RvdkoVRtBRJl5AwzhHO53CHPem+Ir7B5sCj0PEiwbU8FfeJh4BFF1Cpx37nFeD9u5flGqiotU5EZpbygT8UxCjxYZSk6twBTCN3vWXDHLwPX3GRyEScnZuw+9uXrRLya1/bJ+Rd7p0jZgyDRG3+tpM+4UYqh9fl4jJ02GBvhgT6L8eqVgatar6rKwmJ2nE4F+2anV20sizYSSNRoJfJB+znfRr/611yAbwFQVUBSwxlyx7IHbbEYL7YO9lca8TcFFe1ktJoVyld8IyR/TEbtKF+u/3pXVkSO9T+SyHEJNlMBw7gDDUCJlXb7p1F89lbjb9l1MZIqub7gCkLxfiobgHDGB9mxly0sbLFuy2KdhUm8ndZ3OxmxV83kuAuR0F4aetep2sO8IEdhpfJZxQuczpGlUlO7lfV9bYfv/ZSD/6Dg+SqGq5h4VItoD6Y2GAVWdDaKPvBc9eveGWpWY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(4143699003)(6133799003)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czh1V2ZFQklNTGJwai96Z0Q1T2lUQ1BUNjEwSjlnT2M3OEc4R08wWTJqREZJ?=
 =?utf-8?B?MWVPVG43OXpJZlAra3MwWmQ5RzZuRmpjQkIzbm1NUG5PLzUrczFudjFVYld5?=
 =?utf-8?B?cStCZldob3pwZExWZnVCR0RqVFdxTzE5MVhmNlRIQWxXdmo1V0lGSS9zMGZu?=
 =?utf-8?B?dUZXL1JHU3BUOHRGdTIyMnc0d05lVXhPZ3BjRzczTVRycUVRSE5TWHZTUUpC?=
 =?utf-8?B?K3NoYWswZm9ZcFIwQUszZkN4eHlwdDRLdU9rcUREZFkwdjdzUTZ2bDAvUjVJ?=
 =?utf-8?B?bVd6UE1LSEdPSkhqb1VmWWZJWnd6YllITDRNQW9tbHhmRTNoQVVtTkNlNzJY?=
 =?utf-8?B?ck1jeUkrQ2M2MDlkZFZKaG5HN05NMU9jcXVXOE53dzQ4L3lRQUdJQ1dROGp0?=
 =?utf-8?B?QUVnRU9mM2Vxd1krd3lPczE1eUwvOWp3RzNFMXJ3OVRUZWZQS3hQVzk3bzJr?=
 =?utf-8?B?Q0Vka2l5bzIzM1VjWmZFdnNYMFJiSmRRZThPZmFqRkRNMjJIRzFEQkpXcGpr?=
 =?utf-8?B?K2dpOW82N0E5Z0xrRnZYdEhSZ0FnNGk4RUwxTEtibUFUWlZCUGhlSGtmRHRF?=
 =?utf-8?B?ZW91NGVVbjh6M05HaWI1MHV1NFFxSWJjZ3BYT1N0ZzBMbTJ4QnBUQ056eFhz?=
 =?utf-8?B?VEtHVVNNNmN4S09RTjdZRWU3aTBlM29UaUtuVGt2TlEwZllBT3UySW02azA1?=
 =?utf-8?B?MFlEMDRZZXdTN1dHa2k2bjB6NXhBMEZia21naUpuYVZxM1hac21CY1duYmhZ?=
 =?utf-8?B?d1RNSUdTdmRVU0ZHWnk0Z2Y0NDB4OU5aeEpjcUJTQ3k3UjNncEoxNTJabm51?=
 =?utf-8?B?UXFsM3dxZkJJajRNWXFEaXhucDI5YTJnQVJWZzZhRDZhZkw3WkhMK01VeS9y?=
 =?utf-8?B?OUhOODQ4Qi9vcWVOaWR3NlJxK1dUMDZuRXNhM1JReTZNdFlHZGdmNkcxVElH?=
 =?utf-8?B?WmtrMzdyKzNDQVFvclJVOTAxbWtrR2FReHhlTktuOENCZUFhT2k0WTBObDV3?=
 =?utf-8?B?bWpjTVdJaTZGaG1xd1dJZXNPNzFwa3U2UmJmZE5GU0JJMVowQWMwMHppWmFP?=
 =?utf-8?B?UVZCaTZpb1lRUmhGcG9vWWh1UDdFeFpzYU9kT0lwblRtSHVmUE9IVUVJblph?=
 =?utf-8?B?YlN5UHNpNStwN3JKUkdQL2lTN3VtTkNhUE95SGYxUG9jWDQ5aWJqTU9aUW9P?=
 =?utf-8?B?dmJ2R25RUnQ5MXJ0b3llMjd0eFJLWGtFb3YvWi9CSjZ3ZEl6d1NZMFpYazNJ?=
 =?utf-8?B?bE0xejQ0M2tLMmx6VFZiOFNEMkhuM2JZNkZscVl6MU9wWGc4SzBHSklMSjNp?=
 =?utf-8?B?a3psNnRaQktOV29hTldDN0hscG5rcUVDT2F6TmFkVFdUZTFsdmdWSHhkaTNt?=
 =?utf-8?B?T0ZtcEhiZUtCUStSUE8yWWQ4ZTN4TDh1TG9xdXhTS1ltb1J3aHlVYWdlck0r?=
 =?utf-8?B?TXEwWXhDNnM4cmZ2bHd5cDlza0Ixb04vZFBtdlRHd2ZvdmNFQS9CQ1JxUUZI?=
 =?utf-8?B?WUtoQ0piT3BCU25zQklUNEw0MVJidWhWbURib1BrcVNMczZzWjFYZDQ3emRn?=
 =?utf-8?B?enFTVVM2OUJvUkFVUjBYYzdSdUx2L1NHYkN4TE9rVVY1N041K0dBdzlwY01M?=
 =?utf-8?B?d0ZidEpTV3BraStWMzhWMTNEMlZRc0dCQjdJU3Njc0oxWGVBYkk5VXZpL0FR?=
 =?utf-8?B?MGNTOWpENElqQVBocTRBQzdzelJpK2VSaXo4WWtvOW5nREpRSjJxN0RIMTlG?=
 =?utf-8?B?Zk8zUW5wYUR4MXNENmNVRGxBclh1R1Y0bkRKbktnYUYyR0xDSHE5VkxTTVZU?=
 =?utf-8?B?RmhKQ2FjbGQxaVU5ZVBhQ0JBdTJZVU95Z3NNbnRBY1pGYVY4M3NEYjFFd3NR?=
 =?utf-8?B?UThlV0cxYmloQ2huMnZ6MlYyVStwbVZnSDJwRjZrV1JUVlVWbXFibmZraWF1?=
 =?utf-8?B?ME01VkNwRjBLZEMxNlNTT0V2VCsxaTNLak5odmM3ZzBVclpNZjhtTHRpM0Zp?=
 =?utf-8?B?eGZyNmYwNUJKQ1l2RWRGVDhMRlpPQXI0UHJTeUUxcjZBczJZQXFmS0xUZ2xw?=
 =?utf-8?B?SmdmTzVRRDRZTW80UzdoQ1BLekU5SEdaV0Q5bXFaSFFSMEpQbGxSR0dLSEJ2?=
 =?utf-8?B?eWs5MUpTNlFzUVA5cFVZUE8yTFBoVmh0dHJwb2dmWS9FWjdWQjFISS8rbHAr?=
 =?utf-8?B?QjFKOWVZbzBMM3dMUWE4cHNsQlhyKzNJN0tiMzR1ZmltRjFKMXlERW9VbGJx?=
 =?utf-8?B?dFpHTTd5QUpBc0JJbnJONUZ5dnE0ZGxCM01pdDM5M1BjN2hhc2g3VjEwUjFn?=
 =?utf-8?B?U3lMckZLeGN4OGpLb0ZRdG5JajNkRG82WnhYWWZPaVNvVlBqUW9IWmo1ZDlU?=
 =?utf-8?Q?qKD8VPY9/lZVTsPd3MWBsa6FOqaT9s0f44XOf?=
X-Exchange-RoutingPolicyChecked: EAYOkljgEA+kc8ryN0BmRtBBnOCoiMqmLpOlbsoT/0G8tz7z2dbTKwrbzi+Ui7DImt7TK3scG5KFPNr0mjeUVmC92wse906bBUPioGXi5NGAy/2Z7HwcP4r+VHWjRAL7bPBDVXMn2aY4vR6shAlw3BJKROXl9xYgRX09pU+Eo6YKLXR0NWpOWDrqva/phX4Hq26xc3P4nTwoMDBkGsQodm0MNNhnKars331fn+VXY01hueuoLcRhs6/ukJbj9fxpKspDG3zX/yeyCR6InUBm0OwoO1vnWbwy4lwVN5iiHgfgImR/1UBo/gmxCjIBxacs5XvA9oF591YPXLlciACISQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ff95b3-a320-4f93-5b1a-08df080d315b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 09:41:26.9560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbBo0eqYsMLa/1wpb9+Y+7dlaTNoLtsnDs1hpESq+nhUCdkbLJzZslhhpJJCWWkIGF/g2u+342sXnH0+lGnXX+NpclHTa+gcqd8X3bS1IDOgzev2CqoQG1Cj6vXqF9aH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9703
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


On 31-08-2026 18:03, Jani Nikula wrote:
> On Mon, 31 Aug 2026, "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com> wrote:
>> On 31-08-2026 14:16, Jani Nikula wrote:
>>> On Mon, 24 Aug 2026, Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com> wrote:
>>>> +struct app_context {
>>> Why doesn't the name indicate netlink in any way?z
>> I am using this structure to maintain the context of request received
>> for the library functions and responses received from netlink functions.
>> So I have not included netlink or nl for this structure name.
> "struct app_context" in code seems too generic. If you see that alone,
> you have no idea what it's related to.
>
> I don't know, I guess I would've named it struct
> igt_drm_netlink_<something>.
I will update it in the next revision. Thanks
>>>> +	struct nl_sock *sock;
>>>> +	int family_id;
>>>> +};
>>>> +
>>>> +void igt_cleanup_nl_socket(struct app_context *ctx);
>>>> +int igt_init_nl_socket(struct app_context *ctx);
>>> IMO "nl" is the wrong place to abbreviate.
>> libnl is the user space library used to communicate with DRM netlink
>> socket in the kernel. All libnl API references have the word "nl" for
>> netlink. So, I have followed the same in my library functions as well.
>> Could you pls elaborate your suggestion, if am missing anything here.
> I guess I would've named them igt_drm_netlink_{init,cleanup}().
I will update it in the next revision. Thanks
>
> BR,
> Jani.
>
>
