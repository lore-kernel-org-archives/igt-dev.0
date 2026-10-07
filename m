Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67AACA5FF1
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 12:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D2D810E475;
	Wed,  7 Oct 2026 12:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kCMFhY/D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E32A10F592
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 12:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791377174; x=1822913174;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=MR3yiioRrjVDx7u4HM8cZUiDOdAUAv+9iSpQat/jmEg=;
 b=kCMFhY/DcdGEC3cCwxYtwiXXIRVt8ZG4yE13cUPNMJxYcLQ6SZvlbO//
 0yNAPDGcsytJOzcCLLUrpMBhOVRFEumiA6VxBNQ6YL33BfmR7bIbXu/1K
 rWJ4QCsvZs7paFry0k03y6eK1b9UryTdw+6JC8tbHg5XhVOnpCVmYKDea
 P+A3AbPu9h5VEGLzBoMGuSxB3WsKbaLuopW9RdMBLLfPSY8ARqm+vB2uk
 PZ6QMvx3lhPZ8uYzeqCG637CCFXg4KT9WpnQKo+lAnNpLIaE4rmApwoQo
 xYoq9/fFOlSowz9QscGNNFtCYeg1LevpR0Hfsk3LjfalP1LbW0HSAM02b Q==;
X-CSE-ConnectionGUID: mZ+y6l6fQZCb28m+60MH1g==
X-CSE-MsgGUID: q8MSg2QLTIC3SO+6DCTkWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="131473"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="131473"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 05:46:13 -0700
X-CSE-ConnectionGUID: /PpsGkiPSr204hlSezzhPg==
X-CSE-MsgGUID: kox8rJt+RyCriIbSqGN+sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="46654"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 05:46:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 05:46:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 05:46:12 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.10)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 05:46:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chbAMDrLVI+EU9Bdk/a/EBKSREtEHMxHhq1nPt8JIt6x3m3j74HbzbdHpZUZ8EjFyQN1ptLRRy0MRRcNdy6XK/3GHHwO/o2moZnbL3vrh/MQ+Nm/m5mUAPkZxdWo1ByvcCdrv7VFGx27c6XnU3Udim+OvPr3RIeL2BIP+cnglsXA+XugijoBa9KjrW7nlW7r5lAgi7Uakx2xUXCWGU7uLN37ehe/BP8+f6MvD6ajgIHqSbTOVplqD90fXJGR5sd+mS5dOX3pnX62+JuCm4L7Npe4dG/IWtg6qfTxddV24GMwwZ2iP1Oj2Od995oTr3YzOslpa85FR48KAzx3UJ2Hiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtTRzj6vzji4Nb315zhF0enrWnhlq6gx9Vod9XsxbUU=;
 b=Mh/776xH89FSuLhw5oQm8H+D3OUmoy1BBMbkyxwnZ4b3GffN5YosPU/tfKGKLlvPrxMbgiRTjT87YZnzLINVyKia6hcMWOcdJYXxgA1H1fAaYaaWCi0glSxwI+7F/KjqwN1LY4u1KwKXRATyF7iGW2n3pn3kzqJpboQM65YTYOfVLruBePoGVI6Q0qAN1Bdbh5U3NguVGuGmeCnstatVpXp4CESXQO82hIYloJwUnNSnh2P3OMlsUPSgU1jMDQJkejJUdRylcVZp72Q31m0CZcwnMc+IlFMYaQJ1vNlRKD25lu1E7C/xBD6NF/jgj3yrgurqnUqqVYXDgIhquQhEGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS8SPR01MB75130.namprd11.prod.outlook.com (2603:10b6:8:447::6)
 by SA1PR11MB6783.namprd11.prod.outlook.com (2603:10b6:806:25f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Wed, 7 Oct
 2026 12:46:09 +0000
Received: from DS8SPR01MB75130.namprd11.prod.outlook.com
 ([fe80::20cf:2704:5868:5a54]) by DS8SPR01MB75130.namprd11.prod.outlook.com
 ([fe80::20cf:2704:5868:5a54%4]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 12:46:09 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_pmu: Do not enable VFs in
 unrelated subtests
In-Reply-To: <4d92c8d8-2ae9-48a2-94f3-41a9a5636547@linux.intel.com>
References: <20261006-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v2-1-38f204d54553@intel.com>
 <4d92c8d8-2ae9-48a2-94f3-41a9a5636547@linux.intel.com>
Date: Wed, 7 Oct 2026 09:46:05 -0300
Message-ID: <87jyntadbm.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY3PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::26) To DS8SPR01MB75130.namprd11.prod.outlook.com
 (2603:10b6:8:447::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS8SPR01MB75130:EE_|SA1PR11MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fcdf755-37e1-4712-772e-08df2470f636
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|6133799003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: 4zadD0GcuM4VQntJR/dramHHqwZWiIbhhqzGHIA0VjBV0x8+WxbI+YqW4MDck4sq2s2j2bq2IiZsHb3ArvR8eMjbghvNke9u+Fz29iAVApFspL+erqYfNTbchrzFCFPN4DFUmv8L2vSw75NS17CsUIwHb4eeJboTVTjo06QpT3CVIUm33qNG5/we5/+tb+upntpir9vsA37Q+0pswYPJmUJI5vsGqDCe1m7zGTmBWGuK+dRQpp+wlJs8mY9ALBqjoNgOF7NSal5zgY8oNwGgzB0Yy9g0UkCSQFqFBSSA4rsaq7PBM31iiYlXI4Y4kY0Rt1Y9rdh6a9aFsxVVVC5GWuM54MVLWMpOYefckPtDnSs597MqgrMLiE6lLNGdzzKVernJhSnbH+cDdsjtDILR66pE9vx140o8cEI7P8TVlxmGfqu9nqeLYMNTgrm2ZksFhnidUongj5wvkgZx8tqUi1EsQajkylILyS9VDPsqKR/yDuE92rahJw6GhZcmKAaS0l2vMDV41E8tG4Y4BeZog/cucc/DB1IulTSdgSQJ5kNA/CFOeHsQM2nxOeu6NAcO4otGanufeDb2ZG2648461lxKVI5upvtJ+w+dR4yJlz1sAuyysWBq0qQC2BMV1WtlrdR3DBH0RKqIVg/GrUbJj/3Ebz6XDK5qrH85frk77zA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS8SPR01MB75130.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGVuaXpTUWhQeFlvbVhlZmMzQytZZDhhODJROFB6MDk3bTQ4V3MxZS9ET0dx?=
 =?utf-8?B?ZTBtWFJMTU95Mi9pT0xWaW9YeWFsN0QvRjZuZGVCSXpCZWJDbmIwY3RTQ3E3?=
 =?utf-8?B?WUd3dVBKNGo5by9jalZ1ZHVldjFKN1VDdVpOU3pvcStHWW1zSDZFaHlUZEI4?=
 =?utf-8?B?c0ljODJsakxwbnhVT3JxS1VZeGhVdVAxMnlWbEU3TjhkSndvUE5WNmh6Mi9Z?=
 =?utf-8?B?eGlEekFReXduU3ljaWpCU2dHYXR3V0RwSGxPVFJKZjFhcklZcEtMZDE3cUlh?=
 =?utf-8?B?NEx6WWhFMnVhbndieGVJZnlTMGk4L1Z0MVc3akR4by9IMTA1MS9TeWhCUkVs?=
 =?utf-8?B?N3BLRHYxQlQ1QzVvcHZOd0NpR2tiWkNCUTZpZFVRaWRlMWI3OS9sZENSdi9C?=
 =?utf-8?B?U1R2WmRISC9Xb0JzMkJZUVpWaUZlSzQxdXpmbS9DcHpZL1hUNW8yYlBxY2Yw?=
 =?utf-8?B?WXl3N2ZFczZZcUI5WmVWdGNoL1hkd0xwTDMzdmg4dmJ4Z1hVd0V2eDNZZ3ZZ?=
 =?utf-8?B?TWluZXVPS1QvWW5oaFJkS0VNbnpsbk9RWFZOUXhzclRQeUhjeWdJOFFpWUgx?=
 =?utf-8?B?dzFZektkb0dyc3BndFVNOWVockVBZ2VRdndmTWZYSG5UM0NEaVYvdG1PTzdt?=
 =?utf-8?B?eXlOMTQwSlBFN1Fid2tvdDNSbTdKY05HVlFza3ZvSGgzUzRRajlTVEpXaUFV?=
 =?utf-8?B?cWFQYXd2a1hGS2hmbHo0Y2FhTW56dlJDV3BhUlc1bS9jZDVuU0hQMDJsN3ZH?=
 =?utf-8?B?eTRKZHZ3Z3dQR0xsMGRsZXBvNG01MjhmUEY2b3p5MlFwVGVaNUFMbGtGVHR1?=
 =?utf-8?B?N1VJWWpNdjFDL1JEWUFvTWVFRXlDaEVDcG90VzRBYW1BK0ZJUlI0QWdwUHlG?=
 =?utf-8?B?eStkeHRoVzhrbDRkNldkQW5EeFFvTzd3Q2N5MW90ZEZ5NHZKdEJoekp3M2Nj?=
 =?utf-8?B?MEJJNTJRd201OTJUWndUdzhoUHA0ZUlUbEtkS0QrNkZZQm52cHM5VGJpUTBi?=
 =?utf-8?B?ZnE3Wm52VTNYM3AyWEU2RHorVkhIOFlhY2s0aTJBa29uQW1uYTFCNXFiZTRr?=
 =?utf-8?B?VmFSN1RxNWNQSitLa0ovYjBnUUdFT0swb0RQeEI5bEZVSFhCbEV5RU9SdytH?=
 =?utf-8?B?V1A5bE1WWUZoaDUwcU82S1JxS0dyVUN4MjlHYWJ6dTRmdVM1ajlEd0JOTU5G?=
 =?utf-8?B?RjV6R1NERWltSUdLcGhIRFpoakt1NWxoL3lJN0xOWW1UcFZHdDUvREl0L0Za?=
 =?utf-8?B?Qi9tNHZ6cEpVTUdZTHRCdlU3TXZWc1grZmd4UkZMWlZGZGtuZFY1RVp2bURW?=
 =?utf-8?B?YmNqY05DczVIazZSNWNZRUtjNzNpUXE4TEcrK2RXWFhVYVFYZ3ltS2IrWXU2?=
 =?utf-8?B?Z09ic2lYdElKNUdLdmMxWnZOYnVVWldPdFB5VHVVVER3OVAzclVRM3JiQkxx?=
 =?utf-8?B?UGlGV2hIK2FaVEp0c2F5SHVWZUs0Zlk3MUVnL0VRZ25jMGx2aUhlQm41VHp4?=
 =?utf-8?B?Rm10YzdQWGFrZzkxUzdDclNjVGhxMGJhNmhqUS9OUzI0ZU45ZnZpNk4vS1po?=
 =?utf-8?B?WklGalVkNjlhTWRiWC9KLzI3c05IMkFISjJJSGNBOERqbk4wZVRDVy9EdnNu?=
 =?utf-8?B?bkRxWEVVOU43Q1NuWWxCeGtBRGl2UG42RVNrWnc1MmhnaWY4aEpqRERGc3JW?=
 =?utf-8?B?RGhWcmdrVFRld25ZL2FLMm1pOCtReHo5cTlhYnB5TUVXZDNzKzMzTG1VV1dU?=
 =?utf-8?B?cTRKbGIyNis4NGRqQUdWejB4VVlVaFRvd0tncU94WEpUb1RuUmRsRkt1M2JM?=
 =?utf-8?B?TUNwZ2ErcS92dlRPRExaS0lnOW0zL3JwSnJ6Z3AvZ3crUzBCMkJMNW9SMFdw?=
 =?utf-8?B?ME5GV1UyVUlZWTZxR1JaSUVBVWVHeEFOd29HdTREcjA1MzEwSkFKbC9rZUxG?=
 =?utf-8?B?R2lDOGhZUWFlWEh5KzRmUFA3QXJPR2NqU09LQWJCY25SMmJJck5nMlllZWI4?=
 =?utf-8?B?SzU2YmtmTllVUzE1aExhUlFqbVNPWWdrVldweVdIUTdFTTJUb3BDdmJDb3Ra?=
 =?utf-8?B?aXg1Wi9GZ0U5Wk9qWmE3cXg0ZHJEdnB2d0dMM2FsWXgwZTNBVnRBdm80Q3lT?=
 =?utf-8?B?RUhueFMrVmNyNW1DaWhaczNOMlBBSU8zM0JPVjlZUkVUOXhTckwzS2RPTjBG?=
 =?utf-8?B?SXZDU2lVUlZUVkFrUURna3VXNlBCekVRZTFQaHh4dkg5bHp5SUZheTRMVk9W?=
 =?utf-8?B?c2ZFci92dDFQZzZKZHQ3bmRMOVI5OVM1TmUvUFpqZFBKN2VGYWZFT0dZSEk3?=
 =?utf-8?B?Vk5HWHIvdzZTbkRuZG5WcHpmd0swbVBxeUtzdTBDYU5GYm00eGFmdz09?=
X-Exchange-RoutingPolicyChecked: aGk+oLnt45nJmIKvJvhSEbN/sxtmyKF43bKPOYECJ9S2KdZvDOcw3K390lVqSgdFmDrz0Skz4vuTLRX88qaEv3DFe21YJpCOcwr31CN/WWj1kbbwZajFJ10EbWzxZW1f6LsaGSoXvnd59D1EzbWaSkdheiAJ0UzBJ7kHcatn+k9a5QA4qpBzRUFWE0oRv3LaclIzBKq18ISHIXbIjTzXZKIDIIr5vVUdHz/ai+8MY0QZxi8oWkeMeskvdEX9GFR8v+zmVEnzlLBnPhPvZ9Aj8hOblvMzNXgbCro/uTAp2oh0eH9ZI9D93aYAOCWGJz2MvV0FbYymwH4Hy/jgxrDz8Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fcdf755-37e1-4712-772e-08df2470f636
X-MS-Exchange-CrossTenant-AuthSource: DS8SPR01MB75130.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 12:46:09.6222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5kn2X26PdwRGql1trKY7qIRHZkDOYiZuje5YVO1urginz2mmDqLSLOS1olE60PSSi3fBSG8k5tyQSYyJ29+ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6783
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

"Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com> writes:

> On 10/6/2026 4:11 PM, Gustavo Sousa wrote:
>> The test xe_pmu has a subtest group that enables SRIOV VFs as part of
>> its fixture.  Even though the fixture is part of a subtest group, the
>> enabling/disabling will happen regardless of whether those subests are
>> selected or not (via --run-subtest).
>>
>> As most subtests in xe_pmu don't need that, avoid doing that as a
>> fixture and rather incorporate the enabling/disabling as part of a new
>> macro called test_each_engine_with_vfs().
>>
>> v2:
>>    - Add "intel" to commit subject prefix. (Kamil)
>>    - Fix argument name of test_each_engine_with_vfs():
>>      s/num_vfs/num_fns/. (Kamil)
>>    - Enable/disable VFs only once per macro call by moving the call to
>>      xe_for_each_engine() inside the for-loop. (Marcin)
>>
>> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>   tests/intel/xe_pmu.c | 21 ++++++++++++---------
>>   1 file changed, 12 insertions(+), 9 deletions(-)
>>
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index d41ebba1faef..eda56c078653 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -124,6 +124,15 @@ static bool has_engine_active_ticks;
>>   			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_cla=
ss), \
>>   				      hwe->engine_instance)
>>  =20
>> +#define test_each_engine_with_vfs(test, fd, hwe, num_fns) \
>> +	igt_subtest_with_dynamic(test) \
>> +		for (num_fns =3D enable_and_provision_vfs(fd) + 1; \
>> +		     num_fns; \
>> +		     unprovision_and_disable_vfs(fd), num_fns =3D 0) \
>> +			xe_for_each_engine(fd, hwe) \
>> +				igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_cla=
ss), \
>> +					      hwe->engine_instance)
>> +
>
> igt_assert (from enable_and_provision_vfs) before entering igt_dynamic=20
> can hit an internal assertion and abort.

Oh... Right. I haven't considered the setup of VFs itself asserting.

>
> Could we move VF setup into the dynamic case and reuse the enabled VFs=20
> across engines, like xe_sriov_scheduling does?

Well, this sounds like a good suggestion, but I'd argue that it is a bit
outside of the scope of this patch. It could be done as a follow-up at
some point though.

As a short-term solution, I think we could follow Kamil's suggestion of
adding a fixture to disable VFs if they were enabled.  We could do that
after each call to test_each_engine_with_vfs(). Not a big fan of this
(ideally that macro should be self-contained), but it should resolve the
problem?

Furthermore, for that to work properly, I believe we would need to also
update enable_and_provision_vfs() to either receive num_fns by reference
or make it a global variable.  The reason for that is that
enable_and_provision_vfs() will not return and, consequently, num_fns
will not get set if a long jump happens.

>
> Unfortunately it complicates the code, adds state and cleanup logic, but=
=20
> I don=E2=80=99t see a simpler way to keep setup assertions safe.

One thing that comes to mind is to provide some infrastructure for
setting up cleanup functions that are called at the end of a
test/subtest/dyn-subtest.  We could create a macro igt_add_cleanup()
that would receive the function responsible for the cleanup and the
arguments.

For example, inside enable_and_provision_vfs(), we could have something
like:

    (...)
    igt_sriov_enable_vfs(fd, num_vfs);
    igt_add_cleanup(unprovision_and_disable_vfs, fd);
    (...)

We would still need to figure out how to allow passing the "fd" argument
to the macro like above.  This would likely require some preparatory macro =
like
igt_define_cleanup().

--
Gustavo Sousa

>
>>   static bool has_event(const char *device, const char *event)
>>   {
>>   	char buf[512];
>> @@ -1192,26 +1201,20 @@ int igt_main()
>>   	igt_subtest_group() {
>>   		unsigned int num_fns;
>>  =20
>> -		igt_fixture()
>> -			num_fns =3D enable_and_provision_vfs(fd) + 1;
>> -
>>   		igt_describe("Validate engine activity on all functions");
>> -		test_each_engine("all-fn-engine-activity-load", fd, eci)
>> +		test_each_engine_with_vfs("all-fn-engine-activity-load", fd, eci, num=
_fns)
>>   			engine_activity_all_fn(fd, eci, num_fns);
>>  =20
>>   		igt_describe("Validate per-function engine activity");
>> -		test_each_engine("fn-engine-activity-load", fd, eci)
>> +		test_each_engine_with_vfs("fn-engine-activity-load", fd, eci, num_fns=
)
>>   			for (int fn =3D 0; fn < num_fns; fn++)
>>   				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_LOW);
>>  =20
>>   		igt_describe("Validate per-function engine activity when sched-if-id=
le is set");
>> -		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
>> +		test_each_engine_with_vfs("fn-engine-activity-sched-if-idle", fd, eci=
, num_fns) {
>>   			for (int fn =3D 0; fn < num_fns; fn++)
>>   				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_NORMAL);
>>   		}
>> -
>> -		igt_fixture()
>> -			unprovision_and_disable_vfs(fd);
>>   	}
>>  =20
>>   	igt_subtest_group() {
>>
>> ---
>> base-commit: faad2cd0e3e8eb2e18111c2358823a7bdfb56d94
>> change-id: 20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-e24c1=
cd95d71
>>
>> Best regards,
>> --
>> Gustavo Sousa <gustavo.sousa@intel.com>
