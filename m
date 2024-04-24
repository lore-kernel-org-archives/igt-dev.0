Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88D1C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 12:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016FB113B03;
	Wed, 24 Apr 2024 12:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjv0Y3xv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB987113B02;
 Wed, 24 Apr 2024 12:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713962446; x=1745498446;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OQGrcvSCYd6BEeaIah17iXesab0V8jJdxOmw+yCTzxQ=;
 b=kjv0Y3xv9rTRW43m4UnUpmHUkJgPD0rOZUArEtpWtujqr0SvDkd+ZQ/j
 O+vmRswQPRNOQteCoFytJeMAKVR5FeYNsgwl3seAa2eTj/RcNAiCjMTbj
 oi4P7ou9J2+veqmWy9n32JpA8PIKKkYhHwe5LOSci/T/opVSx1PmO7PC/
 p6Y5LqLqDeWwD881Y8xk4GmN2DXek92feXbKc4Zq+V7Wi97hD4cxKz4z9
 mm8iRXghNQIkakoWKA8M4xueozFJMOi0/ka/ol0LR8gW2/w1cg07u2iqa
 1hmoVHnU0gUxyHh1X6lPMY4z84eh20dGwR3K8f6+Pb/QKxXo1ef6zZnM0 A==;
X-CSE-ConnectionGUID: H1CDKGi+TX+TprQtCtPg0A==
X-CSE-MsgGUID: Ezx3hAX5Rqy89xCvP/4FNQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20140326"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="20140326"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 05:40:45 -0700
X-CSE-ConnectionGUID: ajkziwEoTkmclQobHHZrqA==
X-CSE-MsgGUID: nTurISd6SDyyypWqjiyPLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="55897284"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 05:40:46 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 05:40:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 05:40:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 05:40:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAGDZ7sGocNzpQYUP7gNrd5qKDLppGtXIMRHELDsiOpcrsW0pgMhPk13d51bURKeIG4ezqxu8SyREFrPEA4I8CrjxtSrvpxaOirnzrh4dIiY1gxpkYFU8JpoRWFUjuPXp6qTq3K/F3uxI1H4Bfx1cBN/FSLSYNSGuYDwmEMx2MpQD+zf2wDZo/DoorKo8K3U7BKhPbaDbpp1M+fjk5TJVmYZKciUqV7iMr4esCs8LSJo0A76YrAwtTwK9vkmmCxxV8ycC/VRN2jgVCEPSY84QHYCco342XyZxNG5M/vnJDA11ozfANbiSHTfYpQQwNYFugotudckrSZzjx9hQn7fOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQGrcvSCYd6BEeaIah17iXesab0V8jJdxOmw+yCTzxQ=;
 b=TuXPTkitghObR8FLwEPG9L/groAmxn7sSnPQd706IvdfmUNzPcmTBlIS5FCQEqD4IbRq9QWzkZ0U9k7bna7XG4cWNhpP1nGsfidQUtG6pJZLzRQ2YGJaYTvaqxOrybJ5ydbLrorV5Yf7f9Q729tf7MSa+Pw81bgP3AQEG/pmZNEFUcri1FPkwT81NzehjPYZgwdO4VA9zqBll+0Sq6Q636c7/O5LlPlHhdgJZABN/695LSLSW7jdaKI7rkpj6SgGJQCyCgs7DUHYiP4ep/riOPF19Xo0T836EIeMLp33NVNCgM01iF3EjcQEMd49sUPZQCrh2LbY3M0aOjcY23C9aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by PH8PR11MB7142.namprd11.prod.outlook.com (2603:10b6:510:22e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 12:40:42 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::872:479f:4c28:21b5]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::872:479f:4c28:21b5%6]) with mapi id 15.20.7519.021; Wed, 24 Apr 2024
 12:40:42 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Peter Senna Tschudin <me@petersenna.com>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5JR1Q6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVsL2dl?=
 =?utf-8?B?bV9leGVjX2NhcHR1cmU6IGZpeCB1c2Ugb2YgaWd0X2FsbG93X2hhbmcoKSAv?=
 =?utf-8?B?IGlndF9kaXNhbGxvd19oYW5nKCkgKHJldjIp?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwvZ2VtX2V4?=
 =?utf-8?B?ZWNfY2FwdHVyZTogZml4IHVzZSBvZiBpZ3RfYWxsb3dfaGFuZygpIC8gaWd0?=
 =?utf-8?B?X2Rpc2FsbG93X2hhbmcoKSAocmV2Mik=?=
Thread-Index: AQHaksYMT44CNTAKXUipR1lQaKH67rF0LLaAgAM21rA=
Date: Wed, 24 Apr 2024 12:40:42 +0000
Message-ID: <PH8PR11MB675343AE9A26CB9669C78782F2102@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20240411191934.10368-1-me@petersenna.com>
 <171357818004.1536675.6162668437809712972@8e613ede5ea5>
 <20240422113509.xsjepiwnul3zh5d4@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240422113509.xsjepiwnul3zh5d4@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|PH8PR11MB7142:EE_
x-ms-office365-filtering-correlation-id: 0a02e802-0b89-4889-d395-08dc645bc149
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?Rm5MMEV3MjF5VEwrRFRxeHU1RmUvOEpnTUhxNmkyOXVKczUzZzM4WVR2bWta?=
 =?utf-8?B?TTg2MUVPbSs4T0F5N2ZpeWltZEI0OEZPMDMwUVJSR3NSbnZoSjFrL1R3TERl?=
 =?utf-8?B?S0xWRm5la3I5TWlOQlNQR0JLZFY1M3dVNVg2cW8xUGZoSGhEbjI0YWUxSFYr?=
 =?utf-8?B?UG9qNHVCRHh3U2grWDRhOThxTWVvUDZYNmI1ajFtMHRadEtlVlBIU1JJQjFp?=
 =?utf-8?B?cGd2SzNRclhzZmtyenBGYko2djRMMUFKVUM3Wm9iR1p5bjVzVlhRS0IyelRp?=
 =?utf-8?B?RkVQNlF3OEdLcnRpTEFodGdkQmp0K01rUGZkajZ2MkVmTmRnODlHb2RnNmxD?=
 =?utf-8?B?RXJOS3Y0RHFiUG5kNjloRUtyaHBUVWZ1YUdKZkZGTGFQNEl3NHI0cmtxRk1I?=
 =?utf-8?B?NGN6SVlaQmJUVmhJb3pGVGgwMzdtcGJOR2VGTnlyUE5rUlRwclR6bkhSL2JI?=
 =?utf-8?B?MEtoRFNYTldDT0VXVVhxVHo5Nm5qR3pSeUpLMUMxSHFweDl1Y2xldTBrZlZC?=
 =?utf-8?B?b3N6QmQ1d2JNNkJFcXNYeHB6MVduaXUxVEJsTWhORlRsN25KQVZnVVRGZGJY?=
 =?utf-8?B?V0hwUW8vM3g3OGVaYmpuZUNCTUs2MmRSQVhLZExXYXBickF1a1FUbkRFMml5?=
 =?utf-8?B?NkJ1QXk1SmNndG9hTFZjcVR2b2VzRzIyZVgzWU1FZHdWcC9tT0lrdFduN3BD?=
 =?utf-8?B?RklxK01PcFNRWnpVTHRkTitEWElRWFVoWFdMQW9pWkJOWDNoTjFyZjdRWUox?=
 =?utf-8?B?dUNyZUdqSFRtR3I0WkJzUW1VaXZnUXBScTdITlBaVXJVMWJ5VUI3eHhrMzE5?=
 =?utf-8?B?YUM1UDJQaFROQ3dST1BXdzVHWWFCZE5pclFkdFhyRzZ2UkgvcmZoYWMrbEJp?=
 =?utf-8?B?MjdkaW5WOGNsUlNWdllsWDliVkxHaTEwZDU0RktTMFZsQ1Voanp6bTE3clcx?=
 =?utf-8?B?Mjc0bnBrRnp0Y3RrRWpKZURSRXIxS1N2NmFvQW9mT1VmaUU1RDNiNlVqNTdP?=
 =?utf-8?B?aUZFR1NrVW0wc3FGZ2k0ZU1ZOGJPMTNkVk5iU2VsL1o4V2FiRGdvTG50YkN2?=
 =?utf-8?B?aXltMjVsTnNUN1l5K2E3RjIxdDd0Z1VTay9OYzJ1NmMwN202OFppYzl5dDJQ?=
 =?utf-8?B?czc1dGYrbVN5SmM2aHpqck9VL0Vnc1BHQTh4ZHVUT2tCampEM0JZZnVudDJJ?=
 =?utf-8?B?U2hkYU5jdTZuK0UvczRRa1lidzdxYm1XTkhGU2wwd1o1ZmRqeER6ZDRhMTZP?=
 =?utf-8?B?bUsxKzQrRmZxQ2dJQ1ArVU9jTTdqWmFmaFlpU0cwenR5YUJVamtEcmJMM2ky?=
 =?utf-8?B?aFYrcnpCVmo4cVdMYSsrVWw1S283cE1tWWdxem9ma2F5aDJ1a2tWVFowaUkr?=
 =?utf-8?B?TjgxWk52RmpmZmlFcGpCOVZyRFRkZEkxMitVbE9BckFpdWtkUGx3K0ttNGkz?=
 =?utf-8?B?TFBDRGMySmFUWk81Mk5BNE5oeXIzQm9Da0tWTzNBQlNZNnZCeVhOMTljRk9Y?=
 =?utf-8?B?RGtQNG5sampsdzhUSHg2VWd6RjcxQWUyS3Z3TGxCdThBNXJCZXRSanh4bkMr?=
 =?utf-8?B?V3YyMXlueCtvSmJ0ZFlqN1ZnSWl2QkdTcWxoY1hLRnloeit6RmhPZGRrUEFZ?=
 =?utf-8?B?OWZYcVgxMXMxNmZpYS8zVEI0dzh5WEZkVG5nMkJRdEovZkZOaXFWQVVDaWpl?=
 =?utf-8?B?aEFFWmcwaDdJZ0RyclV3RkN3WURjZ1lXVFFoVnZFeWJCWnplekRiK0tmbXZj?=
 =?utf-8?Q?Qqrgq9Shc/SYXyBuXk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0o2c2tyRG9PWVF2SVNNT0UzbkIwbzZpOUdZMjkrR04vZXVGUVlxNHRQYzRW?=
 =?utf-8?B?cnJreTREQnp2U3Q5TGloTk1ST0FVbjhab0k1ZWFSZ1ZFNE0zV2x6eWswU1Zm?=
 =?utf-8?B?WXVBZW5jSFBKcTd6eFVXZzhZMHdoY1FmeDlKN0JOSTg2emdtRWRmbUhpNy9i?=
 =?utf-8?B?MEMrUzQzOUE3Y1E1VEh2a3FJYUR6VWtsQWgvdE1KZFVxaWxXWmZqMHlKMEJk?=
 =?utf-8?B?TytJY0hINUhrOFdhMDRzUGdrR25pbHlqN244RWVUeVRNUnBMKzRwMGNjZlB2?=
 =?utf-8?B?UVVhUlVXdVR0b29pblE0blJhcThnV2hvRmR5cXZFaFNid05LVVpDWXR4NmNv?=
 =?utf-8?B?NktWU21UQzRSQVN4ZEFqMVlWUk5walZBd2lxS1pzMVo4UDhHYlFhNlJ1SlpL?=
 =?utf-8?B?V3NjMnVjcFJLTWdlNEh1dnNtY3AvLzdWdlZBTHd3RHp4Qk5GcXpqQkRWVFNB?=
 =?utf-8?B?c2Q3eEhZMVBsZ05oUytQbTFKU0t3ckFQYS9RcVI3cmRNL29TUkR6VElSMi9w?=
 =?utf-8?B?ZHAyQmxDSHU0bDZ0eGNJWWVDVG0xOFc3WlJGekVDNzJTbjRIZzJjMUdZNW1D?=
 =?utf-8?B?WmJLMm1YYlBJSDA3cXdxU0pCTmlUT05CVnhocTVKRmczVzNjczhHRkk4ZU5L?=
 =?utf-8?B?ZlA4SkJOcDhUbHBHZjdPS0d0QjVCZzlNa1lnL2FWYjlTdUZpUWIvd2hNa09P?=
 =?utf-8?B?T3lJSEFzZ1B0WVI5UnVLWGpWTm1iZUwwcUd3ZmlCVXgxa0Y3Z1RPUnY0M2hX?=
 =?utf-8?B?STNPcnJNYTBKRmxUb2J0cWFWeVd0enZZWjYvbjdVQzV3UWNrRnBSSWxweG1p?=
 =?utf-8?B?L3g5VXc0MVB6UFJNUGtQOWtjR1NtbWR0YTJIUlBRMWtkUDlLRExvRUl5MDIv?=
 =?utf-8?B?ZHFZT0lvdzZRN0gzV2p6TUgya1lKSFZuZmpjalB1ODZ3NUUvTXE3MHhURm5L?=
 =?utf-8?B?TUpQY2ROUTNDeTZBVUVJR0dSejd5eURMTXQ4RFBhVWNpVUg5Z01tVThXL0hn?=
 =?utf-8?B?ZlZkYmRJSXovbytoZEc2dmliZnVxUmNYS1BpSHNUc2FpQW01NElJcU5CZGNB?=
 =?utf-8?B?dTA4NDVuTHdsTVhxUDJNdk9xNFk1N2IwRldMWm1HV3ZuYUFtelIzZmVMTVVK?=
 =?utf-8?B?eFpGWThsYkszNmw0c3JIbmM3T0tsSXJCYUNaNjZROTJhYkRqaXVSNlRDaGVl?=
 =?utf-8?B?d3dWYXYxaFI3RHdNVnZIZitVcDRkYTVEeDU3ZDRQL1BKM1U2cFk3RzRVTDFv?=
 =?utf-8?B?QlhHUUJnUDF2dmdzTC94VmVVSmMzV05LVDBHTzd5M2NPZU1FME03cGtvMVBu?=
 =?utf-8?B?VG5uMW1NLzF0NmZXRTEybW8yQmlYUXZ2Yks2VEdpYkUrb3E3TUJqenNvV3Bs?=
 =?utf-8?B?clVtazZVTVBPRElXQlhxaUU0RmkycWl2SU1xVkhZR1UwNVB6YjBIRFdBaHhC?=
 =?utf-8?B?U3E2MTdHdE5HdEJ4RWRFcmplcjBzUGN4MFU1a2VIajF0SHhLQTVONUdNMVNJ?=
 =?utf-8?B?eERBSkR0STU5NkF2bzFmVzhxM2tUZ3VBckErMHNCcWxqNGN4N29aaVRYQjVv?=
 =?utf-8?B?QVpZN2ZONlVaQi9BTzFMcGZXQzJwM3F0N2p5MHNoLzVlZjAvTWo1ZDhxZjVw?=
 =?utf-8?B?V2hvSUJFWEkzQktaYmtGYlBEa1NldmozbnZqWFBOd3pTSi8xUnQ2cFNsVW5H?=
 =?utf-8?B?cjZZOVBZS1RWN0VQNW9IV3ZyNERYU2kxL0FZaUI4eDdJRVllV3l1aXJtWEVh?=
 =?utf-8?B?eVVwMW1tNGk3Y2FsTXB5Z2dkZ0lkOUJydm95TURReVlZRVBzUWZXeG1IcG1C?=
 =?utf-8?B?VzJ5dk9UaUpWMTRuQVBQTVZUanMxWENaUGZvL2VwYmpSUXI3b05zeDJKYjg2?=
 =?utf-8?B?bEVXbzlXMk1DQlhuQnNjclVxUjhCTHNWay9wRC9hODZGK3ptUnErWFZiVFpa?=
 =?utf-8?B?a1pBeE9KcjVnNjBxbVRxNE5xaUN6VXFLdDJ0M0VacTVLMEFCcTB2Wk5MQ2RB?=
 =?utf-8?B?ejRYaHdkaDdXbUkyM3FzZ2VYOW9VUzhVZDVOaWFHaTZmOUp3VDk5YlZvRjZX?=
 =?utf-8?B?dzNxdUJOQWRXd3grQmRNMzkwUlJtMUpaYzJ4WG80VXNPRjBWZUVTdWczclF5?=
 =?utf-8?B?aXNGbkZKemk3bWRoRHJ5VERidjlwU1pQaWRqdUQrTzJqSWwvU0VSQ1VOU0tK?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a02e802-0b89-4889-d395-08dc645bc149
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2024 12:40:42.7023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wO6HoCfYFyfe/Vfqw1aImGKMMUwwDqBrYqyzHumUyljIAdcLwZnAIGrEgqeYKJzNpKPfqELU0YOK1Xr52XZHtERNGEawOrx4ky7h8YGEpuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7142
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTMyMzMwLyAt
IFJlLXJlcG9ydGVkLg0KDQpUaGFua3MsDQpUZWphc3JlZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogSTkxNS1jaS1pbmZyYSA8aTkxNS1jaS1pbmZyYS1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEthbWlsIEtvbmllY3pueQ0KU2VudDogTW9u
ZGF5LCBBcHJpbCAyMiwgMjAyNCA1OjA1IFBNDQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCkNjOiBQZXRlciBTZW5uYSBUc2NodWRpbiA8bWVAcGV0ZXJzZW5uYS5jb20+OyBJOTE1
LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IOKclyBGaS5DSS5J
R1Q6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVsL2dlbV9leGVjX2NhcHR1cmU6IGZpeCB1c2Ugb2Yg
aWd0X2FsbG93X2hhbmcoKSAvIGlndF9kaXNhbGxvd19oYW5nKCkgKHJldjIpDQoNCkhpIGlndC1k
ZXYsDQpPbiAyMDI0LTA0LTIwIGF0IDAxOjU2OjIwIC0wMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQo+
ID09IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IHRlc3RzL2ludGVsL2dlbV9leGVj
X2NhcHR1cmU6IGZpeCB1c2Ugb2YgaWd0X2FsbG93X2hhbmcoKSAvIGlndF9kaXNhbGxvd19oYW5n
KCkgKHJldjIpDQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nl
cmllcy8xMzIzMzAvDQo+IFN0YXRlIDogZmFpbHVyZQ0KPiANCj4gPT0gU3VtbWFyeSA9PQ0KPiAN
Cj4gQ0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSBDSV9EUk1fMTQ2MTZfZnVsbCAtPiBJR1RQV18x
MTA0NV9mdWxsIA0KPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09DQo+IA0KPiBTdW1tYXJ5DQo+IC0tLS0tLS0NCj4gDQo+ICAgKipGQUlMVVJFKioN
Cj4gDQo+ICAgU2VyaW91cyB1bmtub3duIGNoYW5nZXMgY29taW5nIHdpdGggSUdUUFdfMTEwNDVf
ZnVsbCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxseS4NCj4gICAN
Cj4gICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRv
IHdpdGggdGhlIGNoYW5nZXMNCj4gICBpbnRyb2R1Y2VkIGluIElHVFBXXzExMDQ1X2Z1bGwsIHBs
ZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoJnF1b3Q7STkxNS1jaS1pbmZyYUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcmcXVvdDspIHRvIGFsbG93IHRoZW0NCj4gICB0byBkb2N1bWVudCB0aGlzIG5l
dyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBDSS4N
Cj4gDQo+ICAgRXh0ZXJuYWwgVVJMOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvZHJtLXRpcC9JR1RQV18xMTA0NS9pbmRleC5odG1sDQo+IA0KPiBQYXJ0aWNpcGF0aW5nIGhv
c3RzICg5IC0+IDkpDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBO
byBjaGFuZ2VzIGluIHBhcnRpY2lwYXRpbmcgaG9zdHMNCj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1
ZXMNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgdW5rbm93biBj
aGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluIElHVFBXXzExMDQ1X2Z1bGw6
DQo+IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMjIFBvc3NpYmxlIHJlZ3Jlc3Np
b25zICMjIyMNCj4gDQo+ICAgKiBpZ3RAaTkxNV9zdXNwZW5kQGJhc2ljLXMyaWRsZS13aXRob3V0
LWk5MTU6DQo+ICAgICAtIHNoYXJkLW10bHA6ICAgICAgICAgW1BBU1NdWzFdIC0+IFtBQk9SVF1b
Ml0NCj4gICAgWzFdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0NJ
X0RSTV8xNDYxNi9zaGFyZC1tdGxwLTUvaWd0QGk5MTVfc3VzcGVuZEBiYXNpYy1zMmlkbGUtd2l0
aG91dC1pOTE1Lmh0bWwNCj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvZHJtLXRpcC9JR1RQV18xMTA0NS9zaGFyZC1tdGxwLTEvaWd0QA0KPiBpOTE1X3N1c3Bl
bmRAYmFzaWMtczJpZGxlLXdpdGhvdXQtaTkxNS5odG1sDQo+IA0KDQpUaGlzIGlzIHVucmVsYXRl
ZCB0byBnZW1fZXhlY19jYXB0dXJlLA0KDQpSZWdhcmRzLA0KS2FtaWwNCg0KPiAgIA0KPiBLbm93
biBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tDQo+IA0KPiAgIEhlcmUgYXJlIHRoZSBjaGFuZ2VzIGZv
dW5kIGluIElHVFBXXzExMDQ1X2Z1bGwgdGhhdCBjb21lIGZyb20ga25vd24gaXNzdWVzOg0KPiAN
Cj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiANCj4gIyMjIyBJc3N1ZXMgaGl0ICMjIyMNCj4gDQoN
Ci4uLmN1dC4uLg0KDQo+IA0KPiANCj4gQnVpbGQgY2hhbmdlcw0KPiAtLS0tLS0tLS0tLS0tDQo+
IA0KPiAgICogQ0k6IENJLTIwMTkwNTI5IC0+IE5vbmUNCj4gICAqIElHVDogSUdUXzc4MTQgLT4g
SUdUUFdfMTEwNDUNCj4gDQo+ICAgQ0ktMjAxOTA1Mjk6IDIwMTkwNTI5DQo+ICAgQ0lfRFJNXzE0
NjE2OiA1M2RkN2EyOTA5MTM5ZmI0NjlkYjQ0MjNiNzlkOGEyODg4YTczNGMyIEAgZ2l0Oi8vYW5v
bmdpdC5mcmVlZGVza3RvcC5vcmcvZ2Z4LWNpL2xpbnV4DQo+ICAgSUdUUFdfMTEwNDU6IDM5ZDZj
NTA0ZjQ5NTY1MDU0Y2MzZWFkMGU3MTQ3MTA1YzY3ZGIxZjIgQCBodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMuZ2l0DQo+ICAgSUdUXzc4MTQ6IDc4MTQNCj4g
DQo+ID09IExvZ3MgPT0NCj4gDQo+IEZvciBtb3JlIGRldGFpbHMgc2VlOiANCj4gaHR0cHM6Ly9p
bnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMTA0NS9pbmRleC5odG1sDQo=
