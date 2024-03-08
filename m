Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39C8C54E5C
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 11:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8798C113881;
	Fri,  8 Mar 2024 11:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E3YgK9Y8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620E9113881
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 11:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709898469; x=1741434469;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7CJWs1sTl6Zu36IqGJVW1Zfll/zCurJ/fSrbJxXYmHc=;
 b=E3YgK9Y8Sa6s3utePIGvLQb6Wzj6BK8YDFbzPPuCGhDE0YfODlSNWf2H
 I/lbVbIZYa/Sx57wRkVdUVz7pL+n3IAHdefXea6T/6+7UYgR+5v2VPLoe
 6SmeIA/hFbG94Cbmujpzo3vi55KPo+pEpQyk5+YMBv5oRVLnGEipdMBOb
 5LOjqMiOrgtFx25/w41SxboIFLpZ615TnqBuvevmrhRIicJmMOPMCldIg
 Wor7YPv8wSz61UqnZBV3Ow2+lFnv0NEWjkUSf3HpI628XXuLpwpa7xePe
 u5p3c5G+4sEPaVo1H+6w3XewQ5DXlGq3Z/S/xR9GVx9mTWXsBqlDzw0hZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4492837"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4492837"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 03:47:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="10988387"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Mar 2024 03:47:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 03:47:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 03:47:46 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 03:47:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghxGlQ6TryDV27OvxossjNX3PF8UlPS+w6M2qYLNJYq2YXqt7K24LWf4O4Gjzb4bjxBhSJUPS8B1rloq7nVA4zebQX38D5rcybeFXmn7TMY+PUwyYs2OLaLCIgNZmbV9N1GPHxHV+0XurdrpDMywxK+CNQGfe/Xy64kJ9dPEpFO4WviIiVyO0UiBQh3KFsbo72bnt/Ltor4B1Zemgc8zeZ0tPuyMFmyw+TDBtJFmUwAYut0yME9MZMF0Ad1Yttqso7msk0iNx7tNTcmHQOa45qaxUe/e4ajEapVZ+5TEW83YCmNikQ9h3laOyfL9TaHYTXc07TfUHFV6hITt85wyOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CJWs1sTl6Zu36IqGJVW1Zfll/zCurJ/fSrbJxXYmHc=;
 b=CTwJv/tHwRPepjUYv3mpeOvxFRrcoRNNWfNWbEZ/nxxxlt0Ba4DGSCP3OQuBCZKMturfgYZGXxZEr8TwMky/lvFX10xe40OG7dYObP4bO69tfhsVjYK3pn+MESFA9NyS7dtN2lF96p+usTL88bRESmDn2sPm8IlhAkw8mVM9sEDY3lgkF4q6jKbaiXy1Oex4k2QTVF+Rf3kah4kbFVtkR8Bs4JwXU2oW+zytV474l4mshQpu9E3ABZX5/j+ZWHspfqH5+QcFCiEcvW0DZkQNjsxlfM6LehfZxq+c2bHTvKOLiBBJxIJy78jhFLN+tGtrN1uAffL+kMvvAy1ICr8RHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by LV3PR11MB8728.namprd11.prod.outlook.com (2603:10b6:408:218::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.6; Fri, 8 Mar
 2024 11:47:44 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7362.019; Fri, 8 Mar 2024
 11:47:44 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/3] scripts/xls_to_doc.py: make the script work
 again
Thread-Topic: [PATCH i-g-t 1/3] scripts/xls_to_doc.py: make the script work
 again
Thread-Index: AQHacUDD5kazfTjM406+8JlOIQewsrEtuj9Q
Date: Fri, 8 Mar 2024 11:47:44 +0000
Message-ID: <IA1PR11MB6097DE69E514F933381F96D786272@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240308100933.912014-1-mauro.chehab@linux.intel.com>
 <20240308100933.912014-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20240308100933.912014-2-mauro.chehab@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|LV3PR11MB8728:EE_
x-ms-office365-filtering-correlation-id: ed53adea-2c22-4394-dd30-08dc3f6591b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S59L0qdXebNqDDCNh5Rq9zSfHFUJXrdGHjFzrM0XCL3DAe9j6YPrJI1R9SR7fnth/XTAMTGNRnJB29d17C/XI3idmXf7VMiMuq7wvYH11ra9LuwNSe7kjBw2cO30uDQvwUfj35uCm2HolJhXrg3tcP34ciqoMagdAyqwh0Hqv/dsnE7I5mdjZPnSLHJxammKtNU1F/hZdKFEm7nPoRgydiEuMpVdXQaeo/NTiJUjEzmuSvEWimKP6o5EOReJTjmmq2MKLmAnwHF6KESC0pPXJNE6qLKuqHJlq79yCDYJTzjOnlqr+8HoNx/9C6YuoX7tRpKOTIvHv57SSjS84zuxjiP5CIslHltf+bsgGvU1Pyq4fJ0wdKjFxHUvnyXYR2RSADseYlv9YDXEh6D9jSP+X6Y4hFp3Fy9aKvJu/M+61k8OOMdRTZ1MZ9SFpygbjcr5LNOgYp1A/lG9nK8GeFJsejE6K8MGEIXQcovhARLag2eF0Vtn02O8Ckh4YNWZpix0isIuJRacUyuSgjDMz7Goi/Gm4mhzm+YHkAjHzWBxuH0INnhMpWtt9ktKPtwJQ1esUkyHciuaPpBAYEE4lAHloI/7FGJttm+JSW84ZSKtb4FC3EqEN9q/lZcckpOsSO5Dz6bAR2IhbuDnHLsFLTMklOJXxDciXH7DENVlbQn2AGNCfrtjpiqp6lHpRgJFrw3jyk7DfpBmTe89WikE6KKAXDkHpc8LwGes58XMq0Xs174=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEVFcXFRMlBveDc1em9vTDRBZ2lWam8rUTFBaDNPcjNxeURZYVZrSXJGM3Jn?=
 =?utf-8?B?cm13RjJRWTZoQkdDamord1dEVEdTN3NMT2VoN3RCSGlZUTdjMEZSbEV5T0RT?=
 =?utf-8?B?ZGFIbFZ5anRMWnlUSm5WOFp1N3U1enNESkhzSWNUOFZueWdRUjdzOC9od1E2?=
 =?utf-8?B?dmFnQUhWZndXTlVkaEM5M3dGUWxibHQ3cTQyQ1Fmd0hjUkE1djlRT0k5VzlY?=
 =?utf-8?B?Z0FQVEtTWEtDbERiVVBYcncyUzk2SC94V0JCa3ZKTzdwdDlVTDRGTFdtQ0Vh?=
 =?utf-8?B?TkhHUGF1clVPZW1pSWJBNHFGVEJwQ0pVOHNZRmp3RERHMWJrcWpqWFVneFhn?=
 =?utf-8?B?QnVZRDFURlFsU1JqNkQ2NXdsZERYODNsbzdiVHovZVV5WXVjYWV2SFp2cytR?=
 =?utf-8?B?TWh1VU9wMXZOS2pzWU54VGdZNWx1NHpCbUJ1OEJoSDdsUnVQZjRmZkh2dDlW?=
 =?utf-8?B?MmtzZE82QjhHSmw1NG5XayttRHljdTluR2tqNEk5ZXJObWxDYlAxdkF0Mi9W?=
 =?utf-8?B?a1VTd2Q0S1ZKc0lySmp1eHJmeE9lRFo1MjlPR0dpZHUzczhVVXZNMEt1Ynov?=
 =?utf-8?B?ckREdmJhUjVKNFlWdi9TN3JrUCtSMHoza0ZiR2piZXM1YTJOZVNsVkJMb2Vl?=
 =?utf-8?B?UTZZU0RxbG5iVGgyVGFPbVltYnRtSytKazkwWGhEZU4xY0RwTm5zTS9LUTNi?=
 =?utf-8?B?U2phaDVKNTNGSlllRldERFI0MUlDcTlYeTV0YmJ5TVFCd2dtbzhSLzdLVzRh?=
 =?utf-8?B?dWdSMENTZ04wZDZaOWJ2OFZMOTJsQTB4NmxKbHZQWlBpbFlVdG5oSUZjTzBv?=
 =?utf-8?B?UVV0ckxRY1JCTlVOQXEyWEtHQTUzODMvZy9pQmdpK3ZDOWFtK3NvZjRZYlo5?=
 =?utf-8?B?WDZsWlhDbVp1RUgvSHkyTjNpTjlqVm51MVZtTlV3aTAyY25XemErdzl3aHJl?=
 =?utf-8?B?b1l5UmNXOVlQaWgzYk9mMHFOaFhkNGJidko1VC9ROXpiYWFleXJqOGhZM1p2?=
 =?utf-8?B?UWNzUi9IU0MyVkFYSEpNYU1DeHg4WkZMY3VjN0xkelViaFpQZDRJWXlUSGVz?=
 =?utf-8?B?aTU0dGZFeUhQT1MrOFhxZUQ2WDYzNThVcXp2QXp0MzhiWXkxdzJGSlYvMEcv?=
 =?utf-8?B?TE5LTjAzZnh4ajZjb0RPcnA4SFdidHdhYmVObnhCTXozdmdVbzZqZFNqVENj?=
 =?utf-8?B?bU1RcitPRmhGZVVlU0VhNHBrTGo2Y3VxU0l5ck9IQkt4REptZmc0TUJaMkV2?=
 =?utf-8?B?NFR0ZWdWUURQTEFnZy8zYlIzZzZrRm9paVpRQUpiemw4NnN0N3ZWZWVOdGQz?=
 =?utf-8?B?Y2QrQzkwcUhMeXJadUpiTGx6bVRzVUh0b201aEJpalJ0QnpmQmVuZTlLOUp1?=
 =?utf-8?B?bSt0bGVtSVh6TjVpRWYxQ3BhTktTblcyT0RuNG9LUUdSbHJVdkg4QjFST1Iz?=
 =?utf-8?B?cjJDM0lFK3lYRkRhQWFtZUlmRWMrOURCZVpRV0ZIcXNXZEl4bW1HZHdndmhZ?=
 =?utf-8?B?SnF5c3VHSVJMOGZoMk05UzlSNkE0ZWVVZmdhSzZWbHpDMFhkWnRhSXNZQWxl?=
 =?utf-8?B?SWpqcDVBS2FIVU9od1NWODBYYkNYdERIaUY1dm9aT2gxL1BpK2U3MU5qc0JD?=
 =?utf-8?B?T05aR2FzQVVYR3JGZlZkcDJVOFBNSm1rTnZObExjVlI2OTN6My9TOUl1M3E1?=
 =?utf-8?B?UldxYnRpZlhrWGxvZTJZb2xZd1p4WE9HbzN6OE5KUVh2UnVuWWIzdVFtUlo5?=
 =?utf-8?B?NW94M0Z6dUNtTHpMaE9kVTJlWnVwRXl6LzlIM0NiaWNKdE1YdUU2VkxRWWN4?=
 =?utf-8?B?ZFVBdUhDUFJYMGo4VllFdldyWkNtOEdKRUpqYnpDNmcyMUNEcXgvOXVvK3pB?=
 =?utf-8?B?LzNqcWp5eEYySENGRTJVQWNaNGh1alRVOHZnczJ5dUFHNGJxd3pmOElFVnNK?=
 =?utf-8?B?Q3Fic1U3RDRnWTBXQVRHVzZ4NDZXdFJBRW9xUWliYnFSYldEWjZVMnp5NzRr?=
 =?utf-8?B?MzdLZ0pIblZHMnN3RnQ3ckVDZk5tNXFxbWZITHREWllaUHlVWjJLM0gzR0Ew?=
 =?utf-8?B?UWVLcUZRRCtlczlITCtkWmxjSVZxYlM5Sjd3eXg3N1VGMEtuRnB4N2twbWRn?=
 =?utf-8?B?TmM2cmsxT0tUWFFNMmkrUHZTTVc2NmdQd1VUSUxZREpodkY5bTRKVncybkZ5?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed53adea-2c22-4394-dd30-08dc3f6591b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2024 11:47:44.8297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 98aAPFCmKrOTm9LdCZYUhIRlx8TEGu9CW9oRLR42XFH+RjWKm9BnVOsGVtvEOQf+tKghf+MBjgDQeDPQd6rdOFPXHL+1cNjDoMjN36OTDp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8728
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

RnJvbTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+DQoNClRoZXJl
IHdlcmUgc29tZSBjaGFuZ2VzIGF0IHRlc3RfbGlzdCB0aGF0IGNhdXNlZCBpdCB0byBzdG9wIHdv
cmtpbmcuIEZpeCB0aGVtLg0KDQpTaWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIg
PG1jaGVoYWJAa2VybmVsLm9yZz4NCltLYXRhcnp5bmFdIA0KTEdUTSDwn5iKDQpBY2tlZC1ieTog
S2F0YXJ6eW5hIFBpZWNpZWxza2EgPGthdGFyenluYS5waWVjaWVsc2thQGludGVsLmNvbT4NCi0t
LQ0KIHNjcmlwdHMveGxzX3RvX2RvYy5weSB8IDUgKysrLS0NCiAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvc2NyaXB0cy94bHNf
dG9fZG9jLnB5IGIvc2NyaXB0cy94bHNfdG9fZG9jLnB5IGluZGV4IGVkNTZhMDJiZjVjYS4uNjBh
ZDgyMjVkNzFkIDEwMDc1NQ0KLS0tIGEvc2NyaXB0cy94bHNfdG9fZG9jLnB5DQorKysgYi9zY3Jp
cHRzL3hsc190b19kb2MucHkNCkBAIC00MCw4ICs0MCw4IEBAIGNsYXNzIEZpbGxUZXN0cyhUZXN0
TGlzdCk6DQogDQogICAgICAgICAgICAgc3VidGVzdF9hcnJheSA9IHNlbGYuZXhwYW5kX3N1YnRl
c3QoZm5hbWUsIG5hbWUsIHRlc3QsIFRydWUsIFRydWUsIFRydWUpDQogICAgICAgICAgICAgZm9y
IHN1YnRlc3RfZGljdCBpbiBzdWJ0ZXN0X2FycmF5Og0KLSAgICAgICAgICAgICAgICBuYW1lID0g
c3VidGVzdF9kaWN0WyJTdW1tYXJ5Il0NCi0gICAgICAgICAgICAgICAgZGVsIHN1YnRlc3RfZGlj
dFsiU3VtbWFyeSJdDQorICAgICAgICAgICAgICAgIG5hbWUgPSBzdWJ0ZXN0X2RpY3RbIl9zdW1t
YXJ5XyJdDQorICAgICAgICAgICAgICAgIGRlbCBzdWJ0ZXN0X2RpY3RbIl9zdW1tYXJ5XyJdDQog
DQogICAgICAgICAgICAgICAgIG1hdGNoID0gc2VsZi50ZXN0bmFtZV9yZWdleC5tYXRjaChuYW1l
KQ0KICAgICAgICAgICAgICAgICBpZiBub3QgbWF0Y2g6DQpAQCAtMjYzLDYgKzI2Myw3IEBAIGNs
YXNzIEZpbGxUZXN0cyhUZXN0TGlzdCk6DQogDQogICAgICAgICAgICAgICAgIGlmIHN1YnRlc3Rf
bnIgbm90IGluIHNlbGYuZG9jW3Rlc3RfbnJdWyJzdWJ0ZXN0Il06DQogICAgICAgICAgICAgICAg
ICAgICBwcmludChmIkVycm9yOiBtaXNzaW5nIHN1YnRlc3Qge3N1YnRlc3RfbnJ9IGF0IHtzZWxm
LmRvY1t0ZXN0X25yXVsnc3VidGVzdCddfSIpDQorICAgICAgICAgICAgICAgICAgICBjb250aW51
ZQ0KIA0KICAgICAgICAgICAgICAgICBkb2NfY29udGVudCA9IHNlbGYuZG9jW3Rlc3RfbnJdWyJz
dWJ0ZXN0Il1bc3VidGVzdF9ucl0NCiANCi0tDQoyLjQzLjINCg0K
