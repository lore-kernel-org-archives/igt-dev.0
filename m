Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5B3E776F0
	for <igt-dev@archiver.kernel.org>; Wed, 24 Dec 2025 18:15:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5A6112B23;
	Wed, 24 Dec 2025 18:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bxKy2okV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C2F112B23
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Dec 2025 18:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766600123; x=1798136123;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=9am6OZL2Cjq1AgHd6yRJWCMoV4t3pcvBfgbCkfi29Rk=;
 b=bxKy2okViSeD93LIMSIwlg6F2GhbjQnj70p331wOYobTfPBb3wJ43cDY
 LsomkXzLjuwJ5UVDnEjpczvsHI6QygsVFwgCVO60Q/czAJQ3lStYFuJ1b
 h66vT/InrgGBLo3V+1hZBTySAHo1byB923Mr8cfLRdYd4E8txGyLTdKrg
 GlZr/99uN3AwOrAWtt6ST9DkLEE32Q5zsi62ivPgm4PSx6lF/AiLPyKSz
 +pC3fQi9veM34C71GtKUdn8/U/RRJtuty/bDlJASrzpvtb0ifJIt8FtTy
 VvG44tDyTvfs77WWvLFwzs2KGD9Kc8fRjcWoOQFAOOglZrL4PBCub+80c w==;
X-CSE-ConnectionGUID: S+GcMr58SQCIvojARYAd/g==
X-CSE-MsgGUID: rMkqKQtfRC2JiHRYs+PVFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68472801"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="68472801"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 10:15:23 -0800
X-CSE-ConnectionGUID: 0LqX2bcWSZ+Nc6XZz45S+g==
X-CSE-MsgGUID: CrE1ObDyQnuXj4aIJqRCgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; d="scan'208";a="199972630"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 10:15:23 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 10:15:22 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 24 Dec 2025 10:15:22 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 10:15:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XtH81TEirUhyDIN1N+WomNZFCY9QWLtvlMw2oDImlCaejatdGbLzJnLzeI7CRRb83mTWth3sh2dZiC9GnDf8tKBLvtVkWTulj9wTYakAku7nyBdIwzmfU3r3aoMCW125JwvF5iSzNJi4QoPfAoHQ6Ux3skFhJIw1++u+kGkIb08NGSIBZzPC9WX1SQc6jRH1HUGsLeZYpX41nJk30jw0ND6H36PongZnnoRzHKlUAi0MSDwRmCCHY9sPjmzHoNg1+x2abAD/dq9ex31U60osVORNFPcSCu9b7vnxIqdR+8yYxhg+7RC95iCDP/DdPFAz4JRrQt9DlFCJUTDTuarKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kuZYPLOwmrWKs1R9yYkUUku1D29IiOCCxHHupaqzXAk=;
 b=pizjU60Egjw1P/MLH5RM/DLLazmZzD+d1B9fan5xqRQYxXYAmzaWeTBl3IhN078EJFGdsEUalaWHl3pmXz+IlimxQ/8ngOr8sT8lYDvigIGKirYa7VjX3VwuGOHywP/T/6xno7jsP59MNyZ6vtblLZyGYEMr732+btoBU1R5AUit7GP0w5UFE67WhkzaBJu/gf4UGBPKkxqcE6KMpA3yz4qQpddTIfNHhU/+7leC7pxIxb9omHnL4sXTjcZnEgjCWDzPzBb7PyrYGwad/S78MLjQoyiJ2uSOdYQEfwggOX16C/kq6uNehTKWomSj7qZ8g61xtsEAWl77sEAwGWs65Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW6PR11MB8312.namprd11.prod.outlook.com (2603:10b6:303:242::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 18:15:18 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%3]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 18:15:17 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251218174650.120788-1-kamil.konieczny@linux.intel.com>
References: <20251218174650.120788-1-kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t] RFC: runner/results: Allow generate partial json
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Mateusz Grabski
 <mateusz.grabski@intel.com>, Ryszard Knop <ryszard.knop@intel.com>, "Ryszard
 Knop" <rk@dragonic.eu>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Date: Wed, 24 Dec 2025 15:15:13 -0300
Message-ID: <176660011383.4692.7953552036898973877@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW6PR11MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: c0ea8140-d569-4054-d520-08de4318646a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zjl6ZWh5ZDNxNGdPYmt5cStrL3JObEVGeHA5U1VqU0JQaHI1TmRQU012VWMx?=
 =?utf-8?B?RWhpVnFuYmZrVWZxV2gzbkNUam1oczJSTnFyRmdHZTBDUVhMQ3NIeThGSm05?=
 =?utf-8?B?Z2QvbXA2VkZBYzExYkkyMUhTTGtYTXBla2c4NFFtS0lqNHMrNEx3S2JLSDBW?=
 =?utf-8?B?SzNRUlIwakk5U05XdlFmbGl6aXJxTmtObmZ4cG8yTkhVOXp3cGcwd1dLV0xy?=
 =?utf-8?B?K1BvZkpzWDBqQUowN3luRzFLYW5UWW0xdGpLdEFRbURzUFpuNEpQMmNTZEZv?=
 =?utf-8?B?MWczM3Fhc2ZYeUM1ZGR5cG1vcjFHSHMvazF3YURtVG9qV1hnQUtVZHRPS2FM?=
 =?utf-8?B?WndZYlI4dHdacUc5WGtuR2R2M0VNcDdjSTRndzZYU0xNbW1TcTJjNFgvWThN?=
 =?utf-8?B?RkZuSDh3eWQ2MkE5MmZHYy92UWpIcWxKSHZNZWZyT3BydDBGeHVCQ1pNb3hJ?=
 =?utf-8?B?S2grbHFYNHdTek55NmtVK0dmdUcrYjlyNEJvRU0ySCtnbW1wSEdoRHhodUJa?=
 =?utf-8?B?OFhlOUozc3lxbzdjcXBmQldiQ3Z1eGV1UmFyeTVwcTl1bGp4aFFxNnhUS0dz?=
 =?utf-8?B?N1pOV1lJSzRmb1dpRysyQVVNMEV2TWpvdWRvd0JsbXJqbzVuY3lFODFnOHZu?=
 =?utf-8?B?dTNTTXpzSDcwNjBud1ppNEoxOVZCNEdDMnJYV3k0a0xVR3hlOExoVThKRWZD?=
 =?utf-8?B?YUpjanArUzEybE5mYzVMcVdPd3ltRk1HbkpvelBaa1BnajVXRHN4eUNqUlRY?=
 =?utf-8?B?Z2tBUGkxODBuR3FsRWlqMkVsV2hLdXJrZ2o0QXVxMkFDd25sdTZpdmRaQkhz?=
 =?utf-8?B?bTI5dER5NnltRHF5UGJON0s3UERBczVxTDltNTd3aFJLbjhkUE1Db0FMR3N1?=
 =?utf-8?B?YVF3aUtRdjFHVGZNQnlzN3lkbGFjOXkya1dIZ0xreWpKQXZieS9BU2h4ei8z?=
 =?utf-8?B?VGVXMXhOS3dkQThicENuQmpzYVkzNitTdkNGdlFpRS9rSFk4MEtwQVdqY3dB?=
 =?utf-8?B?N3pZQW0vZ1liMXlWWFplMk9icjVJYXhTWGV0S3B1RUdBd0d2QzcyMWM5MEZj?=
 =?utf-8?B?aGcvRGhFbmhscm5MZHNaOFo0N0kyYkQ4bENmWEd1TjM4NDJTQko0aGdhT1Y4?=
 =?utf-8?B?MnVISmdWZXRVMDRuWmhrU0dvTnR5Sm5kc2NRSGhxVDhETFVQL05KWFJJTEY0?=
 =?utf-8?B?VGZuVEFRSzUzT01WdFNEdldJUVFTM0Z5SUVyMFBFdjljV3U5bXJOVWxaZmw3?=
 =?utf-8?B?eEhTU3BPanNoamJ0aTgxTS9EUEtLK1o4bmxqNmU4YWx2eVlHUURxVkRwOTNB?=
 =?utf-8?B?Z2dRZTI5cjdKa0QwUUxjTHJ5RFI4cXNwYWFUWEdFQS9qMERIMnFDSXRwcGZM?=
 =?utf-8?B?RVVIYWpCUmV1TnZwQWRsVDJiMUVWeUpveUFBd1lJWXlhYmUxUkNNdlhGcTh3?=
 =?utf-8?B?djQreXc1YzhqVTYxSjJmQmxKajNKTjRYdk1yZzlCMEMvVUxIMGNaenFvM1lB?=
 =?utf-8?B?NFJ0ZEJpeVVkWlRvYW1kOTFEWnNiVEFpaGswVStNZDFXUmlzLzJyWDRxdkxa?=
 =?utf-8?B?dUVsRkwyZ0F5SGpIUE9SV1pnNWdOWHBlcUFOeTBCc0o4N00yS0lDZk9RQ0o1?=
 =?utf-8?B?TllGNy9IaThSSVhwVVowV2xWbTh4MWlwa1FWclpLOUJCS1cvTW5sNnpOZGdK?=
 =?utf-8?B?ZSsxbnh3R2t6WHJ5aVBKalpPODF0YktRZ2JNMldGTUtOUDREWWQvOUpWUC8x?=
 =?utf-8?B?QmRWYkhCa3g4bWRDYnliQVVRci9tOVg4VGtvUVQyMVQ4am9JeC8vdEtFM3hW?=
 =?utf-8?B?RThUUHVVczFQZWJyNWNsZXljL2NOV0d0WGFtY2VVWkpJaDZvaDdPVXRNQXND?=
 =?utf-8?B?Zk55OWNKVmozS0g5c3gvVmxlZjVlOEhPNVFCNUlkTmhkSkRJS3Jvd3R2Z3Bq?=
 =?utf-8?Q?/Ju/EHMHCo4YzUASG+ZA5uJWSzWB5yPq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkZsTGY3OVRKNXorMmJsQWVXSFVwOTJMaHBtT3pMbEdaYXBJb2ljZFZrdnIw?=
 =?utf-8?B?eDVJTVdQQjBkU2QyWFlkVk5iYTVrcnJDbUJuQVZzTWRDTEtWU3ZNaHQrcEF4?=
 =?utf-8?B?OEd0T05vdzllK3FWWnhnN242R3czMDNOTzNicGZRMmUxR1F6Y1RtT1BuZm5S?=
 =?utf-8?B?UjRZSzEyVVkwVGFCNGxlUDMweFBsYys5d2pvQS83TFFGbjc0MWpwMVVqWGI4?=
 =?utf-8?B?anVIUnRFZ2d1ZHNvamkxaGNKZWJzOXE1a3ZiUFhTQzVMbGZoMFo0cUV0b3hx?=
 =?utf-8?B?SWtEdURWSUE3bGVEUjViS3FsSTlTaUhKb1M4NVJabEUvTGdYN3oxMStTVVh2?=
 =?utf-8?B?Yml6cE5lNU14YTdnalBXQUw3aHljZ08rb2VZeWcxMTFGaUl2cGpiY1JDaDZu?=
 =?utf-8?B?Z2J6Tmg5Q0NIVDZJY0dlamxPUEVhV1pleitNT2dzUW5YRXI2WXpzNDMzbUZo?=
 =?utf-8?B?a0dmWVVnNUFKbmJGcWYrVVZMMnZNMytFS0xidGpXVVk2QWorUnQvREZMaVUz?=
 =?utf-8?B?WXZlZUwvaUtQSm53UFpKMFN5M2w4VldsVlFyck5zT3VMQVdoNG91SktpTFhF?=
 =?utf-8?B?R3dueFJ2QnBieUYycEgvQnlSam1MRXhvUGdJNGpkNUNaamNIUXBKYVRXN1dR?=
 =?utf-8?B?aXM0UnE1YitHcjNmd2xEK1pXczc1UkgzcVNtVVBtUGZvbUdBNnI0UUx0SFI3?=
 =?utf-8?B?UDl2aDJqVVk0OUlpR3ZETzVzZ2huQUovOGdURmhtRTFwdHVEL1Rpc0hCVlJZ?=
 =?utf-8?B?WmY3TENFamFQLzVTbFozTUk5N1RzcmVkelRhWUFEZW5BZnYwVU9sZzVnYW53?=
 =?utf-8?B?OFFwWHBQMUtib0NKVVUxL2JtSmFlQTlQN3dOZGhWdjQxcmFnbExGVnJDRGsy?=
 =?utf-8?B?cHVhN0ZGSXNGUDBVczBNeldWQmgraTdUMDdsR1FoYVd6bDJWbklQdUg5WVJv?=
 =?utf-8?B?aVY2TktIdzl4R3FDZk1ra0l3dDhiQ05wWmdLRytzOExvU1kzSnRqVWNFOVZs?=
 =?utf-8?B?RG1zaEhyQWtzdGlXWkUxV2loYXRNWmpjZm1pSlJKS2NxQ3RvYk0xOWVnMFI2?=
 =?utf-8?B?TEh1bzNMcFA2U2ZXMDBQeDErb0d0clBPWDVMWER2VXgrQ2VtMzBON2JuR3pJ?=
 =?utf-8?B?b2FDUVg2RWhieEw2aTMwU2tKb0JUOTVkTHZ3MWVVRmlNTzJhWGpYcjZ2dXB2?=
 =?utf-8?B?N0FQYTROOHNDN05XVXJKUHF1SW5EN0JrY1BYc2hlU3oyeHZJTUVGQnl1TzV6?=
 =?utf-8?B?d3ZtYStwMVpMa25kNmxucWF2Zm12RzRmQVJuOHVjcWF2M0Jxc2tNdjF3bWNp?=
 =?utf-8?B?Qlg1cDlSOVk0TEQ0d0dKNXRoalBKN3QxUWNyaVBObVVBNXBQaG14ZVVjVzhm?=
 =?utf-8?B?QTY2WFIvQkczbTltb042cWtYRVFhTTFGdjJEdmFlSU1heVhpaG5sbUNWdGZK?=
 =?utf-8?B?eU5hSExKeXY0VVpvenBLYmJWVnd5OFBkVXBRb08vM09lMEdYKzMrbUNTRSsy?=
 =?utf-8?B?N1NoM0NaSThTUHErRmNZSmtZNGYrMEErWGU1TlBDb3UzMDgzVWdsMXNYNkRX?=
 =?utf-8?B?NlowZ1ZZNmMzemxpOU1GSzgwa1NTamJ1Z2hDNmkxaUcwZ2xwV3NHOXlvYTd3?=
 =?utf-8?B?TzBYbHl3MVJYak9iTy81NnhIMHB4Tkc5eFJ5cTF5WTg5TG1zOXFybXNveDlI?=
 =?utf-8?B?a1lPdWNCMlRVRW03RWZVMEs3aHByZnp5V3hyRWFSb2dqZEN6T2kyV3krNlpN?=
 =?utf-8?B?NEZ1L1hmZEY1ZVF0VHgrRDdXSmJodGNLcWxVL25ESDl5U3FtWlg5R0hiMVR2?=
 =?utf-8?B?S0RaTC9USGpJd3lqbFA2eUNWRDhNdFc2T0taR0RjQW4zU0JPZ2gwOTNuU1hE?=
 =?utf-8?B?NXEwME9weU13QlJ6SzlrTEowMDRYMWJaQXkxTkJueWVyZ0NscE1WUldGUzhw?=
 =?utf-8?B?NHQ0MEpTTU9vaXovWktGbmdWOWl4VXZ6cWkyWUNaRlJibGEzc25OSnBwNkVW?=
 =?utf-8?B?TlgyZXJaemZ5NTdZVFNGSHRwT1lQTlVjMEUyb3cxS2lBUEtSTWlXNDJMOWtz?=
 =?utf-8?B?L0EwQ0VtUVMwcXA2aWZGTUtlVlQxR0JiZTVPV2hHNVlvUVZON2dBRG1mckli?=
 =?utf-8?B?bHdQL2Y0c0pUNUhQemRzYVBtYTdUYkVxWEhCcmh0dlM3VTNlVVp5ejVKbita?=
 =?utf-8?B?U1REM3l4ZERGU3EwYzAzSWw0Q1N5Q1F5SnVoSEtEdnRwYUZkZktYSTlKUnhO?=
 =?utf-8?B?ZHNaNEtENUw1cXRzdWlTMzFaUnJ0V3kvbVpyKzFqaU85N2RSSHg1VzBvcSt3?=
 =?utf-8?B?M2R4UWZ1cTNmYVJrQ3E1Q0taRnFmcjIyVGdpWEJqNEJRUHBBR0pyZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ea8140-d569-4054-d520-08de4318646a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 18:15:17.9316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTU+mTeXUymJdMJoqt4kvvEZ10lFpO1+1hE/yrKoSDS2R2ig750EYY0WL56s856X/eWAi/x22HMxa5yQ6PGMtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8312
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

Quoting Kamil Konieczny (2025-12-18 14:46:50-03:00)
>When json-c hits 2GB barrier it fails to generate results.json:
>
>resultgen: Failed to create json representation of the results.
>           This usually means that the results are too big
>
>Allow to select start and end folder for generation, so it could
>be done if a few steps, for example when there are 0...5432
>output folders, it could be done with:
>
>./igt_results /path/to/results 0 3000
>mv /path/to/results/results.json /path/to/results/results-0-3000.json
>
>./igt_results /path/to/results 3001 5432
>mv /path/to/results/results.json /path/to/results/results-3001-5432.json
>
>Cc: Mateusz Grabski <mateusz.grabski@intel.com>
>Cc: Ryszard Knop <ryszard.knop@intel.com>
>Cc: Ryszard Knop <rk@dragonic.eu>
>Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

I find it odd that we are generating a full string representation
in memory to then only be used to dump it to a file.  Doesn't json-c
allow streaming the JSON object directly into a file?  If not, I wonder
if there is another lib out there that allows that.

An alternative appraoch would be to open the output file for writing and
"help" the library by doing part of the top level entries of the JSON by
ourselves.  Something along the lines of:

  * Write "{";
  * Iterate the top level properties (key, value) of the root object:
      * Write the object key;
      * If the key is "tests": recurse;
        else: use json_object_to_json_string() on the value.
  * Write "}";

I think this partial open-coding would be preferable than breaking the
output into multiple files because of a limitation of the library we are
using.

--
Gustavo Sousa

>---
> runner/resultgen.c | 25 +++++++++++++++++++++----
> runner/resultgen.h |  2 +-
> runner/results.c   | 31 +++++++++++++++++++++++++++++--
> 3 files changed, 51 insertions(+), 7 deletions(-)
>
>diff --git a/runner/resultgen.c b/runner/resultgen.c
>index 1f7e79f24..5e0f5d320 100644
>--- a/runner/resultgen.c
>+++ b/runner/resultgen.c
>@@ -47,6 +47,9 @@ struct results
>         struct json_object *runtimes;
> };
>=20
>+static int r_start =3D -1;
>+static int r_end =3D -1;
>+
> static void add_dynamic_subtest(struct subtest *subtest, char *dynamic)
> {
>         size_t len =3D strlen(dynamic);
>@@ -2309,6 +2312,7 @@ struct json_object *generate_results_json(int dirfd)
>         struct results results;
>         int testdirfd, fd;
>         size_t i;
>+        size_t tests_count;
>=20
>         init_settings(&settings);
>         init_job_list(&job_list);
>@@ -2379,7 +2383,17 @@ struct json_object *generate_results_json(int dirfd=
)
>          * - options
>          */
>=20
>-        for (i =3D 0; i < job_list.size; i++) {
>+        i =3D r_start =3D=3D -1 ? 0 : (size_t)r_start;
>+
>+        tests_count =3D r_end =3D=3D -1 ? job_list.size : (size_t)r_end;

I didn't spend much on this, but here it appears r_end (and hence "end"
argument of the CLI) is actually the maximum number of tests to be
processed starting from r_start?

--
Gustavo Sousa

>+        if (tests_count > job_list.size)
>+                tests_count =3D job_list.size;
>+
>+        fprintf(stderr, "Number of tests for parsing: %ld\n", job_list.si=
ze);
>+        if (r_start !=3D -1 || r_end !=3D -1)
>+                fprintf(stderr, "Parsing only partial results, from %ld t=
o %ld\n", i, tests_count);
>+
>+        for (; i < tests_count; i++) {
>                 char name[16];
>=20
>                 snprintf(name, 16, "%zd", i);
>@@ -2434,12 +2448,15 @@ struct json_object *generate_results_json(int dirf=
d)
>         return obj;
> }
>=20
>-bool generate_results(int dirfd)
>+bool generate_results(int dirfd, int start, int end)
> {
>-        struct json_object *obj =3D generate_results_json(dirfd);
>+        struct json_object *obj;
>         const char *json_string;
>         int resultsfd;
>=20
>+        r_start =3D start;
>+        r_end =3D end;
>+        obj =3D generate_results_json(dirfd);
>         if (obj =3D=3D NULL)
>                 return false;
>=20
>@@ -2475,5 +2492,5 @@ bool generate_results_path(char *resultspath)
>         if (dirfd < 0)
>                 return false;
>=20
>-        return generate_results(dirfd);
>+        return generate_results(dirfd, -1, -1);
> }
>diff --git a/runner/resultgen.h b/runner/resultgen.h
>index ab0bf1082..14ae96a54 100644
>--- a/runner/resultgen.h
>+++ b/runner/resultgen.h
>@@ -3,7 +3,7 @@
>=20
> #include <stdbool.h>
>=20
>-bool generate_results(int dirfd);
>+bool generate_results(int dirfd, int start, int end);
> bool generate_results_path(char *resultspath);
>=20
> struct json_object *generate_results_json(int dirfd);
>diff --git a/runner/results.c b/runner/results.c
>index 3eb7cb155..62ae8a1c0 100644
>--- a/runner/results.c
>+++ b/runner/results.c
>@@ -9,6 +9,7 @@
> int main(int argc, char **argv)
> {
>         int dirfd;
>+        int start, end;
>=20
>         if (argc < 2)
>                 exit(1);
>@@ -17,10 +18,36 @@ int main(int argc, char **argv)
>         if (dirfd < 0)
>                 exit(1);
>=20
>-        if (generate_results(dirfd)) {
>-                printf("Results generated\n");
>+        if (argc =3D=3D 3) {
>+                start =3D 0;
>+                end =3D atoi(argv[2]);
>+                if (end >=3D 0)
>+                        ++end;
>+        } else if (argc =3D=3D 4) {
>+                start =3D atoi(argv[2]);
>+                end =3D atoi(argv[3]);
>+                if (end >=3D 0)
>+                        ++end;
>+        } else {
>+                start =3D -1;
>+                end =3D -1;
>+        }
>+
>+        if (start < -1 || end < -1) {
>+                printf("Error: start and end options should be numbers >=
=3D 0\n");
>+                start =3D -1;
>+                end =3D -1;
>+        }
>+
>+        if (generate_results(dirfd, start, end)) {
>+                if (start >=3D 0)
>+                        printf("Results generated from %d to %d\n", start=
, end);
>+                else
>+                        printf("Results generated\n");
>                 exit(0);
>         }
>=20
>+        if (start >=3D 0)
>+                printf("Error: cannot generate results from %d to %d\n", =
start, end);
>         exit(1);
> }
>--=20
>2.52.0
>
