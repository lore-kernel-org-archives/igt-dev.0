Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9ACC021AA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 20:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC0E10E11B;
	Tue, 18 Feb 2025 20:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i8BNVJ1b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC4310E11B
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 20:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739909918; x=1771445918;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JOl+vH5684MdcElU7zooH5B5VD7F0SPsKHyiig7/mtI=;
 b=i8BNVJ1bJrC5n4eNToAMrzQhH1R8Il5/QZB/0rZqNYH6DQISuZPsOFsR
 8xPdQDI8Ky3sNtDx6UeFma0py67OyfjkwKpNQxpvwLVSSRvm690llsFcm
 9EtIilKHdENxAsnquc6WuPxBxNgIloHj8KHkQN0Zk0hpAqk6Zn518agQc
 3g82+gR5im6VRYRL+jvnqSLImHl4q6H8o0geb8ThdyZgNwe/sA9sy8kJS
 oTiAl7ufegM4lXpDrMjU9uUrME/ZYaFBDVJaKFS68X6MGlg/EvEjzQFWt
 vCYqy6Kq+cIOtfdpa4n81Gd4EHlEvKx6Y+GWuWEExQ4+nsTHdCNPWCBhH g==;
X-CSE-ConnectionGUID: fnGWTmN5Sp2XfAzf3SVq8A==
X-CSE-MsgGUID: ZATUgc+nRC2QUMNi01AIxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40335483"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="40335483"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:18:37 -0800
X-CSE-ConnectionGUID: wY8lV7prTTKYgpDD3q5sKg==
X-CSE-MsgGUID: 3n/gP35GSp69UxkV+Qt/UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="151709955"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:18:37 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 12:18:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 12:18:36 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 12:18:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oox/Sau27NzFl3MNOQas6lO1rKjnszAj3XwW7NcoElPYBm6B4obdvWA+EO6JrHBZV2mqtB4oF6kFLq4QsECwmgI0ZqetertK9aHgzG+yEgoqKxEMMeVkPfjQ31XoA3P84zbvXVxbY+UeTMMacLM3yVfGHBMLY8Nlnuo5MimZYr2R11XYSOnhKeC9lbqaZtGO4LFUUQv9JlbZ3F/zk8EShXbeF5h/TpgNdhDthptIDdz67nO6XAGKa6Bh6jYg9CmMcAe8135Jh++zxKHORxnYEBCcp14lBWYsDOw+emo6n1UbMDeLAGeuoBOcVf4usWU5e7gykyhWOjgq+mSmB4qrYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5YQoVci8n6DNa0NUM8d12O9FlEBOhEblJwKl9byjao=;
 b=Iyqp5O03/Cb02Xc/hZrfMcaw4iPIuVJC7zEQQezI/rEcQvA+nc3bK4hxK7GiB3vxDZQjM5tM7cAE8HTobCGcjKndTACC8ddDyS0OXwJME/WDSAamA+3m0nrOYM4LOjbalQrQ9hh2EUke97KswczyWSLTW23FTLqz1eoxz68+ji9mkp391u0JpfU0wZnuWLANQRjb6DzBjuIjRLx5cKKK5+FGTsh/066j0ma7ExMomF8drhbH6fVzWMYM9fK8EMDvVX0P4z9/qMmEgf2RMS2wTmUjwIDo0gSJUhDWQliVRcH5n3R2MqKDrCWPI4Ju+D259dHceloIP88kZ4/utQE7mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SN7PR11MB7540.namprd11.prod.outlook.com (2603:10b6:806:340::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Tue, 18 Feb
 2025 20:18:33 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 20:18:33 +0000
Date: Tue, 18 Feb 2025 12:18:31 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@linux.intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v2 3/3] tests/intel/xe_pmu: Add idle engine
 activity tests
Message-ID: <Z7TrF1yMfu+ckc0e@orsosgc001>
References: <20250217142021.951467-1-riana.tauro@intel.com>
 <20250217142021.951467-4-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250217142021.951467-4-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:303:b7::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SN7PR11MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: 08546382-e710-43e9-1ecf-08dd50596af7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NURCSUd0bG5WYkhvbEFrdGQ5elRER0gxQmp3TCtXcHBDeHR1RGJ4Q3hyNkYz?=
 =?utf-8?B?b2J2aGRZYmdXU2FQZitmd2piVTZkQ0hHV3J2anh2emQ3aVVyeDFwYmlBTzRV?=
 =?utf-8?B?UDdJSFRJV2lKYk91YjlCNTM0a2pnOFd6QzZFZHBVY2Jrd3BZOFdROVNZMEhF?=
 =?utf-8?B?TytiWkRoa3VWZG12b2xIZWM0NU9oWTEwTUFSTlJxTmJ3Mlg4anNLSjJPWUxM?=
 =?utf-8?B?TmdJeW9yY2Y0TTJCcE5FenZsWmZGTERmL3NWRDdtaWd3dG5XSHlSTHhucks0?=
 =?utf-8?B?eWxlakRnZ2xUR3dVVjBveFJWczRveGNyRWZZSnBET0ZkckhsY1R6QVZaeW5z?=
 =?utf-8?B?OEszUElIcjFRUTMxN2FMS29CNTA1N2huaUhtSGV6VUkyeHJFc3NuYmdBczAx?=
 =?utf-8?B?bzc0Z28xak1vSStUN2VBTmtuWW4rZ25SdkI4bGo2akpvQW4xT3c3VHdYbW9o?=
 =?utf-8?B?WUVhbUFFNSt3ajlHbEJCNldrRmt2OS9UVHB6MUxmME5ZRUpYMlQxVStRRkJQ?=
 =?utf-8?B?THBtU1RDdEhQVXBGSTczdUZCalUxaDMvalIrYXNRVGVtdlpleUsvVXRBbUs0?=
 =?utf-8?B?SHJSWDFxaDljRWVhdEtaTW05bld1ejBMbWtJWkNPQjE2Ry83T3FmUnNFVDhW?=
 =?utf-8?B?cjZqOVRkcjNlTG1CK2hBR3U3VDNPemZpbVZyNThtSnVrREh5Z3BpcnNCQTln?=
 =?utf-8?B?ZXJBVzFmaC9XRnBUOVhNcVAzaTFNWDR2aUZ5d2lteWhwaFBRMzFSemlGQTRj?=
 =?utf-8?B?OTZxQ1U1V1YwQ0J3VXNKNnFzQTdkVUxPTSttQnAxUjFqcVZzRXNXQ2srWlUv?=
 =?utf-8?B?SjFJWWpCQy9FU3NtL2J6WTdiR1AwU3MrUjNoMit0OXp5QktIS1Y3RCtqTVBt?=
 =?utf-8?B?RWk2UnBVQnMyUGJJTkVuTytTYy80TFVlMmkxQllwazc3aFkwd3JOT204Mk4y?=
 =?utf-8?B?Ri9leUxjcFlLMjZLK3lyc0JCMUpUR2NEcDlFNzlxaStaRHdZdTIxd1ZadG5X?=
 =?utf-8?B?bXYrd1l2NGNtZGd2YjBuMkNDdmtvd2JhL1pWRHdDL0ZMNm9tUVVuUG50MC84?=
 =?utf-8?B?cDhxZU1TSnpVQ0VzWlBnRXg1TVZnWkdFeVVKTnRYekFzVHlmMnZxOWlCeWxk?=
 =?utf-8?B?bExFSU11UUZnUFNiK1FmemZ0QzY3NEd5ekc4SUxPemJiSkgyeVRHYmc5OXFO?=
 =?utf-8?B?SkEvdzcwQU9LSm45OERKblBiOE9paWtFdGxDYzlpRkJxZ1A0ekpXUVZmamMz?=
 =?utf-8?B?SThsVGdETU15eDJzZkdEdjgyUUFtRi9Vemh3SG90RExPR0tBRWREbjY2dC9R?=
 =?utf-8?B?aFFUQUFsZGV6bTlCbWZKZFI4cDVUQzVGODc4U0lqZFRNbkRORS9CZDdWcEww?=
 =?utf-8?B?Y01PbWlyR1k4NlZUMzJMZzI5YVJkcHpWdmxycy9pN1ptbWoxcDE1djdudFhS?=
 =?utf-8?B?RGNxTkhCaEw1SityN2wvZWlKN1RENzFDMHVadDJ3L2ROVHhsb3BjVzJ6QWhG?=
 =?utf-8?B?NlI4My9qdUVncS83eWhkVXUwNkdCdEFyQ0ZrR2s4NGUrOStac0VmODl3YmNM?=
 =?utf-8?B?ZkdWYnhILzEyb2pkZVhrbFZxeEl5SjlUYWl6bG1BTE1DQ09LQUpZVkRzTHZk?=
 =?utf-8?B?aFdxamtGRUkxWjhpbkZmODVWS25iVll5WVFET1RwV2dPMEF4WkZ5OVNVRzly?=
 =?utf-8?B?SmZFdjgzQmN6MDFUcHJ6N0hXaFBtYm9NVHdkbWVYaExYZmRCUVg2cFM4bUI0?=
 =?utf-8?B?N29UNlhxMjdMcVcvZ0U4MXJWWlpvSno4b0pZUlU1M0wvS1Y1Q1N5WHdobkc1?=
 =?utf-8?B?NnF1ZFVqRzA4akNzUmVBYkplUERVN0N3V0pzbzhwM1IrcTJKa1U3N2U1QUlh?=
 =?utf-8?Q?O7o5Iub1Dpg4z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVgvSUpGK3hKaG9lRkNwUHVINEZwWjJQNG1DRzI1bUN6SG1mTlpiZ0VKK2g4?=
 =?utf-8?B?SnNtcWYxU1NwbGdLYWhXZ2w3bkh2OEpOakxmUTYwVFI1Zjl1MHNPckpveWlS?=
 =?utf-8?B?Zi9YT2NCMnVyRktPUS8wRmIwY0VhRldoT1phbkt0aDY5NFhDd0xMV2czWjB3?=
 =?utf-8?B?Q05aVjlzbkt3T0s0ckFYRDl2b0pqYjJ3TWE3a0x2MWxTY3VadnN5SWt5VTlL?=
 =?utf-8?B?ZjJaaHk2NlYremRHM2plZm9URTlXMzZJK0ZiTHVjRURjRDdXVUxJNmNiTmJt?=
 =?utf-8?B?OWNhMVp2MXA1b0pRa0xBQ2pEczFrZHZpYVJGRUJtVFRvNSthbDdyQlZxQTJN?=
 =?utf-8?B?NEFoTnBaZ0xPQ3hzRzEzQzM4QUJISEhHUFZ5cCtnN3hPazlhcjl6S01ObEpv?=
 =?utf-8?B?aHJjWFAveGRFZFV2YXBmSlZ2ZGVnUy9QbUx3UmsrUlJrendmRjhIakdWaWN6?=
 =?utf-8?B?T1B6SDZHSkV6ZkdUbnJQUzcrQSs4WVlpVUU4US85N01Rb2hubXJKdFdJZ3My?=
 =?utf-8?B?VXVnSGZaNzVNUFNVREVWYmtBZ3liTU9ZbER1cUVHVC8rWDdHM21qeVBPRE1C?=
 =?utf-8?B?VFFTNTRtREVBZENidUJCOTlPQmVvZWZ5THg2Y043Vkw3WXNSWUdPL1ZlRTZt?=
 =?utf-8?B?VWRzSGltRlJERDh5V0ducmZaUVJsMFluRGlmMXU0aDlUVThWZjJhUEpnc0ZM?=
 =?utf-8?B?NGJqNmFBNHovanViMU5PVjhzcDlDZWtoc1JraXpEK3RzOG9nYnFSbGZ0Vk5j?=
 =?utf-8?B?TGFIWDdFMVQ5RWdoNHZZby9LN1ZML1c0Y0phTjZ0OGRuOEJnaSszbTQ2U0tO?=
 =?utf-8?B?SzRlOFNrUVN1R1lPTjBDRDJiUGdEY1NIcnJTVGlOaXRvWUo0dnIxNnlKQkxX?=
 =?utf-8?B?TjNEbTNKbTBnU3locWJYK2o0UWxONlFmcDd2aW1jdkNzaXJpWTZjMmVYYmI0?=
 =?utf-8?B?ZEk3OVlhdkhDWGE3ZVNiNkVTZGd2RFQxVStQN3BRbjUrMDhSbDdYNFVTWlpO?=
 =?utf-8?B?Q3l2eHpobDFpRnlRN3dFcXlPb0VqMGJxOStFZFVDNDZETlF3L3FkV1hzSm9u?=
 =?utf-8?B?b3lpU3FZcVlJS0RWU01PNHl6bkdjRVpud1NjRFhhM05qZWVhbTl6T3pWeW1J?=
 =?utf-8?B?d2xLWThUMjNRMWtCSEphMEY3K0RqdmpSZFpiUmVSQlRXVUZsSUdLOGw2ZWxj?=
 =?utf-8?B?Q3U0TEVXR2Rla2J2NE5PbEF3Rkc5WXJmZW5hQnBpVG5QMjNpaWk1V3U2OU9R?=
 =?utf-8?B?YXYxSEZUdUZYb1lMWUxmRTVDTFRtWm9XNlpmMERPK0lVMDJMTVZjd0svMTFX?=
 =?utf-8?B?b2cwZFFTODVZYnBIOE1QbTNFY3BCcWxUVVFIVEJSNm81Y3ZpS0p5YWR0cE0v?=
 =?utf-8?B?UTlVSnR5dk5tVllQejM5Z2lVMitGTlhaSXhtK2hwU05XL2kvTXlGckYvUDJZ?=
 =?utf-8?B?TlNYUHdjbGhMMVNDci9TRjJtSWtqUDdFUWQyU2xLYWNsT05xYXFOWDVsYjM1?=
 =?utf-8?B?YjRsK25rQkpadVoyME1weFpiTUtXRHBSK2t1WC9kMHBCL1psSW5zTlpxeU9D?=
 =?utf-8?B?K2RTQUhnNGVXL25XanQwa3YxNHBJMGRRK0g0eEthV0lzMENkUnpMaWNpdGlE?=
 =?utf-8?B?ZXN6T2RPRS9vdTlyN2JzL1FsMVhhSGtTeUNUblJvZUlXc1NCQXVsNDFrTlIz?=
 =?utf-8?B?ZE4yUEROalY3OVZmNEpHZmd6OGdJUDlCdG5ySHA5QUE2S1dBWmdGL1ZySExp?=
 =?utf-8?B?aWJjVDhuYUNpR2RKTEZQOXFuZUhWMEdPbG13TlpPZkcrY1E4R0x6SEY1WDBt?=
 =?utf-8?B?UHowU3RzVkp2VmwxTThOcWRQZWNCTFhOcmdheFR5U2xUZXlxdFVuQ0RxVkFj?=
 =?utf-8?B?amhLVFpLSFpnTldGWHNsWjBtK04zaitiT0FOemRUUWk5WTQvMEhnSlcvL1F4?=
 =?utf-8?B?bzF2c3ZKUjRyUFRJRUVzcGpmR0dRMURnczNzNjJwYmo2MXhRdjVpVVJPSjJx?=
 =?utf-8?B?RUtmQ205ak9Wemk1ejBySTNnZWtYWm9tQU9zOU9OMU51U0ZKK2dHZTB6azMw?=
 =?utf-8?B?L1hpS0FyeFFER3pKNzhhaVJBcGNtd2E3Vkh1NTdLNVF3V2FRUUtzS0x1N3Nk?=
 =?utf-8?B?Q0RXNWFCUGQ5OU03M1NzbGNSd1JLYzEyL09ISmlKQktJUmx5aDdhWEMwMnhl?=
 =?utf-8?Q?vaX4r3c12J/gwJbSn1XRVBs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08546382-e710-43e9-1ecf-08dd50596af7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 20:18:33.4938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jz1yvGflx2wub6tM9HK7dh6cRJMMtMAOBM3CGgMC+4LGwEun5721aDrr+BcO4Fu6tTlITJ0L3mELS1GPdfvyxFHQ31wu+sVzfL10jT7TEe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7540
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

On Mon, Feb 17, 2025 at 07:50:18PM +0530, Riana Tauro wrote:
>Add two tests to validate engine activity counters
>(engine-active-ticks, engine-total-ticks) when idle and
>trailing idle (workload is ended before reading counters)
>
>v2: add trailing idle test
>    rename busy to load (Umesh)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> tests/intel/xe_pmu.c | 40 ++++++++++++++++++++++++++++++++++------
> 1 file changed, 34 insertions(+), 6 deletions(-)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index aa7d53523..5d2178b62 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -11,6 +11,12 @@
>  * Sub-category: Telemetry
>  * Test category: Functional tests
>  *
>+ * SUBTEST: engine-activity-idle
>+ * Description: Test to validate engine activity shows no load when idle
>+ *
>+ * SUBTEST: engine-activity-load-idle
>+ * Description: Test to validate engine activity with full load followed by trailing idle
>+ *
>  * SUBTEST: engine-activity-load
>  * Description: Test to validate engine activity stats by running a workload and
>  *              reading engine active ticks and engine total ticks PMU counters
>@@ -24,6 +30,10 @@
> #define SLEEP_DURATION 2 /* in seconds */
> const double tolerance = 0.1;
>
>+/* flag masks */
>+#define TEST_LOAD		BIT(0)
>+#define TEST_TRAILING_IDLE	BIT(1)
>+
> #define assert_within_epsilon(x, ref, tolerance) \
> 	igt_assert_f((double)(x) <= (1.0 + (tolerance)) * (double)(ref) && \
> 		     (double)(x) >= (1.0 - (tolerance)) * (double)(ref), \
>@@ -95,7 +105,7 @@ static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_c
> 	return pmu_config;
> }
>
>-static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
>+static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
> {
> 	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
> 	struct xe_cork *cork = NULL;
>@@ -109,14 +119,20 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
> 	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
>
> 	vm = xe_vm_create(fd, 0, 0);
>-	cork = xe_cork_create_opts(fd, eci, vm, 1, 1);
>-	xe_cork_sync_start(fd, cork);
>+
>+	if (flags & TEST_LOAD) {
>+		cork = xe_cork_create_opts(fd, eci, vm, 1, 1);
>+		xe_cork_sync_start(fd, cork);
>+	}
>
> 	pmu_read_multi(pmu_fd[0], 2, before);
> 	usleep(SLEEP_DURATION * USEC_PER_SEC);
>+	if (flags & TEST_TRAILING_IDLE)
>+		xe_cork_sync_end(fd, cork);
> 	pmu_read_multi(pmu_fd[0], 2, after);
>
>-	xe_cork_sync_end(fd, cork);
>+	if ((flags & TEST_LOAD) && !cork->ended)

Looks like !cork->ended is already inside xe_cork_sync_end(), but comes 
with a Warning!!. I would move xe_cork_sync_end() into a helper within 
this file and check for that. That way we can continue using the helper 
in future tests rather that adding !cork->ended in checks similar to 
above. But, this is is fine for now and we can look at it when more 
tests come in.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh


>+		xe_cork_sync_end(fd, cork);
>
> 	engine_active_ticks = after[0] - before[0];
> 	engine_total_ticks = after[1] - before[1];
>@@ -134,7 +150,10 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
> 	close(pmu_fd[0]);
> 	close(pmu_fd[1]);
>
>-	assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
>+	if (flags & TEST_LOAD)
>+		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
>+	else
>+		igt_assert(!engine_active_ticks);
> }
>
> igt_main
>@@ -146,9 +165,18 @@ igt_main
> 		fd = drm_open_driver(DRIVER_XE);
> 	}
>
>+	igt_describe("Validate there is no engine activity when idle");
>+	test_each_engine("engine-activity-idle", fd, eci)
>+		engine_activity(fd, eci, 0);
>+
>+	igt_describe("Validate engine activity with load and trailing idle");
>+	test_each_engine("engine-activity-load-idle", fd, eci)
>+		engine_activity(fd, eci, TEST_LOAD | TEST_TRAILING_IDLE);
>+
> 	igt_describe("Validate engine activity with workload");
> 	test_each_engine("engine-activity-load", fd, eci)
>-		engine_activity(fd, eci);
>+		engine_activity(fd, eci, TEST_LOAD);
>+
>
> 	igt_fixture {
> 		close(fd);
>-- 
>2.47.1
>
