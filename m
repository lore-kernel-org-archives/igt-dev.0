Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E752CCD1AB
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 07:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D888210E9FA;
	Fri, 24 Oct 2025 07:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYDlaedZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DA210E9FA
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 07:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761292655; x=1792828655;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yWMKSU8mTCUMi1gFJn8VNX5a7iWePVz1+VP3TRJ6NYM=;
 b=QYDlaedZmz807HLSD1Jw9gmGgcqlQzDZtGDqU2uW3+YP/uoT8RTxk1P2
 KQwYfX31rjDlV2gtH/CQFE+yI7v3WCWmt0SS+DBCDAqUtaFW8vwq0d2bG
 b2TNzDaCWWu83fX4Y97/+2+9BXlOYJGlQQH8HoJlXh9lyjJwJQ3vt0mXY
 egIGD5DSqHhA8qSisaNbSMTkmkg10sgeYRAgTVfe1LHcPo+JgserWbOJD
 yc+W5MDxe1rM+IyPj+JwjLKqBrtTFs4XAc1wMuAmouVjs7m/DUqphHWGR
 S2oFjg+ShVmdAJsqtcYWxKzkVivQxp5Y06QmVSTDbPHSBO3bFF8iyJQ5t w==;
X-CSE-ConnectionGUID: P3nbNG8sTAWGdQqokYZx/A==
X-CSE-MsgGUID: m2F67keuQwC4rZNsSYTHzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81098757"
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="81098757"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 00:57:34 -0700
X-CSE-ConnectionGUID: K4ojbtkMSV6T5/l/MQON/w==
X-CSE-MsgGUID: EEPQCJkUTvSPNE6gTkiVpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="189495193"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 00:57:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 00:57:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 00:57:33 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 00:57:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeYQ/uvOrtCh8bfKCBRRvP0hrJ3o4qLA8Zw8ahXcylt4RbqME946ll5nr7uLMfRQFUgsbdR/iefu0/lRZSnklyswWA3p34AX6z6boySh0og4akUJMWmKDCy5+OotXPCBVOWK6HBykvl1eiX2YZLg3lSw7HEcJ5b/zjZRGGYtt6lkuf1HlTrHT32BZ4muID2PHyM/yxFynLj6oCtiuRljRQBhuJ6HaFyFZG6zaNjkTh5OZzP+jR1HqeO3eY6i2077rAwW5Xr/hfphzA1lCYrpiZ65nLqxwxlxx4Ao6ZpXv1AbUQOEaPsxs3G5kcwag5DMwW5QRknDEC6bmacH8MTD/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yWMKSU8mTCUMi1gFJn8VNX5a7iWePVz1+VP3TRJ6NYM=;
 b=HFAxUQ8b4N953VnGSXhoOwSn3/a8/dU+gxhWZQhypMQrAsecM3jQu8r/k6KrrtNZhN8bMuJY1STXWptQJG3euS1rwlOPLxsa3SY/hG9RJdGWwoadGoLPlD7wax7bXgDeKU1Ki8EWIV5IA5mkviVWJlihvjJOBiRI7u6Fyexm1xboSUtfUXnzAjffgSxxpe6N1MVosnliL1eI2OAJbBgdS+bN8W15AmZyZ+vsNO0qPTatWkBXYtoxRn2rq6zOQMtO2mPA7tGqTZdzeVs5onp2hD6o2LmwvsfpqQZ0V1EaIym6XS/7ZBrrqZXuoazf0jlk8s0mxvsSrT3F8yffXAazpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by PH8PR11MB8014.namprd11.prod.outlook.com (2603:10b6:510:23a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 07:57:31 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 07:57:31 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Uttamchand, Gajendra" <gajendra.uttamchand@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH v5 i-g-t 5/5] benchmarks/intel_latency: Add
 xe_bo_create_destroy test
Thread-Topic: [PATCH v5 i-g-t 5/5] benchmarks/intel_latency: Add
 xe_bo_create_destroy test
Thread-Index: AQHcRJbHbHo0wIWI4U+rp8bRbDuW2LTQ7NAggAABkVA=
Date: Fri, 24 Oct 2025 07:57:31 +0000
Message-ID: <CH3PR11MB8434FB7D73933A245894B9918DF1A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250917121626.67917-8-gajendra.uttamchand@intel.com>
 <20251024033118.15674-7-gajendra.uttamchand@intel.com>
 <20251024033118.15674-12-gajendra.uttamchand@intel.com>
 <CH3PR11MB8434BC353A7A5059C8B915B18DF1A@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB8434BC353A7A5059C8B915B18DF1A@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|PH8PR11MB8014:EE_
x-ms-office365-filtering-correlation-id: bf8efce9-9ec8-444e-d0a4-08de12d2fc01
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?SXpMRERwUldXZko5R0pqTG5SaHRIeTFCWFl0SytkbkloTTRkSXlncFpjVDRX?=
 =?utf-8?B?aG9KQUJVQ20zTVN4Q0FBSjNNWEVtN01pc2taU25wVXQxbVpLek1mQ2tRaVNS?=
 =?utf-8?B?b3F3Mmh6dG5sanRDNm50b1A4a2liVC9DNS9DWkJBLzlwUzE1NjBPSkJPWnJD?=
 =?utf-8?B?dGNMTUtLSVdmRjB3TGtOZFd4b1NCajRGdC95RjBwa2hlUXNpMSttY1NZcERU?=
 =?utf-8?B?Zy9ETUpkRkovTnp6N3RYWXVVTHZXSHByUk9QVmM1cWZValZTbGdhNnlNOWU1?=
 =?utf-8?B?d2J1N1ZMbjhtOU5VS0xOTlBHUnpBNmNnejFzTEpxYUkzWGtHM1IvN0tzQXVP?=
 =?utf-8?B?UmdnZ0tucEs5cEdLS2xJVnlQdU1Vb0I3UXhyRWYybjdyRDZLM2Z5clNuWWZl?=
 =?utf-8?B?Tm0wUmFGU1YvRWdFakhWT1J1TnpEbDFGNDNMUDNKY0pUMDBWakpWVE5vc0Ir?=
 =?utf-8?B?NWJvZ1NCS05zRTZSSERESWZGQmhKM2RVWFpIZ0I0bGFXanVkZ2pOTnhCQ1Bh?=
 =?utf-8?B?bHU0QlVuczhEQ0FZWDN0QjlaWHhEQkl4N3ZMOGt1RDBnb2d2b2tLb3RYcFE0?=
 =?utf-8?B?VldOUGJEeFZZZHdZeDB2NkFpdE9Fa0drdkdYeWZlT2FFaVRwN0VQOTg4OUh0?=
 =?utf-8?B?VFJVR0xNaGRsOEhneGxLY2UyWk5LN3paUm14MGxLaEJ6MEg1bE02Y1g1czkw?=
 =?utf-8?B?Mk9EUlhXM3NFQ0llblhKMHZLRitsSnpRK2VmaXA3UUdSL1JSc2lYYVFHSVdv?=
 =?utf-8?B?ZGxiS0puN045a29qNTQwYjJEVnM4NnlmRjZjTzFiajZwc1J6VjYvQ3dyNFRB?=
 =?utf-8?B?THd1Qmp6bzMxZ1h0Q1FnbXFTaDJTeXk4ZUwzV1ZmblVySWZ6Wmt2ck9ZV3B5?=
 =?utf-8?B?YThhQnduTStNcFdKbVkySEJ6Sm9DdjdBSDVaQTJzZ2xLelFpdTB0U0pVbFhp?=
 =?utf-8?B?c1p4SjFvaXBUUTJGQ3pYODdaUkI3cTJwS2dOdmtpa2ZaQWM4SmtNVUlwU1M1?=
 =?utf-8?B?Q0x4aDZ2WVcvQ2FIVWVSeElJSWpab0NsYUNaTGVPNnZBdWI2bGs2MzRaNVM1?=
 =?utf-8?B?M3RQM25QaWJ4empJaHRsQmc5RDdwaEZ4Z1FnMkV4TUpmVlVYZVRZbkFMbDBF?=
 =?utf-8?B?RFEyM1h4cFlOeHZjN041K1U4ZXV4NUJVL0hNMGhjaWwwOEJwdDc0dlNDWjVE?=
 =?utf-8?B?c2Fsd0k5RUR0aWZVMWFlRXN6ZjBvYTJMMFlYNXYrMkxjT08wUEMxdjN6N1h1?=
 =?utf-8?B?d2pGSlU4Zi9iY0JremFacjJDK2Z5b0JhN0tDZlBNdC9ZNEtJVkdiNEx0eWFZ?=
 =?utf-8?B?RFBleUFUVEVIRmNRU0JMZnR0U01PR29QTTBjMEJnZkFiL01oQm12TGxzb1hl?=
 =?utf-8?B?MXd2QzlFcDkvSUJ1UU9IaGJPYnJ4d3U4WldWNkEwVmtmR2wzTE01ZzM5VUxt?=
 =?utf-8?B?akM0Z1pwRFZpNnJMamhIZmNMa2dHUkdZNFJYNWlDc1hNaGxXTVJNWnpOTHFB?=
 =?utf-8?B?d1ZXN2xJSUtsV0VsdnpFTWppRkNkaW1VbXZ1dWZKNHN1US9jQTJZMjNTcUF0?=
 =?utf-8?B?UjVxWjFRazUwZ0lxQmxzOGFnNnJBdkZ0dXNvdG5JM3B0ZlFNdTlJZ3oxWWxF?=
 =?utf-8?B?VDR2SWN2QXlmTW1IRTFLdEJ6UWlCZ2FsTk9Fd3Y4ODV3eXRXQjYwd2pDSVFF?=
 =?utf-8?B?SXlxcld4UXU3dkthSkxZWjdQRTQ2WjBPczNPcyt2TXVhQk40QWkyU0RwRXp5?=
 =?utf-8?B?OU5MTU1WcTNTRFR6WGpISTZTM2pOenlDWUtoWkFvbTlubE9HWjRiMkd5QmFm?=
 =?utf-8?B?T0lYU011SmZZKy9zUG5XalRPTURkN3JJYmdtMmlaa0xHcjFvMnNYek5MTzdN?=
 =?utf-8?B?Y2hlZDk3OHVGQW9ZNkszbUwyOE50Q2lMd3RwczZVcnJZTG1BczB2SDM3ZG9B?=
 =?utf-8?B?clF4L0UwL0FZcXBiYnZhcjBpNXY0VUJlVnFqVjlMNERDNHg4aU1EazJ0L1VB?=
 =?utf-8?B?VldOcUhzVStQWGh1Y25HVjVqaitkMzEraWdBRU43U0VDbVRRUGVjN0NNUkJT?=
 =?utf-8?Q?4Njqrx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUZvNlJJVlRlZVJOWFlkMTlIREJIdGhXNVhid1JNUTdFaE4rYnFTR1lSU1Uy?=
 =?utf-8?B?VmkrSHlPR0FyUlZBalFBOFlya3RWU2ZxaDNvSGlYWS9xeU1neGV1ZjJOVllt?=
 =?utf-8?B?UkxKNHMxd3VtekJtai9oZ0lwY0tDZlFtY1VMaEFiVEJVTS9VTzRRdmtWaG5V?=
 =?utf-8?B?VmI1TVNIUHlTVVU4WWhEVmpFUkJQRllKR1RpaFBqd2dHUUF5QzMrdFBFNmJ5?=
 =?utf-8?B?ZHdPcEwvUjJlVG1qSnA2Z0duRVhjWmtEakE2aWNiR0ZqdVludWt0cUl3dk4z?=
 =?utf-8?B?NGhLNnFNekdySXdib2VsVU9ydmk1VWJKVU53S2Q2emxCc0xqdHM2SHFjTWRj?=
 =?utf-8?B?ZHVuM1I4b2xFZTFnV0pkK2JMMEd1eU1JbkN2MUtUbys4aTFFSEVIOXdlUHJO?=
 =?utf-8?B?TjdMbjhNbkZ2eUl1ZVU4Ym51UjNEUHppNUpVdVZZakhqcEtFQXRxUTdlTzNr?=
 =?utf-8?B?OFVaYkttTXNiaklhVVlpNHpmNlFibkwzVkJoTmJvTlR1bkd1d25SZU8vVDR3?=
 =?utf-8?B?bmY1S0RnRWk4Y0ZKeUZTeHZrcW8reGxFb2VuMWYzYmlqdmJGSDRpZHV4ZlVu?=
 =?utf-8?B?NkhxenUxMjV0NExmWks3ajlWeXdLVlFrNjg2REwxbHJPK05PaG5KRjdvT3BY?=
 =?utf-8?B?R1FiWGtSeGJGNzdmTFdRUi9DNE91VURvRHBhdERhS3FBa0VEUUVMNW1iRzNp?=
 =?utf-8?B?RzZzTVg3aUU5bDdVU1VmMXhtSE1tTndCWXZhR1IvRXJkc3Rsay90TUhtNlUr?=
 =?utf-8?B?QWZ2R1dkWDZJSWMvbDRwc2xHRlcvaXUwaEJwY3RiMUV5VUcvVzJhSlFNcTNh?=
 =?utf-8?B?MDRndFpPck5uUndSNFlCSkZMTFpyOUxlcVdVM0dzMm02T0JSdGVEK2JVeGJL?=
 =?utf-8?B?cEpEeTZIdEFOWU5QTU5OMW5tcm1QN1F1VzN5dGpnNFpxMEJLaVJaWXBUWGp3?=
 =?utf-8?B?Rk5YdUxFSURiY1BKSnc2OTFvTlNaK1JNVGNORkgwK3ZRZlN4OE9Nb1NhNUNn?=
 =?utf-8?B?VVl6ZHh0aUFpNmM0VXNVSTd2MG01ZitNZGJtZkJrM2crUXlBT3AwNi9MVkpF?=
 =?utf-8?B?YzA0VzhidjFadmtONkdDQmxXZWtBL2VKbE1lY1JnajZEYTJQTDNGRTlkamJK?=
 =?utf-8?B?aGZaNTV4U3FncGJpdkhTWGZ5TkM3eXRlSCtrdEp0andna0FyQWtYTmpmZmd0?=
 =?utf-8?B?RW16dGJFcDJKcmw0Y2Y0eW1jSW9rWGFZTU92ZmU1cVJYOGQ1RWd4Q0gyK3VM?=
 =?utf-8?B?ODBlNi9vMWh2YzJHbldXaW9MYlRMMDBOT2x2allPOU53WU4wNmlId2Mza0d4?=
 =?utf-8?B?U3VuZDVvbU1zZDBJd0FpZDJhT3NDVDJFUXFSbllDNmhCQXZEclZjQjFkUDZJ?=
 =?utf-8?B?dUZDa3ZwT2J4OWc0djNtWHUzL1RWTFBGVzVpb0tMWDhzNmhGcDNoOTZXOFFZ?=
 =?utf-8?B?R3R5OFA5RHVva2djM0dEM0ZoWkhjNlk3eCtWcStBTWlpcVB4QnBQdmNrcjdy?=
 =?utf-8?B?dVJFZllja0ZTWGpaTllJeG5uNmFJVk0ydGcrNXdZcjd0VVhrNmJjcU5rOTFi?=
 =?utf-8?B?WlljUmtYUXJhT2Uvdmg4SkRvRkdGN3VsOUd6dXZLTDYyUFM1SG5KZk1xbS9i?=
 =?utf-8?B?ZFJpY3kxVmlkVElnMm04dWphOUpZYWkzMHFROHEraHdFOUdJSDZZa3lFNEFU?=
 =?utf-8?B?OUZEUVFFRy9mWmE3b0FYeDc1UEQxU2ROa1QybFBEUnZ6MXgxcUd6R1FIdHc0?=
 =?utf-8?B?Wk9oYUF1alJsZmFYSUFVb2UxTGJiRFc1aFIxZkRnakxYdlI3bkttUTJlb3Rr?=
 =?utf-8?B?Y1JSYWdQOCs2UDgrNVVQVGs2Z3FxK2I3dXN0R0lMeSt6RW0wK2NpVjdFSUJR?=
 =?utf-8?B?bUNROUI2L2JqMnBOYlcyTit5QzYyWnc2cXpxdm0vVG1CdnhSUlp5ZmpoK3JC?=
 =?utf-8?B?azU3V3I4ZjJBaEZvVm9DQ0pnZnBOT0xsQ1FlR3B2T3dtdDlLeHdJQkVZZ1Er?=
 =?utf-8?B?T2Q1V3lldFRoTSttN25UR3RuV0p5Y2R1Y082eTM5MkhUNGJtOHhmWDlyUDY5?=
 =?utf-8?B?cnlaQVhTUUZXc0VZVVRhc3JsWHJZaTNrdjBWLzVJY1ZNbXpnYUF3ejlRb2Q1?=
 =?utf-8?B?M1J3REFHT2lFK2MyQWVVRnFXVTUxZnV0OUpwalR6VldZUUdhU2FlcGhQcEVF?=
 =?utf-8?B?dEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf8efce9-9ec8-444e-d0a4-08de12d2fc01
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2025 07:57:31.3190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yvtAO5P98ytIFxnfLMynLiCBo3AUX8723cPMoeRCyBKj7TE0+q+TxfIVSnnvRC3uLN8nvzrYhVB1OwDgWPHkiUHQpaZ4GTxiAt5qODQW0HY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8014
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuZGFtdWRpLCBQcml5
YW5rYQ0KPiBTZW50OiAyNCBPY3RvYmVyIDIwMjUgMDE6MjQgUE0NCj4gVG86IFV0dGFtY2hhbmQs
IEdhamVuZHJhIDxnYWplbmRyYS51dHRhbWNoYW5kQGludGVsLmNvbT47IGlndC0NCj4gZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogS29uaWVjem55LCBLYW1pbCA8a2FtaWwua29uaWVj
em55QGludGVsLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2NSBpLWctdCA1LzVdIGJlbmNo
bWFya3MvaW50ZWxfbGF0ZW5jeTogQWRkDQo+IHhlX2JvX2NyZWF0ZV9kZXN0cm95IHRlc3QNCj4g
DQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFV0dGFt
Y2hhbmQsIEdhamVuZHJhIDxnYWplbmRyYS51dHRhbWNoYW5kQGludGVsLmNvbT4NCj4gPiBTZW50
OiAyNCBPY3RvYmVyIDIwMjUgMDk6MDEgQU0NCj4gPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj4gPiBDYzogS29uaWVjem55LCBLYW1pbCA8a2FtaWwua29uaWVjem55QGludGVs
LmNvbT47IERhbmRhbXVkaSwgUHJpeWFua2ENCj4gPiA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVs
LmNvbT47IFV0dGFtY2hhbmQsIEdhamVuZHJhDQo+ID4gPGdhamVuZHJhLnV0dGFtY2hhbmRAaW50
ZWwuY29tPg0KPiA+IFN1YmplY3Q6IFtQQVRDSCB2NSBpLWctdCA1LzVdIGJlbmNobWFya3MvaW50
ZWxfbGF0ZW5jeTogQWRkDQo+ID4geGVfYm9fY3JlYXRlX2Rlc3Ryb3kgdGVzdA0KPiA+DQo+ID4g
QWRkIGJ1ZmZlciBvYmplY3QgbGlmZWN5Y2xlIGxhdGVuY3kgdGVzdCBmb3IgdGhlIFhFIGRyaXZl
ci4NCj4gPiBNZWFzdXJlcyBhbGxvY2F0aW9uIGFuZCBkZWFsbG9jYXRpb24gdGltaW5nIGZvciBi
dWZmZXIgb2JqZWN0cyBhY3Jvc3MNCj4gPiBkaWZmZXJlbnQgc2l6ZXMgYW5kIHVzYWdlIHBhdHRl
cm5zLg0KPiA+DQo+ID4gRGVmYXVsdHM6IGJ1ZmZlciBzaXplcyBmcm9tIDRLQiB0byA4TUIsIDEz
IHJlcGV0aXRpb25zLCAxMDAwDQo+ID4gaXRlcmF0aW9ucyBwZXIgcmVwZXRpdGlvbiwgMiBzZWNv
bmRzIHBlciBzYW1wbGUsIHNpbmdsZSBDUFUuDQo+ID4gUGFyYWxsZWxpc20gaXMgY29uZmlndXJh
YmxlIHZpYSBjb21tYW5kLWxpbmUgb3B0aW9ucy4NCj4gPg0KPiA+IEltcG9ydGFudCBmb3IgYXBw
bGljYXRpb25zIHdpdGggZHluYW1pYyBidWZmZXIgbWFuYWdlbWVudCBhbmQgaGVscHMNCj4gPiBp
ZGVudGlmeSBtZW1vcnkgYWxsb2NhdGlvbiBib3R0bGVuZWNrcyBpbiBncmFwaGljcyB3b3JrbG9h
ZHMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBHYWplbmRyYSBVdHRhbWNoYW5kIDxnYWplbmRy
YS51dHRhbWNoYW5kQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgYmVuY2htYXJrcy9pbnRlbF9s
YXRlbmN5L21lc29uLmJ1aWxkICAgICAgICAgIHwgICAxICsNCj4gPiAgLi4uL2ludGVsX2xhdGVu
Y3kveGVfYm9fY3JlYXRlX2Rlc3Ryb3kuYyAgICAgIHwgMTI1ICsrKysrKysrKysrKysrKysrKw0K
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEyNiBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBiZW5jaG1hcmtzL2ludGVsX2xhdGVuY3kveGVfYm9fY3JlYXRlX2Rlc3Ryb3kuYw0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL2JlbmNobWFya3MvaW50ZWxfbGF0ZW5jeS9tZXNvbi5idWls
ZA0KPiA+IGIvYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L21lc29uLmJ1aWxkDQo+ID4gaW5kZXgg
ZmQ1MjIyYTRhLi5lYzZmZDEzNTcgMTAwNjQ0DQo+ID4gLS0tIGEvYmVuY2htYXJrcy9pbnRlbF9s
YXRlbmN5L21lc29uLmJ1aWxkDQo+ID4gKysrIGIvYmVuY2htYXJrcy9pbnRlbF9sYXRlbmN5L21l
c29uLmJ1aWxkDQo+ID4gQEAgLTUsNiArNSw3IEBAIHhlX2xhdGVuY3lfcHJvZ3MgPSBbDQo+ID4g
IAkneGVfZXhlY3F1ZXVlJywNCj4gPiAgCSd4ZV92bV9iaW5kJywNCj4gPiAgCSd4ZV92bV9jcmVh
dGVfZGVzdHJveScsDQo+ID4gKwkneGVfYm9fY3JlYXRlX2Rlc3Ryb3knLA0KPiA+ICBdDQo+ID4N
Ckp1c3QgcmVuYW1lIHRoaXMgdGVzdCB0byB4ZV9iby5jIHdoaWNoIGlzIHNpbXBsZSB0byByZWFk
Lg0KPiA+ICBsYXRlbmN5ZGlyID0gam9pbl9wYXRocyhsaWJleGVjZGlyLCAnYmVuY2htYXJrcycs
ICdpbnRlbF9sYXRlbmN5JykNCj4gPiBkaWZmIC0tZ2l0IGEvYmVuY2htYXJrcy9pbnRlbF9sYXRl
bmN5L3hlX2JvX2NyZWF0ZV9kZXN0cm95LmMNCj4gPiBiL2JlbmNobWFya3MvaW50ZWxfbGF0ZW5j
eS94ZV9ib19jcmVhdGVfZGVzdHJveS5jDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBp
bmRleCAwMDAwMDAwMDAuLmRjN2Q3YTEwZA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9i
ZW5jaG1hcmtzL2ludGVsX2xhdGVuY3kveGVfYm9fY3JlYXRlX2Rlc3Ryb3kuYw0KPiA+IEBAIC0w
LDAgKzEsMTI1IEBADQo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQNCj4gPiAr
LyoNCj4gPiArICogQ29weXJpZ2h0IMKpIDIwMjUgSW50ZWwgQ29ycG9yYXRpb24gICovDQo+ID4g
Kw0KPiA+ICsjaW5jbHVkZSAiaWd0LmgiDQo+ID4gKyNpbmNsdWRlICJpZ3Rfc3luY29iai5oIg0K
PiA+ICsjaW5jbHVkZSAieGUveGVfaW9jdGwuaCINCj4gPiArI2luY2x1ZGUgInhlL3hlX3F1ZXJ5
LmgiDQo+ID4gKw0KPiA+ICsjZGVmaW5lIE9CSkVDVF9TSVpFICgxIDw8IDIzKQ0KPiA+ICsNCj4g
PiArc3RhdGljIGRvdWJsZQ0KPiA+ICtlbGFwc2VkKGNvbnN0IHN0cnVjdCB0aW1lc3BlYyAqc3Rh
cnQsIGNvbnN0IHN0cnVjdCB0aW1lc3BlYyAqZW5kKSB7DQo+ID4gKwlyZXR1cm4gKGVuZC0+dHZf
c2VjIC0gc3RhcnQtPnR2X3NlYykgKyAxZS05ICogKGVuZC0+dHZfbnNlYyAtDQo+ID4gK3N0YXJ0
LT50dl9uc2VjKTsgfQ0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQgdGVzdF9ib19jcmVhdGUoaW50
IGZkLCB1aW50MzJfdCB2bSwgaW50IHNpemUpIHsNCj4gPiArCXVpbnQzMl90IGJvOw0KPiA+ICsJ
dWludDY0X3QgYm9fc2l6ZSA9IHhlX2JiX3NpemUoZmQsIHNpemUpOw0KPiA+ICsNCj4gPiArCWJv
ID0geGVfYm9fY3JlYXRlKGZkLCAwLCBib19zaXplLCB2cmFtX2lmX3Bvc3NpYmxlKGZkLCAwKSwN
Cj4gPiArDQo+ID4gRFJNX1hFX0dFTV9DUkVBVEVfRkxBR19ORUVEU19WSVNJQkxFX1ZSQU0pOw0K
PiA+ICsJZ2VtX2Nsb3NlKGZkLCBibyk7DQo+ID4gK30NCj4gPiArDQo+ID4gK2ludCBtYWluKGlu
dCBhcmdjLCBjaGFyICoqYXJndikNCj4gPiArew0KPiA+ICsJaW50IGZkID0gZHJtX29wZW5fZHJp
dmVyKERSSVZFUl9YRSk7DQo+ID4gKwlpbnQgc2l6ZSA9IDA7DQo+ID4gKwlpbnQgYnVzeSA9IDA7
DQo+IFdoYXQgaXMgdGhlIG5lZWQgb2YgYnVzeSBpbiB0aGlzIGNhc2U/DQo+ID4gKwlpbnQgcmVw
cyA9IDEzOw0KPiA+ICsJaW50IG5jcHVzID0gMTsNCj4gPiArCWludCBjLCBuLCBzOw0KPiA+ICsJ
dWludDMyX3Qgdm07DQo+ID4gKw0KPiA+ICsJd2hpbGUgKChjID0gZ2V0b3B0KGFyZ2MsIGFyZ3Ys
ICJzOnI6ZiIpKSAhPSAtMSkgew0KPiA+ICsJCXN3aXRjaCAoYykgew0KPiA+ICsJCWNhc2UgJ3Mn
Og0KPiA+ICsJCQlzaXplID0gYXRvaShvcHRhcmcpOw0KPiA+ICsJCQlicmVhazsNCj4gPiArDQo+
ID4gKwkJY2FzZSAncic6DQo+ID4gKwkJCXJlcHMgPSBhdG9pKG9wdGFyZyk7DQo+ID4gKwkJCWlm
IChyZXBzIDwgMSkNCj4gPiArCQkJCXJlcHMgPSAxOw0KPiA+ICsJCQlicmVhazsNCj4gPiArDQo+
ID4gKwkJY2FzZSAnZic6DQo+ID4gKwkJCW5jcHVzID0gc3lzY29uZihfU0NfTlBST0NFU1NPUlNf
T05MTik7DQo+ID4gKwkJCWJyZWFrOw0KPiA+ICsNCj4gPiArCQlkZWZhdWx0Og0KPiA+ICsJCQli
cmVhazsNCj4gPiArCQl9DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJaWYgKHNpemUgPT0gMCkgew0K
PiA+ICsJCWZvciAocyA9IDQwOTY7IHMgPD0gIE9CSkVDVF9TSVpFOyBzIDw8PSAxKSB7DQo+ID4g
KwkJCWlndF9zdGF0c190IHN0YXRzOw0KPiA+ICsNCj4gPiArCQkJaWd0X3N0YXRzX2luaXRfd2l0
aF9zaXplKCZzdGF0cywgcmVwcyk7DQo+ID4gKw0KPiA+ICsJCQlmb3IgKG4gPSAwOyBuIDwgcmVw
czsgbisrKSB7DQo+ID4gKwkJCQlzdHJ1Y3QgdGltZXNwZWMgc3RhcnQsIGVuZDsNCj4gPiArCQkJ
CXVpbnQ2NF90IGNvdW50ID0gMDsNCj4gPiArDQo+ID4gKwkJCQl2bSA9IHhlX3ZtX2NyZWF0ZShm
ZCwgMCwgMCk7DQo+ID4gKw0KPiA+ICsJCQkJY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUMs
ICZzdGFydCk7DQo+ID4gKwkJCQlkbyB7DQo+ID4gKwkJCQkJZm9yIChjID0gMDsgYyA8IDEwMDA7
IGMrKykNCj4gPiArCQkJCQkJdGVzdF9ib19jcmVhdGUoZmQsIHZtLCBzKTsNCj4gPiArDQo+ID4g
KwkJCQkJY291bnQgKz0gYzsNCj4gPiArCQkJCQljbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05J
QywNCj4gPiAmZW5kKTsNCj4gPiArCQkJCX0gd2hpbGUgKGVuZC50dl9zZWMgLSBzdGFydC50dl9z
ZWMgPCAyKTsNCj4gPiArDQo+ID4gKwkJCQl4ZV92bV9kZXN0cm95KGZkLCB2bSk7DQo+ID4gKwkJ
CQlpZ3Rfc3RhdHNfcHVzaF9mbG9hdCgmc3RhdHMsIGNvdW50IC8NCj4gPiBlbGFwc2VkKCZzdGFy
dCwgJmVuZCkpOw0KPiA+ICsJCQl9DQo+ID4gKwkJCXByaW50ZigiJWZcbiIsIGlndF9zdGF0c19n
ZXRfdHJpbWVhbigmc3RhdHMpKTsNCj4gPiArCQkJaWd0X3N0YXRzX2ZpbmkoJnN0YXRzKTsNCj4g
PiArCQl9DQo+ID4gKwl9IGVsc2Ugew0KPiA+ICsJCWRvdWJsZSAqc2hhcmVkOw0KPiA+ICsNCj4g
PiArCQlzaGFyZWQgPSBtbWFwKDAsIDQwOTYsIFBST1RfV1JJVEUsIE1BUF9TSEFSRUQgfA0KPiA+
IE1BUF9BTk9OLCAtMSwgMCk7DQo+ID4gKw0KPiA+ICsJCXZtID0geGVfdm1fY3JlYXRlKGZkLCAw
LCAwKTsNCj4gV2h5IGlzIGl0IHRoYXQgdm0gaXMgZ2V0dGluZyBjcmVhdGVkIG9ubHkgb25jZSBo
ZXJlIHdoZXJlIGFzIGluIGlmIGNhc2UgaXRzDQo+IGNyZWF0ZWQgZm9yIGV2ZXJ5IHJlcGV0aXRp
b24/DQo+ID4gKw0KPiA+ICsJCWZvciAobiA9IDA7IG4gPCByZXBzOyBuKyspIHsNCj4gPiArCQkJ
bWVtc2V0KHNoYXJlZCwgMCwgNDA5Nik7DQo+ID4gKw0KPiA+ICsJCQlpZ3RfZm9yayhjaGlsZCwg
bmNwdXMpIHsNCj4gPiArCQkJCXN0cnVjdCB0aW1lc3BlYyBzdGFydCwgZW5kOw0KPiA+ICsJCQkJ
dWludDY0X3QgY291bnQgPSAwOw0KPiA+ICsNCj4gPiArCQkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tf
TU9OT1RPTklDLCAmc3RhcnQpOw0KPiA+ICsJCQkJZG8gew0KPiA+ICsJCQkJCWZvciAoYyA9IDA7
IGMgPCAxMDAwOyBjKyspDQo+ID4gKwkJCQkJCXRlc3RfYm9fY3JlYXRlKGZkLCBidXN5LCBzaXpl
KTsNCj4gV2h5IGlzIHRoYXQgYnVzeSB1c2VkIGluIHRoaXMgY2FzZT8NCj4gPiArDQo+ID4gKwkJ
CQkJY291bnQgKz0gYzsNCj4gPiArCQkJCQljbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQywN
Cj4gPiAmZW5kKTsNCj4gPiArCQkJCX0gd2hpbGUgKGVuZC50dl9zZWMgLSBzdGFydC50dl9zZWMg
PCAyKTsNCj4gPiArDQo+ID4gKwkJCQlzaGFyZWRbY2hpbGRdID0gY291bnQgLyBlbGFwc2VkKCZz
dGFydCwNCj4gPiAmZW5kKTsNCj4gPiArCQkJfQ0KPiA+ICsJCQlpZ3Rfd2FpdGNoaWxkcmVuKCk7
DQo+ID4gKw0KPiA+ICsJCQlmb3IgKGludCBjaGlsZCA9IDA7IGNoaWxkIDwgbmNwdXM7IGNoaWxk
KyspDQo+ID4gKwkJCQlzaGFyZWRbbmNwdXNdICs9IHNoYXJlZFtjaGlsZF07DQo+ID4gKw0KPiA+
ICsJCQlwcmludGYoIiU3LjNmXG4iLCBzaGFyZWRbbmNwdXNdKTsNCj4gPiArCQl9DQo+ID4gKwkJ
eGVfdm1fZGVzdHJveShmZCwgdm0pOw0KPiA+ICsJCW11bm1hcChzaGFyZWQsIDQwOTYpOw0KPiA+
ICsJfQ0KPiA+ICsNCj4gPiArCWNsb3NlKGZkKTsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+
ID4gLS0NCj4gPiAyLjQzLjANCg0K
