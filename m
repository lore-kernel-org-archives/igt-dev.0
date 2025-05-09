Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1EEC3ABBC
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 14:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4EF10E0CB;
	Fri,  9 May 2025 14:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PEealSDg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE75110E0CB
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 14:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746799937; x=1778335937;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BBDTux0HOG/J2OP+AKH8hsx4CnfNK5fRlRTKPZupL3E=;
 b=PEealSDgqZZ2eE8XosfM2pOpye7ehWVHNxS/QNmIHRtw/mVXc7m7niPm
 gvUVIk3lvZzb0dE7LKGWC92uYH3FPACnDZX7RimCEsAmgfYFd8bTJ1/HX
 uivXd89MvpW+P4z11fe0DnD60RwxL+lIZKBaadteyGv23CMy4iZVFydbE
 TDzOckVvUUktxTqJOb1uR1Km4UvorEP+U2HH8V6Yo8bwltrw21460OOeO
 4UTiK3n4GgHduF2h4ykIHHN4yjawv6KUCjcStdbtFXeioQsJNPDgp1EUo
 c5ecHIu8dYc+3K9yeGU1yPb0zn7prBvlhsOm5HsR0r35u/Dxfz15WetQr g==;
X-CSE-ConnectionGUID: QEfFQjtfSR2ejDOmir/hww==
X-CSE-MsgGUID: nQ2rK138QemSssO+ASW/CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48748136"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="48748136"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 07:12:16 -0700
X-CSE-ConnectionGUID: +oQPSL/rRuK5sb0lpin6zQ==
X-CSE-MsgGUID: uvobG/FfSMOugHijg+AorA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="136650711"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 07:12:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 9 May 2025 07:12:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 9 May 2025 07:12:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 9 May 2025 07:12:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRHvbowjQgjy2a5wOu6cnYBSqppg5Vl+0zPRUBetxVonvo+l8ow8lIhqWbrog1O6Emg72MlffUMCQvQxReR8dV2o25ErEmXekt1njcT2OmyaSyaf36h5wZcEqV6PpH3V4zBa51LyMIcgrC6Qy2el7/NhsKjG9uZ57xLzSHzcRdaDTuU0IwmeJyB2Ybt2Tsbcj3pUZyl8eJitLbzarznxlSXl4al16AoMJpJCQGhGoevNwTuQIUQomFS8QIYn6aLBaMFGEx/VgM4Q38Ho1lPIPyImoe7UXKppjTbtxE4m+Vmt2FDAhj4zwEZUfdWrMEFsrPknylNkacqGERSmfEmISw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0e8m7GIWRj6KPSi7EN6o0se0m6Y+AVE8mqBUx9BQOXw=;
 b=tFAFPzAXCzyoZ+lhbHrbm4WQJ99aX494DCGyViTZZC8seUIHy+sEJjSnBM1NdCUrxhl85mWf2wGBPluGMPiAteGoKxF0y6YuibtejtPP+iCba4du3d7qj5iE3hGrIqEFxi7Xqf1a4qtE8F1kyAgmJCa/gTuivZHcr+XalzJTCgW1/MLYoL/nvOvygT/Pfl5xR6FjUbL3UBmx8TOaIO0WFlQ9VmglzZ92c5j3F4SnHiCD6u3I+ThqaqfeIjZaYbkNxzbuFB3Pv/ztm9it8xYyMw1shquNF8m5ESOoThzqE7SXq6cl4uZF7tc797BOBGBJWAZ0Z19ZxidwxVhNEfHF+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB7156.namprd11.prod.outlook.com (2603:10b6:a03:48d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.23; Fri, 9 May 2025 14:12:08 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8722.024; Fri, 9 May 2025
 14:12:08 +0000
Message-ID: <27850e26-7694-429d-b3b9-efd3b13e4b01@intel.com>
Date: Fri, 9 May 2025 19:42:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/5] tests/intel/xe_pmu: Add a helper function to
 check and end cork
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
References: <20250508055006.734259-1-riana.tauro@intel.com>
 <20250508055006.734259-2-riana.tauro@intel.com>
 <aB0y5KtmXKqRtptT@unerlige-desk.amr.corp.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aB0y5KtmXKqRtptT@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::21) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: bd7a7a3a-2a80-427b-e73e-08dd8f037ba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2NNZmxjZG1PT1lWSms1MTZ6cFhWUnQ4ZnJPK292emdhazlsdzlqVmx1YnpV?=
 =?utf-8?B?cCtsMXdKdm5KWUdXWXFBeXd6dE9JK1RzWVhNeGhLSXV0R2NRM05Va1VHS2tw?=
 =?utf-8?B?b00rT29tMW9DYm8wWVZXMkRaMXJkenNQOWJWRWJuaUlyM0xPOGNvUEpLdlU4?=
 =?utf-8?B?SWR5Y0tGNHNuV2Z5aEJlOUJ4V0xEcDNscXNraG1LbFNua2lnbHhBcHJ4VE85?=
 =?utf-8?B?K2dCbW9EZ0ZMZnV4RDNpTUcwV2psZjN6eVBoTk4vaUdLdTNQeGw4VnZFTEIw?=
 =?utf-8?B?eCtjSWFVS1Y2ZXZtUzZsMHprTU9TaGVDQmloWVRaMDUxWUJrblFCNnA1bHRY?=
 =?utf-8?B?MjRTT0o5VG9DWXgyekVXSndsTkZkTUxHdExHb3YzMllrMys0ZWtEdy9TQ3Vo?=
 =?utf-8?B?SnhtcmVHRFJDcGFLMVM1cXlYbW9yZzBGZ21EMkZWb3d4SGhFQ0FxV3U3eCto?=
 =?utf-8?B?Y0VRNVRIZ0ZobjVVNVBWMjZhaHgzMjMyTEpWQkY5QnRyVytWVlB3R1BjZ1lE?=
 =?utf-8?B?ZjJrdkk3Q3NFZHltcWQ5dUpVL2pFanI3VkZPVkNRc2g4Z1VGUWozQTFuRmZ5?=
 =?utf-8?B?VDhxUE8zL2NGNFlRdkdsNW9DYWhCeU1xWGtqbzcxbDJCUnY5OFRud2FHeEdQ?=
 =?utf-8?B?djdyWVZ4TkFpL2xac2VicUl6R1hsb0VSeHBuMFhzdTZpaFJVUmxuM0JEamcx?=
 =?utf-8?B?ZENWQWM4cHd1U0JKdUlkSmpKaVBjWHppT1gwNHN1OEI4TTBPSmpSN0RvWlFZ?=
 =?utf-8?B?TmxqNFZhMjR2QXk3eDJkRXI4TFhpZWtCZmFEZUlBaTcrSUlPSExzRGVpdThm?=
 =?utf-8?B?YWg4ZVlCdmM0ellnR1NkcDVKVW5aVlNzZkp5Yk9KMzdPa0VRV0kzbE5MU1JQ?=
 =?utf-8?B?ajN4NGpKQzBSNDJVWFBuZE1wRndHSmtFb2I3bUxpdi9jZEhQZ2pmRnV3dkg4?=
 =?utf-8?B?a1VoSWVDcXNaUlovRGpnUnhQQW5DZWZ6ZGZNV3ZZUktmMVhwV2xabk5pLzZI?=
 =?utf-8?B?SVNyRHd1eW43eHlHTlVoT0ZsN2VYRTFhTzhFN0cvNU9BSUMwVmJRRi9OOExW?=
 =?utf-8?B?ZDAvRUVHWFFxOE1pa3dLa1N5cWRqbjZTMmRpOXNUYmlIQnpQUkhaWC8zWTJB?=
 =?utf-8?B?NDd0cDlKTTczU0hwUjA4cTQyMm01UXZweTZpR0Q3dkhBM0c0ZkdhSnhPb3pl?=
 =?utf-8?B?cFZGUDZ2THE3VVFMMm1FZFVNNS9uVk1XUUdWREZ1V3pJYzE4ZlRGSzVqelUr?=
 =?utf-8?B?SlRpSkw1SUVMcmZBTm1NdWJXeE45YjVUSGdSbi80djl6bVlRakNqYUQvUUFL?=
 =?utf-8?B?SVFzWU5ESktpa0tqci91VHJDeGhUSmZ3SGo2cERTcDRGSWp3QkVoTzRjWVA5?=
 =?utf-8?B?NXFTTzUvTS9COGdNd3lYNGp4Y0FiMzdmbncreXBiNDVzUmhnU0M0TVBTSDJD?=
 =?utf-8?B?UEZURlN4WFFGZmwvNEZEMnlvblY4U0kzR3JLQWd4clJMNUlTUUIwbGowdytV?=
 =?utf-8?B?NmtqZHVMQStZSmhsazlLVGxoejI3RzA1U0ZmNG1KOGlLNUFNRlM1Z1JDcnp3?=
 =?utf-8?B?QjR2cTlTL2RpRWFDeS9NWmhwQ3djdGxDTjAwYzc2akRHWGtHZDZWQ2xiU1Rz?=
 =?utf-8?B?bGR2NlZvdUxKZTVyT0JIR0tSaFBEQ1pPeFp0UDVYcUhUWG1pQ3NNdnRHckF0?=
 =?utf-8?B?U2NQbkRFV005TlhMejhTZ0dxb0tRZlBIcVE1emlZUXVPTWNzcDF3cElRT3hh?=
 =?utf-8?B?dkQrTUsraTZZUGwxVUJ3L0FWSDVab1FSRXBkQWZVekZubGtpaUl0a0thcUUz?=
 =?utf-8?B?SlBRWmw2ZlBhVmcwdWRwUUpyWUwwb2poTXpyNnNvaG5ZSTdvQVJRQlRRRk5J?=
 =?utf-8?B?NURwRVl4UUFNR0JqMjh2K082eElDMm1tTjNNNzBvenF4S3NQSHU5Szl0Y0x6?=
 =?utf-8?Q?4awZq9Lf1ao=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THlYTUhxY2s1OVNScUlLR2RYakVqdlNQaGpGOG5hanZWVHFtVHJuWXJvcTBU?=
 =?utf-8?B?NWxnSXFlWXdkVXVnRi9XUU11ZDkra3htVWgyck9QaTI3M2xtc2FKbWkwSFcz?=
 =?utf-8?B?SWdmWE0vUVFRNFBYOEl6Zm1XLytRNUxWbG5DSkg5Qy8yRzRmQStZUDRNNWZS?=
 =?utf-8?B?VUl1OUR6T2hOZERlNEw5SWVNZGtQMVl2Uk1tSjJNVlRmMlV4OFRVYmFMbjVI?=
 =?utf-8?B?ZHd4ZW9hTTN5QU0rQWJCSXdIcFB4R3Fzc2tyTUkvakM4NjdaSTFrdTVtSGs3?=
 =?utf-8?B?OE5ZMGgxRndpR3hVVmlFVmF2V2d5WVBkaTlxeC9ycjBhMW5iUjhzQWUxaHRM?=
 =?utf-8?B?RVJWUHdrYUhLNXV1SllyMHZ2SWd4T3p6VjhlcVNSSXJnaVRrVFIvcllvS2lr?=
 =?utf-8?B?bWtBTm4rUUptNmxpaFB6TVduc3FVRTYxTmVXdTZLS3VETDdoSEFGaVZ0Y1Ba?=
 =?utf-8?B?UlF3VDhBaGpkSTFPTEVLTW4vOTNneHdVTnZpa1N3NDFiYWhEVWlRc2pvamlW?=
 =?utf-8?B?d3ZNYWpJL1pXVDEwaUhlbjkwMmI1cnBpeUhoSmlncU9WZ2xFZzRENmxNZzc1?=
 =?utf-8?B?bitYdlcrNkgyTDZrY25lSG9qSVYvQjk4OGpvR0FYYzB2SU00STNuSVBCYVhO?=
 =?utf-8?B?WThGMlRMVEtVdXU0UXorcTR5VDVvWDZsR0Z2WGc0bk1LblY3c2VCVjNJTnAz?=
 =?utf-8?B?N01xVHltb3JvSXF4Q0JDS005Q0hKWGkxMmJWZzdzYWFNNGNGWHpYbWc2ZVlR?=
 =?utf-8?B?YkR1RFZVK3VUR3N4S3I1TEYwNE5TY0RJR3ZrMnAySm1oNUZMZHJFTXJDK3d1?=
 =?utf-8?B?SHVIQVVxN0FFWTdVNUszTGt2OU10c3E3NTN5UlN4QXhRU0k3ODB0TUJlSkZC?=
 =?utf-8?B?N3dTTGlTYjEvSEJtdHZiOG5QNlNUUW5BWDV6emRIb0R6ZVp1RUNHbWx6Vmgw?=
 =?utf-8?B?enhUREtjQzErblErRmZMQ0dTMDF1RnFBS3RHdDdjUFhYUE85RDZpT0lvTDcy?=
 =?utf-8?B?ZUM2b0hFb2hVT254Y2hteXNzanlZbTVEL0lTQnBtZFNGK2ZjVTZ1ekwyM29R?=
 =?utf-8?B?d0M4TDVRa1g5U0JEcGdwTlBjU2drQW0xa2xEU3VFdXlPSVlGdURQUW1ZbW91?=
 =?utf-8?B?cFdrYzNoUHhHaW1WSlN5Slp2eFE4bzJxTUNheVZoUnBibmVuWDVPb1h0Z2Fo?=
 =?utf-8?B?akdHUVlmTEVrclB3L0FlQXRqaVVWejczNEJtVHcxd2FGOFM3WFZTSnVEYnlB?=
 =?utf-8?B?ek5uTVFIMEFMOXRLc3dsNmtNK1VNTjM0cS9JMTNzQ0VrWkFEQkdDYmppMXdC?=
 =?utf-8?B?K1lDY1RROG9KUUJWTUtMVTZoTjJPbUJTdndubHI0eGZ2TEpVRE12ZWhSWkNI?=
 =?utf-8?B?R24vZmt1akNOK044MitzVERRRGNTWkxqODhMTExqaEk4UzBJa0VaQTExem5G?=
 =?utf-8?B?WDVFSUxDakU1dG9iaW1QQnFYVTZCQlZnVEJkUHJsZC82VTY4L21tNC8zK2lO?=
 =?utf-8?B?WlRKWmdPLzlzMjZqR0lhZlB2b05QNjQ3a1hZN0dqUXMwUzNXeER2RHl1cjdk?=
 =?utf-8?B?Njd2amxNVlZVYThOdTU4ZUFwNFJZY2xjUW1XbG1ZM0dnQ1dQNWRHbWhjbk1K?=
 =?utf-8?B?MFN1STFmNFB1V0pKMGxhdGdLRGFyMnhZekdVQ2IzLzJQa2xMQjM2ajFSL2Vi?=
 =?utf-8?B?L1l4VVNWM2hmNUZFWXVlSThuSDNDNnlRZFV5bmhrZjUvWWtRbldxWE40VGxJ?=
 =?utf-8?B?Mlh5NjdQakJHSCs5MDBTMnNKdDNGWjJqYm95QzJxMzJsbG9IMGpiYkRHa2l5?=
 =?utf-8?B?OFEyOG1DTkluRWVEd1ZyNkp1MGNHZVM3cWpoanRERU9XM1BMaTEvOWJvU0w5?=
 =?utf-8?B?dVJkWUNFcGJ0RzVaQ1VPM2trK2s1cGpWb2tqK2hyT1FjYzdPRDA1TDlOMEY2?=
 =?utf-8?B?NHFzTDV6Tyt5bXJDWFIzR2d1eEk0eUpkYklLTS9WQVVpaXBkR0JoOEZFQ1Jt?=
 =?utf-8?B?MTRFb1NKcXZZa2M1VVVadk5RTmg2QkFZTnZTaGRFUDJTQng5RFQxUW9rVk1O?=
 =?utf-8?B?Y1ArZXVxRjV6Z0lMS2M5ZHN3dEFBNm5GS0lCbys1R3BLUnJXSitPZ1FWV0dr?=
 =?utf-8?Q?VWG8EY96tDx50vxDZHYMsF7m4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7a7a3a-2a80-427b-e73e-08dd8f037ba7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 14:12:08.3385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGfIyYykEPgEdoszhjdaBqZmQcd/AIwB5d+LDkyXBX3JVHi3fB5NJ8zB7+71bzd5WfOjor9AnIMldEhViBITew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7156
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



On 5/9/2025 4:10 AM, Umesh Nerlige Ramappa wrote:
> On Thu, May 08, 2025 at 11:20:02AM +0530, Riana Tauro wrote:
>> Add a helper function to check if cork is active and
>> end cork
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> tests/intel/xe_pmu.c | 10 ++++++++--
>> 1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index 094dc0c6c..03a966708 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -134,6 +134,12 @@ static uint64_t get_event_config_fn(unsigned int 
>> gt, int function,
>>     return get_event_config(gt, eci, event) | 
>> add_format_config("function", function);
>> }
>>
>> +static void check_and_end_cork(int fd, struct xe_cork *cork)
> 
> I thought xe_cork_sync_end was handling this internally, but I see a log 
> message now and not sure why that was added.
yeah but there is a warn which will cause CI to report. Will replace 
with one function

Thanks
Riana>
> You could just call this end_cork() and use it everywhere in this file 
> rather than calling 2 different flavors - xe_cork_sync_end and 
> check_and_end_cork.
> 
> Regards,
> Umesh
> 
>> +{
>> +    if (cork && !cork->ended)
>> +        xe_cork_sync_end(fd, cork);
>> +}
>> +
>> /**
>>  * SUBTEST: engine-activity-idle
>>  * Description: Test to validate engine activity shows no load when idle
>> @@ -172,8 +178,8 @@ static void engine_activity(int fd, struct 
>> drm_xe_engine_class_instance *eci, un
>>         xe_cork_sync_end(fd, cork);
>>     pmu_read_multi(pmu_fd[0], 2, after);
>>
>> -    if ((flags & TEST_LOAD) && !cork->ended)
>> -        xe_cork_sync_end(fd, cork);
>> +    if (flags & TEST_LOAD)
>> +        check_and_end_cork(fd, cork);
>>
>>     engine_active_ticks = after[0] - before[0];
>>     engine_total_ticks = after[1] - before[1];
>> -- 
>> 2.47.1
>>

