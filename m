Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3E8CD5BC8
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 13:40:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE7510E1AC;
	Tue, 26 May 2026 13:40:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bBZW+MD+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33ECC10E65E
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 13:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779802819; x=1811338819;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iow1mA7gpqdvQRdnerU2PDU0hi/qhQ42kfexsBghEb4=;
 b=bBZW+MD+hljUZJ9O1zxO1fkHc+1fdATutUYJSKkojN1TLC3Csea+wn0O
 30x9+PuAn3vm/jI3q7+dQ+5wyvKHhMTRciX3eYJ07a9LZa4BOw02zfsfu
 Pm2XipMEa8RQHtJnkylHaXfZ5zITwgPW6Jl0MqXYhdrhlncH0BsIv5XKy
 D8wdlegMQi1FynFHb+xB+Fdw3NYT6ObL+ZwwOPXlUx9F5rpX2Jw+nVRWA
 qv6Zqh/1SFO0lnHkQ/gQPbs7VkGzBt2nrm4+tkLPhahfzzY6444vlrST1
 CFvO2+GzzwkiQWJK9GdRdf1yFs9Abnn1feqKSa37D+XKLiOH3/rpQj4+2 w==;
X-CSE-ConnectionGUID: pIL64Aa5SomvkdmYubvBhw==
X-CSE-MsgGUID: 8rMbyFaYSRS8LHFL1lFi6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="90914841"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="90914841"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 06:40:19 -0700
X-CSE-ConnectionGUID: LkRSFqkTTW6iRZU20YnFDw==
X-CSE-MsgGUID: KjswkLjBTyqfLzjtAGZBWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="265782502"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 06:40:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 06:40:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 06:40:18 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 06:40:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTjR9Qie/fa7kqlSQWdEu7ZJBDGVK/hBgtXNiMUMtqd3dS9MXZ6njpldvW9r3YkagKVPUkN3FmlwlTr3t3yNnujYi/nCOYuAjjYmJs9vC/BmjDkCS9QAOWoLIlkvHJmgBEbV8BAe0TWYGdl9YbpBbCv7vGxsrRbdUt4eE9J0NLLvVmMFMFq4E8zC6SpH5BB3bRMHVPYJIic9iz9x5XLIXcvt12YN8nBBcOeliTz0WEwiT+eZN6SY7JSGrqhGgpu+82MIOdgf3IBBRsqjCx4NrcJ+/zuVvxqw1QfwYsOWMIow9UkyHr47wW+IpmN5s+enOkpEiYc27euztNs33WvigQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iow1mA7gpqdvQRdnerU2PDU0hi/qhQ42kfexsBghEb4=;
 b=ca7sXc4FPny/qnUB6btHx0xFcbPKOZkbpzjgAdQZ87Ri5AUWb9+nFL1nZDXjndo3mNIwAzsoe+SeNkZjKLCcTkL04q3fohVyO6P8YTz42vdGOIEeN4cpilRORBOcgmDTmPOuH5p2GiwleeyraBwAsVrMGTuYhRJJiIgVzI4UNsTyczoDuik22hLcoKCTPAaYbFcvyZ88a6KgFQ8Q9hjq+QFGLr7yhSk3hjHm7Q+idM02AGXBMpBRVsGiIE2A2Hrr02py+ROHoTMA7IUBO83wrg+en2uQY950QzK8hmmAar97FuVInYyHDqmVufcCzA5lpxlAFs3gAQOcpicKeXqk6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by IA1PR11MB6538.namprd11.prod.outlook.com (2603:10b6:208:3a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 26 May
 2026 13:40:15 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%3]) with mapi id 15.21.0071.010; Tue, 26 May 2026
 13:40:15 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Karas, Krzysztof" <krzysztof.karas@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [i-g-t,v2,2/4] runner: Create attachments directory to use by
 hooks
Thread-Topic: [i-g-t,v2,2/4] runner: Create attachments directory to use by
 hooks
Thread-Index: AQHc7Q0VblgvnAUJaEmUw68zbDSB3rYgUEGA
Date: Tue, 26 May 2026 13:40:15 +0000
Message-ID: <5612e3f14e3a04d4da07716e5fda8bb757bc725d.camel@intel.com>
References: <20260423105514.175870-8-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260423105514.175870-8-zbigniew.kempczynski@intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|IA1PR11MB6538:EE_
x-ms-office365-filtering-correlation-id: b57b4dd4-46f6-4a5c-1076-08debb2c517a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|6133799003|3023799007|56012099003|22082099003|18002099003|5023799004|11063799006;
x-microsoft-antispam-message-info: vUusiX99ieXmhMrxzCSHPMyhlHHZJ/Fs/O/geNJGrmxaPDg/akywUlU4CO9xAQcWHG6DDREeRE9K3yivFCUtWrISNZjb3tb0mLL+pPc9oy/D4TJZocSKf8Pu88FHHMqKy/TTyde86vs/X80e42DkDLQ70BamunwcHdSv3GULxLtNgYHornzZNWGit0iP6WItakznhuDKmy8Ur/tE/aglo3eoUGatc4WdaaNPmKOE5fETPufEshMQedhsf9EeqBM6m6X0Q6Kby+BySxRLy76u7l2TR/y3QfPJq6o2ObGD0zFzlVa+AwHSBrKh4FdS8wZqoPttUJA+giIPvPnND9W6E8KstkYXr+OC5mjHh5rV+0gB2a+V8GGa9TEP3N7lbVLfhAFcBWJvWc/iwuMeJgrTI6XU895a272lJdTDFVHxJvToQKGbjv453IC/eNO3fbtHe5T8KBbaBryapCmFCE07pCasVuZbmQeVlBr7GKjLLOqYCsXdX07VEvu0e7N7vn7dukJVwRH/fFRBHEFSCvWIxuvBSzhTskemxSg6bNUoR1EWsvBSpAZLR+IeDhoY9MWewgeuNOSpLkfTEyfhqkyewvfS6FPY+t88Z7hDzVBoAnIVzYBRO6Cgph9JoA1IXUfAtpBqM4nzkWMwPr486AKajNz0gdWlLRsWpLa4HUeEW5yRjIZSfVxEn1jZsZF9YK7VNxYENgC+cqf2/qPNjtHfvkJ0fdTw/PFGc1p3DQvs7ldKlWwID7LkZn7f4IT9uqe2
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5663.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(6133799003)(3023799007)(56012099003)(22082099003)(18002099003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkR3dUduZU5hMnNxNk91TWVLa1lCWEpRcVY1eDF6UVFWc0hyRW9KWjVLbk1p?=
 =?utf-8?B?L3ppZWpQSHkyNGpFL0ZJbHFPelpkU1RlN1lCNzgwLzRQTVBwZk5HaVkrWStH?=
 =?utf-8?B?WHZCdmJpSm1YanprRUZ4K1NNblJqMlRPcldjYVlzQzNFTUFVa3FiK25DWGJI?=
 =?utf-8?B?d3BodWxxY0FiRDhSak53UGdPdk85d3Y4ZERLN2JvNVhFQjB2MXdCTVlFVEtN?=
 =?utf-8?B?Y011VVd2VTJWMUQvcHUyUElWVDh1MlZQSW1CSk1QSmZTL0NnOVVMTkc0UnlL?=
 =?utf-8?B?UDV5b0hGRWxrNTU3QUJHSkVTdzU2SnFJVDIyTmI1OXB6ZUFBb0lBWm1HUzZn?=
 =?utf-8?B?VW9VY081RXpJQnFzYWIvVDJYSkV6dDNxWEEzOVdoMDRPVjNzSzkwNHl6QVQy?=
 =?utf-8?B?alpiamU5L1hiYVRDTDFDMk5LSmRZUTRpbWUzWStRYzBEbjhtR3ljZHY2TklT?=
 =?utf-8?B?RXZYUTk3ekxpRjMwTmdya2lvczRJTFBla0d3MkpiVXByd2t5QnFGalZxTnBs?=
 =?utf-8?B?aU9iWEhnemZzYVNXclIrSWlsT2xGSTJwMDhZOWszLzkyOWlQenVBNzFwR244?=
 =?utf-8?B?dmRjR005ZnZjdjNaZUhtQkR5djZxVjA4b0cwSGI4TVlKTnROck8ySDNNcjI4?=
 =?utf-8?B?MFV3ZzE2V3NFQUk0c3NMT0E5NEZSMytSVU9yS2t1K0V4STlMeGpLT3RBRm9q?=
 =?utf-8?B?WUhiNVJnenQ0NTVQV0xJNUo1eUxsNU94bEk2cUZHc2c3UWJLMXhzYnRFcmY3?=
 =?utf-8?B?MlZyV3p2Y01keE5QUEo3elJvNDdZZlJhZFplYVY2ZUlPNGo3eGJPN295NkJE?=
 =?utf-8?B?alBJTVhoTnpZbUlKYTRYR1FoM0VUK0RUdjVkcllSWnVBZlZyaG53WFZ2cWJQ?=
 =?utf-8?B?eXJJb3doZERvdEtJaVZzbzBBQkt3M3Nhek11QXRNVWEvcVVlL1M0RVlONlV6?=
 =?utf-8?B?OXcvRkJDczUzUWFFMVFsTXllMjdEWW1TYk1LcjU2aUxuMkxUYStHeXM4ekkw?=
 =?utf-8?B?UkRQbVlsVVEzVzI4b1NTVmpNNmkyN3MyeGVySjVrRkpLNGYvNjRCNm0xTWor?=
 =?utf-8?B?RG9mZTUxNGJmQk83d0d1SmozODN0bGZHNWlPMEVDblEwNGZGbVJseTh4ZFpD?=
 =?utf-8?B?MHpQZnVxZFVSMjJvUTBkYXV5dHUyUXdpSStXUUlVWWpFNklYTXNpb2tFTkhW?=
 =?utf-8?B?cG1RcVp3dWNZK200YUhoYW4rekdvNHZ0dGFKSHpyTU5qWG9XWVNBT0pGVlNQ?=
 =?utf-8?B?eXRWNHAyNnNWQTJlZHZTOGdjVDhEaHJOM3p5THh6ejREQW9MVnhucWJQdlgz?=
 =?utf-8?B?dDh1MFk1d0xtMTlMM1JXTyt3czl3dlpLTVI4LzJhOVBhY1phdUMrWUswbEpl?=
 =?utf-8?B?TWN5SkF0VHZZNWZtZlZoUTlOTFpQLzA2SnRod01FNnpYZzFmQlU5MjAvQ0hy?=
 =?utf-8?B?c3hHNHJJa1Z2bU8xaXdQWFVyTjRGWCtEaW52T2Y3L1F3QkcyMzd1clZBNExy?=
 =?utf-8?B?U2Y5RWxPNzhVc0xYeUpTRisvTGl2VDdYRG9IdFJDQjVnR3pMYXk3ckJVWUlU?=
 =?utf-8?B?T3JOblp6WjRXRDdYZUgyR2duV3ZrbVBod0RxZVlHckh6QXhkUGdkay9yTnhX?=
 =?utf-8?B?OG1SS0xVR2I4OW9YZE9vNm9WWUNjcW5CYWZ3SzluSmdoN1k0RWZPak51U0ZO?=
 =?utf-8?B?T0p5cVlpbUFTNmVRdnhCUlpZaFZBWS9Eb0k3SFU4dGdWOTR5TGlzbHpoMjIz?=
 =?utf-8?B?OERDUVNHVkd0VVE5YncyaFBPcGk1VCtGRE1venp0amg5MVkvZktCOGRmVzZ3?=
 =?utf-8?B?bk1PV2hBaGRlRFBTZGxKWmxnem5tb1BVNnlCQUVjYXFFNzY5Qy8vYnJ1Uk5s?=
 =?utf-8?B?T2k5eUF2ZE43NlVPSUtyQ1UrY2dpMnYxZTBVbWRWYThrRmpSeGNManVJcWl4?=
 =?utf-8?B?UXNWVjdVTWZHcDU5MmFjb09NbVJwWHFxWXhSZ0lmTUVkLzczNjVLQUhVeVRT?=
 =?utf-8?B?T2Rtd3B4aUZhc1JxV28yU0RaRy9CTEIycWdDbDJQZmZtcnRFYkxUUmpOZGNS?=
 =?utf-8?B?ODlhQzJ1eWcyOUtKdTFQUGlLbVIrY3NiS2dMWFJaVUQ0b0lFblpQMGdpZENV?=
 =?utf-8?B?WVM1d0QxN3JraEE1RkhaeUNYRStNS2Q1b1BsanAvNzVFYitPSzdHZy93QWRN?=
 =?utf-8?B?NTNJaERPZkFCcjdJeHl3bjIwVVNxbkRlSGdFNXp1bC9OV3A3ODExQXNxbDY3?=
 =?utf-8?B?WDBuaFg0VTRqWUlyY2NiUUVRZnkvcHBrODdpNEJDekE3WGNQaHFJZWI0OWs1?=
 =?utf-8?B?bzByUW1VQU9KS3VxMTRpZ1NNSHJ4ZTNiNjNPVTl0QzJOeTFSNDc5djNyTjlO?=
 =?utf-8?Q?Esw7ZtRyCoT8kfVo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D97F66B4CEDE3A4BB63BE104041D804B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qwfA+pCvFKmqtn4Mv3z/ljzt3cTGHzbEMHwU8rqOKqfE8vOI0CBS+es5+sHHBoIJTJY5dElRz6IKjvIHTCDsKpYHRKI41O63yR5wyPnpsesYFVk001LCPUTYmA2vzt1cP7zfyuI2onFsfZPA/H9rYVQ2h7d/MaLoirFoMRlDqY3xRHkAt4ajWrmRnMSyBU9TFgmSfjiD1jU0nI+XKHbBBKp15DLoOwzj4DuVW+wDk8Kt+RFjCPYKZjD3BU5oFkqWJ9O77VqPoOlrf2lOkdstPeKxKUGLkpLGhqYBZQz8aDGx2fwnAQpUwIXFM0wo2KnAv6GfMCAFB9wGZDFMcRNHNA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b57b4dd4-46f6-4a5c-1076-08debb2c517a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 13:40:15.2897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BVVqBl4JMRrIdMM2L9KH/Odn74c6Wl9g2EtPZdaGf0cRMnSEmEZX+2Mn0kywHh7RBLTmWNiTS0P0+QHUvjl8vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6538
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

VHdvIG1pbm9yIG5pdHBpY2tzLCBidXQgb3RoZXIgdGhhbiB0aGF0Og0KDQpSZXZpZXdlZC1ieTog
UnlzemFyZCBLbm9wIDxyeXN6YXJkLmtub3BAaW50ZWwuY29tPg0KDQpPbiBUaHUsIDIwMjYtMDQt
MjMgYXQgMTI6NTUgKzAyMDAsIFpiaWduaWV3IEtlbXBjennFhHNraSB3cm90ZToNCj4gUmVzdWx0
cyBwYXJzaW5nIGlzIGN1cnJlbnRseSBsaW1pdGVkIHRvIGZldyBwcmVkZWZpbmVkIGZpbGVzLg0K
PiANCj4gQ3JlYXRlICJhdHRhY2htZW50cyIgZGlyZWN0b3J5IGFuZCBleHBvcnQgZnVsbCBwYXRo
IG9mIGNyZWF0ZWQgZGlyZWN0b3J5DQo+IHRvIGJlIHVzZWQgd2l0aGluIGhvb2tzLiBGcm9tIG5v
dyBvbiBlbnZpcm9ubWVudCB2YXJpYWJsZQ0KPiBJR1RfUlVOTkVSX0FUVEFDSE1FTlRTX0RJUiBi
ZWNvbWUgdmlzaWJsZSB3aGVuIGlndF9ydW5uZXIgaXMgdXNlZA0KPiB0byBleGVjdXRlIHRlc3Rz
LiBUaGlzIGVudiBjb250YWlucyBkaXJlY3Rvcnkgd2hlcmUgc3VidGVzdHMvZHluc3VidGVzdHMN
Cj4gbWF5IHdyaXRlIGF1eGlsaWFyeSBmaWxlcyB3aGljaCBmaWxlbmFtZXMgd2lsbCBiZSBpbmNs
dWRlZCBpbiByZXN1bHRzLmpzb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1w
Y3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4NCj4gQ2M6IEthbWlsIEtv
bmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IFJ5c3phcmQg
S25vcCA8cnlzemFyZC5rbm9wQGludGVsLmNvbT4NCj4gQ2M6IEtyenlzenRvZiBLYXJhcyA8a3J6
eXN6dG9mLmthcmFzQGludGVsLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLYXJhcyA8
a3J6eXN6dG9mLmthcmFzQGludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIvaWd0X2hvb2suYyAgICB8
ICA0ICsrKw0KPiAgcnVubmVyL2V4ZWN1dG9yLmMgfCA3NiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLQ0KPiAgcnVubmVyL2V4ZWN1dG9yLmggfCAgMiArKw0K
PiAgMyBmaWxlcyBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2hvb2suYyBiL2xpYi9pZ3RfaG9vay5jDQo+IGluZGV4
IGY4NmVkNTZmNzIuLmI4ZjI1YjZjN2EgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3RfaG9vay5jDQo+
ICsrKyBiL2xpYi9pZ3RfaG9vay5jDQo+IEBAIC01MTgsNSArNTE4LDkgQEAgYXZhaWxhYmxlIHRv
IHRoZSBjb21tYW5kOlxuXA0KPiAgXG5cDQo+ICBOb3RlIHRoYXQgJXMgY2FuIGJlIHBhc3NlZCBt
dWx0aXBsZSB0aW1lcy4gRWFjaCBkZXNjcmlwdG9yIGlzIGV2YWx1YXRlZCBpbiB0dXJuXG5cDQo+
ICB3aGVuIG1hdGNoaW5nIGV2ZW50cyBhbmQgcnVubmluZyBob29rIGNvbW1hbmRzLlxuXA0KPiAr
XG5cDQo+ICtXaGVuIGV4ZWN1dGVkIGJ5IHRoZSBpZ3RfcnVubmVyLCBlbnZpcm9ubWVudCBJR1Rf
UlVOTkVSX0FUVEFDSE1FTlRTX0RJUlxuXA0KPiAraXMgcGFzc2VkIGFkZGl0aW9uYWxseSB0byB0
aGUgaG9vayBzY3JpcHQuIEl0IGNvbnRhaW5zIGRpcmVjdG9yeSB3aGVyZVxuXA0KPiArc2NyaXB0
IG1heSB3cml0ZSBhZGRpdGlvbmFsIGF0dGFjaG1lbnRzIGxpa2UgZ3VjIGxvZ3MsIGV0Yy5cblwN
Cj4gICIsIG9wdGlvbl9uYW1lKTsNCj4gIH0NCj4gZGlmZiAtLWdpdCBhL3J1bm5lci9leGVjdXRv
ci5jIGIvcnVubmVyL2V4ZWN1dG9yLmMNCj4gaW5kZXggMTQ4NWI1OWQxZi4uYTg5MDdjNTc1YSAx
MDA2NDQNCj4gLS0tIGEvcnVubmVyL2V4ZWN1dG9yLmMNCj4gKysrIGIvcnVubmVyL2V4ZWN1dG9y
LmMNCj4gQEAgLTEsNiArMSw3IEBADQo+ICAjaW5jbHVkZSA8Y3R5cGUuaD4NCj4gICNpbmNsdWRl
IDxlcnJuby5oPg0KPiAgI2luY2x1ZGUgPGZjbnRsLmg+DQo+ICsjaW5jbHVkZSA8ZnR3Lmg+DQo+
ICAjaWZkZWYgQU5EUk9JRA0KPiAgI2luY2x1ZGUgImFuZHJvaWQvZ2xpYi5oIg0KPiAgI2Vsc2UN
Cj4gQEAgLTE3NzksMTcgKzE3ODAsMjIgQEAgc3RhdGljIGludCBleGVjdXRlX25leHRfZW50cnko
c3RydWN0IGV4ZWN1dGVfc3RhdGUgKnN0YXRlLA0KPiAgCWludCBlcnJwaXBlWzJdID0geyAtMSwg
LTEgfTsNCj4gIAlpbnQgc29ja2V0WzJdID0geyAtMSwgLTEgfTsNCj4gIAlpbnQgb3V0ZmQsIGVy
cmZkLCBzb2NrZXRmZDsNCj4gLQljaGFyIG5hbWVbMzJdOw0KPiArCWNoYXIgbmFtZVszMl0sIGF0
dG5hbWVbMzJdOw0KPiArCWNoYXIgYXR0ZGlybmFtZVtQQVRIX01BWF07DQo+ICAJcGlkX3QgY2hp
bGQ7DQo+ICAJaW50IHJlc3VsdDsNCj4gIAlzaXplX3QgaWR4ID0gc3RhdGUtPm5leHQ7DQo+ICAN
Cj4gIAlzbnByaW50ZihuYW1lLCBzaXplb2YobmFtZSksICIlemQiLCBpZHgpOw0KPiArCXNucHJp
bnRmKGF0dG5hbWUsIHNpemVvZihhdHRuYW1lKSwgIiV6ZC8lcyIsIGlkeCwgRElSX0FUVEFDSE1F
TlRTKTsNCj4gIAlta2RpcmF0KHJlc2RpcmZkLCBuYW1lLCAwNzc3KTsNCj4gKwlta2RpcmF0KHJl
c2RpcmZkLCBhdHRuYW1lLCAwNzc3KTsNCj4gIAlpZiAoKGlkaXJmZCA9IG9wZW5hdChyZXNkaXJm
ZCwgbmFtZSwgT19ESVJFQ1RPUlkgfCBPX1JET05MWSB8IE9fQ0xPRVhFQykpIDwgMCkgew0KPiAg
CQllcnJmKCJFcnJvciBhY2Nlc3NpbmcgaW5kaXZpZHVhbCB0ZXN0IHJlc3VsdCBkaXJlY3Rvcnlc
biIpOw0KPiAgCQlyZXR1cm4gLTE7DQo+ICAJfQ0KPiArCXNucHJpbnRmKGF0dGRpcm5hbWUsIHNp
emVvZihhdHRkaXJuYW1lKSwgIiVzLyVzIiwNCj4gKwkJIHNldHRpbmdzLT5yZXN1bHRzX3BhdGgs
IGF0dG5hbWUpOw0KPiAgDQo+ICAJaWYgKCFvcGVuX291dHB1dF9maWxlcyhpZGlyZmQsIG91dHB1
dHMsIHRydWUpKSB7DQo+ICAJCWVycmYoIkVycm9yIG9wZW5pbmcgb3V0cHV0IGZpbGVzXG4iKTsN
Cj4gQEAgLTE4NzAsNiArMTg3Niw3IEBAIHN0YXRpYyBpbnQgZXhlY3V0ZV9uZXh0X2VudHJ5KHN0
cnVjdCBleGVjdXRlX3N0YXRlICpzdGF0ZSwNCj4gIAkJCXNldGVudigiSUdUX1JVTk5FUl9TT0NL
RVRfRkQiLCBlbnZzdHJpbmcsIDEpOw0KPiAgCQl9DQo+ICAJCXNldGVudigiSUdUX1NFTlRJTkVM
X09OX1NUREVSUiIsICIxIiwgMSk7DQo+ICsJCXNldGVudigiSUdUX1JVTk5FUl9BVFRBQ0hNRU5U
U19ESVIiLCBhdHRkaXJuYW1lLCAxKTsNCj4gIA0KPiAgCQlleGVjdXRlX3Rlc3RfcHJvY2Vzcyhv
dXRmZCwgZXJyZmQsIHNvY2tldGZkLCBzZXR0aW5ncywgZW50cnkpOw0KPiAgCQkvKiB1bnJlYWNo
YWJsZSAqLw0KPiBAQCAtMTk0OCwxOSArMTk1NSw2NiBAQCBzdGF0aWMgaW50IHJlbW92ZV9maWxl
KGludCBkaXJmZCwgY29uc3QgY2hhciAqbmFtZSkNCj4gIAlyZXR1cm4gdW5saW5rYXQoZGlyZmQs
IG5hbWUsIDApICYmIGVycm5vICE9IEVOT0VOVDsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIGJvb2wg
Y2xlYXJfdGVzdF9yZXN1bHRfZGlyZWN0b3J5KGludCBkaXJmZCkNCj4gK3N0YXRpYyBpbnQgZnR3
X2F0dGFjaG1lbnRfcmVtb3ZhbChjb25zdCBjaGFyICpmcGF0aCwgY29uc3Qgc3RydWN0IHN0YXQg
KnNiLA0KPiArCQkJCSAgaW50IHR5cGVmbGFnLCBzdHJ1Y3QgRlRXICpmdHdidWYpDQo+ICB7DQo+
IC0JaW50IGk7DQo+ICsJKHZvaWQpc2I7DQo+ICsJKHZvaWQpZnR3YnVmOw0KPiArDQo+ICsJc3dp
dGNoICh0eXBlZmxhZykgew0KPiArCWNhc2UgRlRXX0Y6DQo+ICsJY2FzZSBGVFdfU0w6DQoNClNp
bmNlIEZUV19QSFlTIGlzIHNldCBpbiBuZnR3LCBGVFdfU0xOIGNhbiBoYXBwZW4gYW5kIGlzIG1p
c3NpbmcgaGVyZS4NCklNTyBpdCdzIGp1c3QgdGhlIHNhbWUgdW5saW5rLg0KDQo+ICsJCWlmICh1
bmxpbmsoZnBhdGgpKSB7DQo+ICsJCQllcnJmKCJFcnJvciByZW1vdmluZyBmaWxlICVzOiAlc1xu
IiwNCj4gKwkJCSAgICAgZnBhdGgsIHN0cmVycm9yKGVycm5vKSk7DQo+ICsJCQlyZXR1cm4gLTE7
DQo+ICsJCX0NCj4gKwkJYnJlYWs7DQo+ICsJY2FzZSBGVFdfRFA6DQo+ICsJCWlmIChybWRpcihm
cGF0aCkpIHsNCj4gKwkJCWVycmYoIkVycm9yIHJlbW92aW5nIGRpcmVjdG9yeSAlczogJXNcbiIs
DQo+ICsJCQkgICAgIGZwYXRoLCBzdHJlcnJvcihlcnJubykpOw0KPiArCQkJcmV0dXJuIC0xOw0K
PiArCQl9DQo+ICsJCWJyZWFrOw0KPiArCWRlZmF1bHQ6DQo+ICsJCWVycmYoIkNhbm5vdCByZW1v
dmUgJXMgKHVuc3VwcG9ydGVkIGZpbGUgdHlwZSlcbiIsIGZwYXRoKTsNCj4gKwkJcmV0dXJuIC0x
Ow0KPiArCX0NCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgYm9vbCBj
bGVhcl90ZXN0X3Jlc3VsdF9kaXJlY3RvcnkoY29uc3QgY2hhciAqbmFtZSkNCj4gK3sNCj4gKwlj
aGFyICphdHRkaXJuYW1lOw0KPiArCWludCBpLCByZXNkaXJmZDsNCj4gKwlpbnQgcmV0Ow0KPiAr
DQo+ICsJaWYgKChyZXNkaXJmZCA9IG9wZW4obmFtZSwgT19ESVJFQ1RPUlkgfCBPX1JET05MWSkp
IDwgMCkNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiAgDQo+ICAJZm9yIChpID0gMDsgaSA8IF9GX0xB
U1Q7IGkrKykgew0KPiAtCQlpZiAocmVtb3ZlX2ZpbGUoZGlyZmQsIGZpbGVuYW1lc1tpXSkpIHsN
Cj4gKwkJaWYgKHJlbW92ZV9maWxlKHJlc2RpcmZkLCBmaWxlbmFtZXNbaV0pKSB7DQo+ICAJCQll
cnJmKCJFcnJvciBkZWxldGluZyAlcyBmcm9tIHRlc3QgcmVzdWx0IGRpcmVjdG9yeTogJW1cbiIs
DQo+ICAJCQkgICAgIGZpbGVuYW1lc1tpXSk7DQo+ICsJCQljbG9zZShyZXNkaXJmZCk7DQo+ICAJ
CQlyZXR1cm4gZmFsc2U7DQo+ICAJCX0NCj4gIAl9DQo+ICANCj4gLQlyZXR1cm4gdHJ1ZTsNCj4g
KwljbG9zZShyZXNkaXJmZCk7DQo+ICsNCj4gKwlpZiAoc3RybGVuKG5hbWUpICsgc3RybGVuKERJ
Ul9BVFRBQ0hNRU5UUykgKyAxID49IFBBVEhfTUFYKSB7DQo+ICsJCWVycmYoIkF0dGFjaG1lbnRz
IGRpcmVjdG9yeSBsZW5ndGggZXhjZWVkcyBQQVRIX01BWFxuIik7DQo+ICsJCXJldHVybiBmYWxz
ZTsNCj4gKwl9DQo+ICsNCj4gKwlhc3ByaW50ZigmYXR0ZGlybmFtZSwgIiVzLyVzIiwgbmFtZSwg
RElSX0FUVEFDSE1FTlRTKTsNCj4gKwlyZXQgPSBuZnR3KGF0dGRpcm5hbWUsIGZ0d19hdHRhY2ht
ZW50X3JlbW92YWwsIDQsIEZUV19QSFlTIHwgRlRXX0RFUFRIKTsNCj4gKwlmcmVlKGF0dGRpcm5h
bWUpOw0KPiArDQo+ICsJcmV0dXJuIHJldCA/IGZhbHNlIDogdHJ1ZTsNCj4gIH0NCj4gIA0KPiAg
c3RhdGljIGJvb2wgY2xlYXJfb2xkX3Jlc3VsdHMoY2hhciAqcGF0aCkNCj4gQEAgLTE5OTEsMTkg
KzIwNDUsMTcgQEAgc3RhdGljIGJvb2wgY2xlYXJfb2xkX3Jlc3VsdHMoY2hhciAqcGF0aCkNCj4g
IAl9DQo+ICANCj4gIAlmb3IgKGkgPSAwOyB0cnVlOyBpKyspIHsNCj4gLQkJaW50IHJlc2RpcmZk
Ow0KPiArCQlzdHJ1Y3Qgc3RhdCBzdDsNCj4gIA0KPiAtCQlzbnByaW50ZihuYW1lLCBzaXplb2Yo
bmFtZSksICIlemQiLCBpKTsNCj4gLQkJaWYgKChyZXNkaXJmZCA9IG9wZW5hdChkaXJmZCwgbmFt
ZSwgT19ESVJFQ1RPUlkgfCBPX1JET05MWSkpIDwgMCkNCj4gKwkJc25wcmludGYobmFtZSwgc2l6
ZW9mKG5hbWUpLCAiJXMvJXpkIiwgcGF0aCwgaSk7DQo+ICsJCWlmIChzdGF0KG5hbWUsICZzdCkp
DQo+ICAJCQlicmVhazsNCj4gIA0KPiAtCQlpZiAoIWNsZWFyX3Rlc3RfcmVzdWx0X2RpcmVjdG9y
eShyZXNkaXJmZCkpIHsNCj4gLQkJCWNsb3NlKHJlc2RpcmZkKTsNCj4gKwkJaWYgKCFjbGVhcl90
ZXN0X3Jlc3VsdF9kaXJlY3RvcnkobmFtZSkpIHsNCj4gIAkJCWNsb3NlKGRpcmZkKTsNCj4gIAkJ
CXJldHVybiBmYWxzZTsNCj4gIAkJfQ0KPiAtCQljbG9zZShyZXNkaXJmZCk7DQo+IC0JCWlmICh1
bmxpbmthdChkaXJmZCwgbmFtZSwgQVRfUkVNT1ZFRElSKSkgew0KPiArCQlpZiAocm1kaXIobmFt
ZSkpIHsNCj4gIAkJCWVycmYoIldhcm5pbmc6IFJlc3VsdCBkaXJlY3RvcnkgJXMgY29udGFpbnMg
ZXh0cmEgZmlsZXNcbiIsDQo+ICAJCQkgICAgIG5hbWUpOw0KPiAgCQl9DQoNCkknbSBub3Qgc3Vy
ZSBob3cgbXVjaCB3ZSBjYXJlIGFib3V0IGV4dHJhIGZpbGVzIGxlZnQgaW4gdGhlIGRpciwgb3Ig
aWYNCml0J2QgYmUgYmV0dGVyIHRvIGp1c3QgbnVrZSB0aGUgd2hvbGUgcmVzZGlyIHdpdGggYSBz
aW5nbGUgdHJlZSB3YWxrLg0KKFRoZSBwcm9wb3NlZCBjb2RlIGlzIGZpbmUsIGl0J3MganVzdCBh
IGxvdCBvZiBjb2RlLikNCg0KPiBkaWZmIC0tZ2l0IGEvcnVubmVyL2V4ZWN1dG9yLmggYi9ydW5u
ZXIvZXhlY3V0b3IuaA0KPiBpbmRleCAzYjFjYWJjZjU1Li5iYzZhYzgwZGM0IDEwMDY0NA0KPiAt
LS0gYS9ydW5uZXIvZXhlY3V0b3IuaA0KPiArKysgYi9ydW5uZXIvZXhlY3V0b3IuaA0KPiBAQCAt
MjUsNiArMjUsOCBAQCBlbnVtIHsNCj4gIAlfRl9MQVNULA0KPiAgfTsNCj4gIA0KPiArI2RlZmlu
ZSBESVJfQVRUQUNITUVOVFMgImF0dGFjaG1lbnRzIg0KPiArDQo+ICBib29sIG9wZW5fb3V0cHV0
X2ZpbGVzKGludCBkaXJmZCwgaW50ICpmZHMsIGJvb2wgd3JpdGUpOw0KPiAgYm9vbCBvcGVuX291
dHB1dF9maWxlc19yZG9ubHkoaW50IGRpcmZkLCBpbnQgKmZkcyk7DQo+ICB2b2lkIGNsb3NlX291
dHB1dHMoaW50ICpmZHMpOw0K
