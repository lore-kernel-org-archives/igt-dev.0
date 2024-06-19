Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6453AC27C53
	for <igt-dev@archiver.kernel.org>; Wed, 19 Jun 2024 10:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE38E10EC10;
	Wed, 19 Jun 2024 10:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e+rs3Wyk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF12510EC10
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jun 2024 10:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718792833; x=1750328833;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SJZxucIBCRLDQtXDdSN9cizWMdlwMBcWQPyQuRrpQjY=;
 b=e+rs3WykU3dGYBmEUnnAAGcM1un4PQuAmFQhF1QHeKWFEFpB16T+9xzo
 k0X8sHNXdQumqjIhx/3JNc/wzx3BswQF9s8IJdUrnp9w8bYdH9jAc66do
 s2Hf1OxzF9NeLSO/thuN91TIm+VjLgWFhXnlnD033Bg0Dy017ZJrUvyqO
 RwTa7ofYQs/D7DVhsxUUFeW3WslWZ3Xpb+9ojY9BJxnUdzowV5WU5bnr4
 Au3HcZ5ycwPKQ3I2UCAntBh+NdDKg8VsBlpQJKHLMo9sfI/cry5KymtiP
 /RmS+/azyItGcGggNluD2zbrKjdlscSpVGKjO/bx9n2rEpN4On08SWlnw g==;
X-CSE-ConnectionGUID: 85LjoSaIRlWSOPK8Hf3sUA==
X-CSE-MsgGUID: dLBPeEoxQICsrnQBB5Scyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="15689176"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="15689176"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 03:27:13 -0700
X-CSE-ConnectionGUID: RT080coGSlW98GM1p8aIkA==
X-CSE-MsgGUID: fS0omxTFQheuFAby7wYXtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="42012427"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 03:27:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 03:27:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 03:27:12 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 03:27:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLSU/MFSLQHdETZdoOBCd3Yc1gBG3v3Trxn8XCcDj2VP/E6tXFclxzvIof4Le0TuO7pcVQeKUFndqEbqXG4jw4ZaOmtZ/NvoyicC/+aXBCUN2u8O3mPWakVzfNLm61yw8xofr31yhCobthrDSnoaVP1HzOyZP0R9aX/mleCVqq4wVU+pGIC652ZnOUtyw8v7U8YBYKORGtkGNwb3UjSJtZnierwQEBwXja8d8PTPZSPzwKjQ95Pvb6eCQuokv54NLPGsYmvmGP8f3V/y4o9nh1UlVPiJgsrGbGL839I0F2d66sUwJ+WZTEPohjRsNecxSYTlUc0GZ0dNJ2PX8SnW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsLyRo3P+RC4ksMPVv01akB97uswhVb6ZXP3AEm9Upk=;
 b=RdaxOGTFCpAYGJspbIJZso8h2NOnShQDicF9rLJuNMfek1AP1q5eOKf0Z5CttKeTPXHabIXNBGxqsgVZCTHJmhuJ3TM132GY+aCuH0sxITuz58hx9MsLx9BL5jm2bZtMQWTK50TcvDKyHOaVo/TOTa5g2iyHXVqdsFXoaz8ObIdQypLZtqsoVPXmzOho7sjoksWDy1VWRIarrNSxYk9A85mjXKecHnoAyM9EpkbY2zazMuPN5VVbTcx1TusWvrgpyDBqgJaloiMV0otK4kCuWXj4DZ1iWs+u84+//GklTpcEOBJa8LwiyFyPkJP91g+X+um+jeDxLbb2drzpSKaPKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.31; Wed, 19 Jun 2024 10:27:09 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 10:27:09 +0000
Message-ID: <515d6191-11cd-4b65-a142-ecfa7b5bb739@intel.com>
Date: Wed, 19 Jun 2024 15:56:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel-ci: Block unsupported KMS tests for i915
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240619092049.4131162-1-bhanuprakash.modem@intel.com>
 <87frt9fdwh.fsf@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <87frt9fdwh.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::35) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SA2PR11MB4874:EE_
X-MS-Office365-Filtering-Correlation-Id: df7ed2f8-4e8d-4431-c1cc-08dc904a6000
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWViTVBqdThINkkwR3JsVTMwSkRHZ3A4S2pGdmR5NU1tSFdudWZmRWMrNEJ1?=
 =?utf-8?B?UmxDK3JiNllkSmQ1cGJVNGJ0c0JzYng4WGFDWGtxUzJNeWJVMWRzU0Q4Wjk2?=
 =?utf-8?B?cjE3czdrVXMwd3YxZkt0YU8xdGZHS2xuSkZUQXBudWlJcWRvbzA0ZUxYY3FV?=
 =?utf-8?B?ZDBOWmhkNDJuY1RHNE9DdlRncXZQVkIxSmN2bE9ndkhIYjBQdGFDc0w0VG8z?=
 =?utf-8?B?b2d1KzhEZE1wTlZHYmV4dFBqK1ZJRitXSnlVZFVIdmRnc2dCRDlGWmdyelFM?=
 =?utf-8?B?VFBTcFpBSFVkaVR4cjZNMWlOQ2JUaUNMTTY0cFAyajEwYkVqVGYyWUx2emda?=
 =?utf-8?B?d2Qrd3dYL25uZmoxendxZFZhTEJuR0JnZGQxQm5rSGZnN2ZkMzZyaStiTisw?=
 =?utf-8?B?WFpQSDVGWW1OZ3JtSG5aNWdBMWY0clRiYmZHZ3lOcSttd3dEMkZxSHBRekxY?=
 =?utf-8?B?eXA0U2hBVTU4LzlLZSswQjdacE5BR0Z0TUw1UHRYdmRBMlBlNEZDUUhYYWF5?=
 =?utf-8?B?dVlPU25OYTh0Zko2dnJhNmNMdnM4azFlRzdMSVJWLzJTak9SKzlXZzBWOUlE?=
 =?utf-8?B?MDRzTGxBaGNTditXQ0hEUXZFOXFpSE05UXpkVmh6My9mcXY5SVY3cG1XYjhK?=
 =?utf-8?B?YlpvN0JGQitDN2VEd3RNREQzcGcwMWp5ZElhUi9BZWFMYkd5MDhFNzRjNU1E?=
 =?utf-8?B?MDhqR0VDMTZ6UTMwZXI2WEJqdWEzaThUd09qWjlJOHJ4VXJtQXJwUEFZdG9P?=
 =?utf-8?B?RnpXT1BEWlNzZXpIeDhZU0xPSG5RSUViUHBxR3dxSnVVZ21WazI2MWl3T3VT?=
 =?utf-8?B?WkhxM0kvOGhjZzloVGNZMmJvU0RHakhMbEFxckp0TUVaQ21XMlh1b0ltUG9h?=
 =?utf-8?B?ZjVrWmp0amFHYUZoaFAxVXZSWWJHUFgydEVsR2VBWkVoWTJldThDOVU5cXh4?=
 =?utf-8?B?RmhvdjJLZnJqQ0RpTS8wWVk1bXhsRmpzRWlpUDBtRlZkajZOMHU2eHVMaURs?=
 =?utf-8?B?SUpkS05udDNJMXAwZ0JyWlpJR2xTcC9WYStHNTk0ZVVBRTM3bUIxZnZNZXdU?=
 =?utf-8?B?R3FJdFlwWXZPRXdEamFXaS93WnZCckNVbmF0c1ZRbXRlWExhSGcya1JETGNU?=
 =?utf-8?B?eWd6NWxEblpGTFFLVVNmQ0srZTZFa3h4czV2YzhhcXR4UWdvd3krakU5YXM3?=
 =?utf-8?B?d2lsSFA2d2MzTmlINTZzaGZ4R0d1bGxDNU9IWmtHUUFuT2szZTRCNjdUQi9j?=
 =?utf-8?B?Q1FGSEdHWlU0ZldybXJnYXBIK1I2anZYSDM0cEFQZEc1d0hMNkJXalNYa1c1?=
 =?utf-8?B?aWtVM0hWQkJudHBlY093c1A4ay9WdnRWS0lCbmw2eFl3WnJJM095SkJ6a21C?=
 =?utf-8?B?TVo1eDNQR0l5d0tXdm5NYTdnQ2Vld09ZNitmck0xayt4MThVR3RiWDA4ZURG?=
 =?utf-8?B?SkNyclpDckhxRFVHTnNiQnJ5QzNCaXAyQ2YreTlHdHRUSk1LRkhtU2l3WXRZ?=
 =?utf-8?B?MEFtbzM4bkZuL2NncGpQeCs1QlVjSDQ0R3F5VkptYnNNTkQrR0ovRkFzY0ly?=
 =?utf-8?B?UWRCTk15cjFiMHRuUnBabjFjR2tGbzF4bHpGOW1VY2dSbFkwVC8xdHRWWFNN?=
 =?utf-8?B?TC8yVEdwUW1kdkhGN2h4c2p2TDFibE03QWd4Y2czK0swMlpiM243TEhURHRD?=
 =?utf-8?B?NXUyaGlwK2xJN0R1V3lkczQyMkpRcFVUUGgyOXQydGJUcy9FYnlpTW1Tell3?=
 =?utf-8?Q?7aVRl82bY59JXj5QrJAv8ANxlo2/gczI4JsvgbQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S244czdTandYcW9oUWFyMFpjblVIL2RkRHJpOXRaUU0wdUpmSVlBZVZ0UDBp?=
 =?utf-8?B?bHlVYmJzcUsvbURVakp5Sm1SR0ZJYnRMc0ZKOUt6OXpQZVRKdStPbXdZRDZU?=
 =?utf-8?B?Zk0zR1JRNnlLL0lDcjBhWVVJUHU1bTgvQ3I3VEg3djhVeFUrZTkxdzdVVS9z?=
 =?utf-8?B?cUJzY3RJbU1CcFBzOUs2UGRFb2w0akZUeGFML09ENnFqYkV6eDdyUlVlbEpn?=
 =?utf-8?B?YnNrQVJEa2t4NU9IQzM2TGsvTHcwdjNyQnRMY3NieUlTWWY3MDB0YUdkd0Rp?=
 =?utf-8?B?dHA3WkdNYlozZU1qRHJDdTN2TFFnUWhzNmNUTVpsalFwcUdLejVhQWxBSmp6?=
 =?utf-8?B?TXFrSUhGeEpTS3V1eWlISlJQYXM0UjNjQVJveXJJcTE1MktzUWJseWlEemgw?=
 =?utf-8?B?aEhKSnZtK0pIdWgrZE5NQXlJcGpDTGZzWURYd1JBYTVFOTVvbjJZcy9kTUJl?=
 =?utf-8?B?TWhMQzJteTYyWGpGMStkSGdwVVg4bFg2dGE4YklTeDlUaFRseGpNd3Y5OE5P?=
 =?utf-8?B?cGdmMEt1b2ZmYUFGVkx0S0RKVGlzQ2hyc1dIQVdJaS9QTGNTVnY2Vzh6R3A0?=
 =?utf-8?B?cGlzRmlwc3doZ2g3cmVtVTlhNjVXSUVYcUVxanByOHJYZHBHZWYrVXhpWVkr?=
 =?utf-8?B?OUF4RExpZ3h1L1RLeW5Db0pBaUxRSmJBYy9VTkZKQTk0cDl5ZnBmR0dGQndG?=
 =?utf-8?B?bU5qNnoyd2R5K3A4MXN6TTBET0NWY3dsYlV1RyszYTV0MExiVktQdm5xVWVx?=
 =?utf-8?B?UzlycnlTYTVEZHZxSXBoMmFTcEVzMElMZnJnWjRuR0RrMkdLL0tyUmprZ1F1?=
 =?utf-8?B?c0I2RFROWm1HKzN5aTlYakRQVisrVzh0ZjJPb04wbnRoeVlQQVhHUWh5QzJq?=
 =?utf-8?B?RitWM1lQbmpzYU5kUDZOb3I2TXNJSkNYazlmSlJIYklldmJiYzQrWUkxMUcy?=
 =?utf-8?B?bkVqUmEzaDBjclo5Rjl5cGw1UUsxdjkwRjlmSUMrbkxHeitmZUVHNDJzUmNx?=
 =?utf-8?B?RTdPUlh1emVtUy8ycmxZWU4zUnlFUFFlUEpBNEwvN21XbkdwUnhxc3RGZURn?=
 =?utf-8?B?Skhad1c0a3EzVllkK0Jib1FwcGs0MTUyNFk2eFpqdnRSWkdTaFp5WHl3RDZY?=
 =?utf-8?B?Ty90a3FuOW9Bekt1NzAzZFVyS3k2L1JTdzhqUUU3VFM5dlc5SVJaUmcvdDVT?=
 =?utf-8?B?NVJXUDBpdHg1d2prMm9HZmFUaGR0TEV2L0JORExBaFhPQ3gveVpWcy9kTWdp?=
 =?utf-8?B?WVlDODY5SG1pT3hKa01mUXBJQ3FsbXdSU1hqZ3NxRGozQllDNy82TCs3Uk1j?=
 =?utf-8?B?YWpVcUsxcUJLNllHV2pjMmJ1cWFuL0pMUVdkZE96bVVyZEhEVXB0K2lwWGVx?=
 =?utf-8?B?QkF5bWhpR0xyb0FYOHdSRitlc1VGMStjZWxpOENNclpUbW1wdjlVMFphazYz?=
 =?utf-8?B?U0p0VTVueFpKZ1JkZTNwQ3JGRXFKMjlhN0s2OXIzT0pKMGRWRzc0WnFocXlT?=
 =?utf-8?B?eVVnUndGN1JxdGtUMlBkT3UxZDlmQUdNUE1LREF2MVJmYzVZWlA4Y2xqQm9l?=
 =?utf-8?B?NHhxcFpJaW55ZEFLSHY2MWNDc3gwVVIxaTRqdHdGVVJpbXpRV3hTTDFFQmNn?=
 =?utf-8?B?ZW9xRDlhN0Q1R3I5YTZqa2NWU3BPMzFua1lSWndhOFRNZy9rOTMvL3E5Rk96?=
 =?utf-8?B?YW15Y1BDUHJ5SS90TCtIVnY1NENlOU13ZDcveDI1amNMd3lpaVlEalhDZlF5?=
 =?utf-8?B?Vk9Mc1BteGpwdktMM1JyMzhLUmhlNVprVzZEcyt1NVI1L3AxWEZiVEJrbU9t?=
 =?utf-8?B?enhzS1VOZWNSRFVTc2VQTWRnWURlK1NIZlVidXhrdWVxdWJFVWJFcklDc04z?=
 =?utf-8?B?cDBDeG8zMmR0WnY5MUl1TCs2THpZT202TE1nRzFHdzVUdmc1NXRPVHNrSFRt?=
 =?utf-8?B?TFM0M2REWWZRelFVbHFNZWtVS040MGNWaVdkMWZValJsdWhQd3diNWV6VUFa?=
 =?utf-8?B?TUFPbnlCSW5wSUFuV0pPSUE0ME9HZVdZbkJ3Qi85SDAyQVg3bXgwaU1KL2hm?=
 =?utf-8?B?RWFKTHk0cmJrUUNVNkVmZXc5anVMNllaQ1ZGWFlta00yb0V6ci9vRHgrRVZi?=
 =?utf-8?B?em1FWXo4REQ0bElEUmkzVUt0WXBXZ1BzRjdMWVdXS05WVGRYRDJ5anZtT05m?=
 =?utf-8?B?VHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df7ed2f8-4e8d-4431-c1cc-08dc904a6000
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 10:27:09.6802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLAwCCikrjX/gtcb9aaaUXdLfbIioyLSR2grb7TJ8Y7Q2EdYyWM7gg8fJAaN52G+5HTME7HwOIEfdH2ZSwqpuEZ/o1Qz0unFJ/+biiDC7Og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4874
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


On 19-06-2024 03:33 pm, Jani Nikula wrote:
> On Wed, 19 Jun 2024, Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:
>> Block KMS tests those are specific to (display_ver > 14)
>> are not applicable for i915.
> 
> Feels a bit wrong to list features like this in a block list. IMO the
> tests themselves should be aware of what's supported and what's not. I
> imagine the rationale is performance? What's the impact?

I believe there is no point in running this test for i915, as it will 
always be skipped. The test already knows which platforms it supports 
and which it doesn't.

- Bhanu

> 
> BR,
> Jani.
> 
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> ---
>>   tests/intel-ci/blacklist.txt | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
>> index f6e9bb474..d01ef5e16 100644
>> --- a/tests/intel-ci/blacklist.txt
>> +++ b/tests/intel-ci/blacklist.txt
>> @@ -140,3 +140,6 @@ igt@device_reset@reset-bound
>>   
>>   # not working for i915
>>   igt@kms_bw@.*
>> +
>> +# Tests specific to (Display_ver > 14) are not applicable for i915
>> +igt@kms_vrr@cmrr
> 
