Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8D1C54E64
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 07:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D293710F384;
	Thu, 28 Mar 2024 07:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XkDcmvTB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A944710F384
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 07:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711612391; x=1743148391;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vm3Fu8JnMYpjcEBeZHEVq1AUUYzxyas2DVB7ih8iwFc=;
 b=XkDcmvTBY7gB6MBrIjzTtlwc7glWZTXAUFcGpR1pYOl2ey5vE3O+iWEq
 nJrFuhufOFwLccoHG+VLim5aw+FtY04XHy5INUtPXMJM6n7kZlV1AufvR
 L2hUKEmfsDYSxdZadqReSipZp36L/rPfGWbQPkRhGEZJNknN02XA6sF/S
 5FzWhllKUi8ID2RXx1TEWftMb3q9pvcErgNaQdMwk0AiYetq0+yMvCjDi
 U8ay9Uo/XUCnpu/pyZ/at9upiqQ4ya7yEUirqd+viQpD43rlUbl7XeMop
 +Qt0SJF2lnOg+h1M4hA4k49HZDj50Qak6gCT8Ren8WVEoH/zLZhlySRgj A==;
X-CSE-ConnectionGUID: 119iawVQQaWBs3AO4ZZvuw==
X-CSE-MsgGUID: nx0jjtmkR5C088pFxZISIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="7349703"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="7349703"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 00:53:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="17014484"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 00:53:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 00:53:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 00:53:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 00:53:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 00:53:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMDX77tveW+hqSnz0DaLErSFAZc280fcEIvc+NJFtOKbBOgZO8g2iKWGiSFYxb0belSFkibRcuAUCb0A7kPiS9LmbayHnKr82M72KIHQG3hUQqVHmt2AISA7LlUa3641Kl4HBcosww/Yo7PFEazzddK7rie2pKa37+4iuAYjrNLo7kucpnZjaKgFO+PiJOpcdCp4euy6Nu80sz+JKaADFhrDZno1PfmhMdnd6AP1ZXrBHoCXUnfkF2BZ+QvqDRZmluqpd8Ol0t9eEEKFZ6qAohSrKrlgDUl4+/lx3HS7E9Qpi0CmPjU0CEZJpKQCBWpMDKV2MK8nLSET0QsArJ2IJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vm3Fu8JnMYpjcEBeZHEVq1AUUYzxyas2DVB7ih8iwFc=;
 b=FyCjQv+K70eE5CJQumfjzm43tbnmIrj/C5FiUj3QHBh+BVfW1sjkmDi+WTDWd1XY6AZHQtUMRFJQrl3YfPGRztb0JLhRs5UPqLdbSuO3jqIrH7qvgvjPT6Y9h9W5tBk6YsdI94CHovU0Zcq2LvbtdJ7SqX9LKmWHOSrPKU/qTbmTS0efbabqZCKjxgJ9inzvahZOAfKjNc0sdiJJu70lVX2/KnZGq9Qiw/426bgoZcmFtiIxVi77xkh5Ma6OwxtyC7KDk7o/Lvcpa5yAkBfbDiukgHv0WwSeFiq6e7t//zjv9bjIWA6mmfXQsXduneRAdVpQMUd/WC07WEibfIgnGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by BN9PR11MB5307.namprd11.prod.outlook.com (2603:10b6:408:118::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 07:53:06 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7409.028; Thu, 28 Mar 2024
 07:53:00 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Tahvanainen, Jari" <jari.tahvanainen@intel.com>
Subject: RE: [PATCH i-g-t] scripts/doc-tests-cross-check: check for collisions
Thread-Topic: [PATCH i-g-t] scripts/doc-tests-cross-check: check for collisions
Thread-Index: AQHae6sVODgSUKbpVUKJi2rtmDmrk7FM0lNQ
Date: Thu, 28 Mar 2024 07:53:00 +0000
Message-ID: <IA1PR11MB6097753B57D5AC113D8FD74D863B2@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240321161549.75950-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20240321161549.75950-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|BN9PR11MB5307:EE_
x-ms-office365-filtering-correlation-id: bbe3b99f-0c2d-46a3-051b-08dc4efc1713
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZkmfGBP6SpkstC4eHtU/83wxKRTM75BMMdf9E9wy5SVtrPCxGQdEwQTD/RBsR8t+74zqGGSrSve3w6pFulv7kBD8/2gMvJ1u2xokqFzVwe+b3SbDzse5ljg++t6DcFMGUwBBqujCcUTPPEWjKBKGdKLpqv5+sZW1FomsGhdej28ZwAVRtqT7faw7whoPMkWLV1lWVxkuJbUR5AsU2VoAVtnI8z/YqQVLGCrTbd32XPmOIXYTD4VJ5kjtyDIV3pj2iAi0RXPdcNFZPCDMUo1hixabo5wdQt3uwenjJDnODEQpC7w5+Igl5aq0S2hhZrTfNkMPd/Ykjwob8cKKvcEC/NkQLI4wGR/HlRwpSFaVVD2jaCihHa3P3TQIzPFZXutCBvYp4G8pFmmXY7SX4oLChgo5LLPzBGVVQrvJ9qE7MsxyroYLmiVFZi9G7SVjuzdd3jRyVhxUzgek1oouWvA1APhv1cyj0Q7eiZwnoo2rbqzl0jsZro5L5w1LE0IZOUr8YUKee8513iTUucM46CifIkbRAo8iMjtdfKB31R4v30uQt9Ez33tPZozkzpa/2wyAkcXSfA4J3tHl4AjI/cakdNrwSq2eeTURn0XeGi7ydZc2TChOMYI0auBjVuowp0VPVpPqsyStdeSpXzBX85MAPkoJl3SeuLzor7TR/aFo2LQwTbE0LrRGfsahx5HVtqFPw2y1mmLsz1jYiRWwqpHBD8pXey51rAUn7yhbz3shllg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXNabzV4b0lzd2JTbGlNL051eHVpaE56YjlzUTA0bFU2R1h2aUpKNjVmdjFX?=
 =?utf-8?B?YVRaOFY4bWdEaVB4M3RXSVVXWEt1c2EraWU4SngyUTdPRkNYMjhRMFBtNDNi?=
 =?utf-8?B?QkJJVkphM1NqajNkUEM3bVV5cFpVZEpRK0lIcDM5RGZ2TTJHcEV6eDl0cm11?=
 =?utf-8?B?OU9ST3UwL2hWK3I1Qzh2dzZsY3ZPNEcvejlodVZNTjZiK2ZJRU5hY2pZaDhH?=
 =?utf-8?B?Y2V2VTZzN0NWM0JISU5heHc5SUI1UjZLdFhqWjhRTHhLeFdISXFWbmtvYUwz?=
 =?utf-8?B?QzkwUDJhNnVEcGlFVFpQT2hSQTlvVXc2NzRNaW16NS9MK01ZYjVkVzk0Qllh?=
 =?utf-8?B?RzZ5SnV4QkVXNWhoRVlWdHZYb0NMZ0hEdG1Jd25TQ1JZMzR3bm8ydkpMNGRk?=
 =?utf-8?B?RlpEeEhZMHp5Q24wY3hLczNRd04zUysxbVJXRlNWbnNrWXFRQTFRcGd0eGNY?=
 =?utf-8?B?NjlKM1I5cWxGK0dacytnZ2hCVUd5cEpQeHBKWEVjQis0amZOYUJPSVB6RFRI?=
 =?utf-8?B?YVg5bUhBM2ZQSjREL0ozanJQdXZ5UldOQ1c2Qm5HQjQ2RWhLQnFHZ1JPRG9I?=
 =?utf-8?B?VWF3TkRBS1hRTVFMb1YrMHN2ck9DSFJhTEtOWHpwZFRUWXp1ZWNPT0R1Syt6?=
 =?utf-8?B?cDFsZkJoZno0QVQrajBhR1VFL3NsRUI5SnErTnVlRXNQNjMzdGQxZy9Qc25q?=
 =?utf-8?B?aFBOdkFHajhCS1g1dEVlVitWV2RGUUtXZkpKdXdZZDhqVHF3WUZaTlplRGhn?=
 =?utf-8?B?KzVaOXFjaFRjbkt3ZHpaMGlYazhESWk3NTVpUWJMOW9tYU1IYUtDWGJRVElq?=
 =?utf-8?B?d2hZaTA3ZFFud2hPN3A4b290dUREamxLckQ3dEVXQkdLd2x1akxGUWI2Ni9S?=
 =?utf-8?B?K3Ywd3Z5dDFFazZWdEFPa3ArclpPWHFCVWlTc0NjZTEzcDZCUTVqN09NYjFF?=
 =?utf-8?B?cmhmOWxzWGZRUGZWMGdiTmM1amNWSFJob1ZIK3NzVXlMWkttaUdYYTFScTh0?=
 =?utf-8?B?Q1U0N0lnNnNmQjNKNzJPL1FzUzVlYy96dFBrZDJEUG52ZW5uRkdFbGoyQ09J?=
 =?utf-8?B?Q0NKLy80dGdGcDI1RmNLUlM1L0oyU0NWWGE0OFl3SkpJVmliU1JxZHRzZks3?=
 =?utf-8?B?NExseUJGZDlCRnMvM2h0WWVNcWpJUUUxREhyV0w4aXZ0a2NMc1g4b0Y4NTBM?=
 =?utf-8?B?V3Fncm96cFFoRnhnUUtnWUs5aTFoYUpaeG1MN29UK3dwWG1EOEdnblhjZU8r?=
 =?utf-8?B?ZTN4TjJ2WHIyN3MwaW01Z1VpUU43eDJLbTNEY0pnQTVIZERWRHJRMDdoS1hv?=
 =?utf-8?B?KzFtclVJdURlNWRpRUpycFB1TkRnT24wN1ZxbEduM0FPUXMzMjFma3UvODkw?=
 =?utf-8?B?OE92RDJmM28xM1k5Z2R6SFJ2NVZ6cjZJaHM1RWZ3TmJxK2d5QWFvSmdRNysz?=
 =?utf-8?B?NHdlM1VKWjR1SHZZUzNtQWd1VFc1eE9nZG9jS2ZGUFRaYnh1VXZBWlkrUHFJ?=
 =?utf-8?B?SXE5dWhlT3g2RVYwalRyb1RabnNMbi9Oa3NodTNtcUp3UUp2VUhDOS9nMW11?=
 =?utf-8?B?RzhOVjNYbDBUWThJK2RvaGhqcnUyTjRkZzlzcDQ5VHByNnNpYWRvdTlwWHVr?=
 =?utf-8?B?b2V6L2YxSUdrcWdwTWxRa3M2RHdQK1F6Ty9pWTJ2RDFtblR1K1R6YUI4RVdV?=
 =?utf-8?B?a2Zxa0tNc0JZTHpUTjJCYUdiZnhxVE5ZRG9jVXdMQ0dPSXBVMWc2azB5QlJU?=
 =?utf-8?B?ZVZ2SW5kOWc3RWNyUkdrdEU0akhIY2xXRU5vYXROcE9hYlNjUGRTUHJ1L3po?=
 =?utf-8?B?RXBOalh1SEtEQUt5VFExdWEzaWpsS1FPa01SNVhXMnIzZ2pXaGRPa2VrejBE?=
 =?utf-8?B?K1drakVtc2ltNlFBYWYxOEhzb2hpV1llc2txQWJZNW02VjE2alBEaWQvb0Nv?=
 =?utf-8?B?bmRuSWNnUHJhdjNGaU5CeDQyOVFINUE3WldGUGtCM0pEUENqb0JjanJ0empp?=
 =?utf-8?B?YjN3WldjNS95TG9LZmtRTXAzN0plOUtpWVFlenpkVFVDRzNNTzh1eStQVU5k?=
 =?utf-8?B?TlBvVFlPalFKQWtKeldGQ21vRU02MXlkLyswVm5HN1BoVEJTS3hMcDVGaWkx?=
 =?utf-8?B?TmM1Z0ZPWm5lNThXMlpFWnZCazl0a3pWVFR5VXF1RS9sWXF2eWNTYXJIc0ZU?=
 =?utf-8?B?N2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe3b99f-0c2d-46a3-051b-08dc4efc1713
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 07:53:00.5397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z6c7+bq6CwFmHtP+tHmQHz0zxZ06o5k7D0Qb9yqmy8ElQPXCQQnLqV+6tzvN3Zw/oXxuAUcIfDTxGbA6g5tMy3s2rnpjySkgjL712e84vLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5307
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

Q3JlYXRlIHNjcmlwdCBmb3IgY2hlY2tpbmcgaWYga2V5d29yZHMgdXNlZCBpbiBkZXNjcmlwdGlv
bnMgaGF2ZSBhbnkgY29sbGlzaW9ucywgYXMgd2Ugd2FudCB0aGVtIHRvIGFwcGVhciBpbiBvbmx5
IG9uZSBmaWVsZC4NCkZvciBleGFtcGxlLCAncmVzZXQnIHdvcmQgaXMgdXNlZCBub3cgaW4gdHdv
IGRpZmZlcmVudCBmaWVsZHMgRnVuY3Rpb25hbGl0eSBhbmQgU3ViLWNhdGVnb3J5Og0KDQp0ZXN0
cy9pbnRlbC94ZV9leGVjX3Jlc2V0LmM6ICogRnVuY3Rpb25hbGl0eTogcmVzZXQNCnRlc3RzL2Rl
dmljZV9yZXNldC5jOiAqIFN1Yi1jYXRlZ29yeTogUmVzZXQNCg0KV2l0aCB0aGlzIGl0IHdpbGwg
aGVscCB0byBzcG90IHN1Y2ggcG90ZW50aWFsIHByb2JsZW1zLg0KDQpDYzogS2F0YXJ6eW5hIFBp
ZWNpZWxza2EgPGthdGFyenluYS5waWVjaWVsc2thQGludGVsLmNvbT4NCkNjOiBKYXJpIFRhaHZh
bmFpbmVuIDxqYXJpLnRhaHZhbmFpbmVuQGludGVsLmNvbT4NClNpZ25lZC1vZmYtYnk6IEthbWls
IEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCi0tLQ0KIHNjcmlw
dHMvZG9jLXRlc3RzLWNyb3NzLWNoZWNrLnNoIHwgMTYwICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwgMTYwIGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9k
ZSAxMDA3NTUgc2NyaXB0cy9kb2MtdGVzdHMtY3Jvc3MtY2hlY2suc2gNCg0KZGlmZiAtLWdpdCBh
L3NjcmlwdHMvZG9jLXRlc3RzLWNyb3NzLWNoZWNrLnNoIGIvc2NyaXB0cy9kb2MtdGVzdHMtY3Jv
c3MtY2hlY2suc2gNCm5ldyBmaWxlIG1vZGUgMTAwNzU1DQppbmRleCAwMDAwMDAwMDAuLjE3NGIx
NDgwNw0KLS0tIC9kZXYvbnVsbA0KKysrIGIvc2NyaXB0cy9kb2MtdGVzdHMtY3Jvc3MtY2hlY2su
c2gNCkBAIC0wLDAgKzEsMTYwIEBADQorIyEvYmluL3NoDQorIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogTUlUDQorIw0KKyMgQ29weXJpZ2h0IMKpIDIwMjQgSW50ZWwgQ29ycG9yYXRpb24NCisj
DQorIyBjb3B5IHRoaXMgc2NyaXB0IHRvIGZvbGRlciBhcyBpdCBjcmVhdGVzIGxvdHMgb2Ygb3V0
cHV0IGZpbGVzICMgaWd0IA0KK3Rlc3RzIHNob3VsZCBiZSByZWFjaGFibGUgZnJvbSAuLi90ZXN0
cy8gcGF0aCAjIGZvciBleGFtcGxlLCB3aGVuIHlvdSANCithcmUgaW4gbWFpbiBpZ3QgZm9sZGVy
Og0KKyMNCisjIG1rZGlyIG91dA0KKyMgY3Agc2NyaXB0cy9kb2MtY3Jvc3MtY2hlY2suc2ggb3V0
Lw0KKyMgY2Qgb3V0DQorIyAuL2RvYy1jcm9zcy1jaGVjay5zaA0KKw0KKyMgcHJlcGFyZSBsaXN0
IG9mIC5jIGZpbGVzIGZvciBjaGVja3MNCisNCitURVNUTElTVElHVD0iLnRlc3RmaWxlcyINCisN
CitscyAtMSAuLi90ZXN0cy8qYyAgICAgICAgPiAkVEVTVExJU1RJR1QNCitscyAtMSAuLi90ZXN0
cy9pbnRlbC8qYyA+PiAkVEVTVExJU1RJR1QNCisNCitURVNUTElTVD1gY2F0ICRURVNUTElTVElH
VGANCitpZiBbICQ/IC1uZSAwIF07IHRoZW4NCisJZWNobyAiRXJyb3I6IENvdWxkIG5vdCByZWFk
IHRlc3QgbGlzdHMiDQorCWV4aXQgOTkNCitmaQ0KKw0KK2dyZXBfdGVzdCAoKQ0KK3sNCisJbG9j
YWwgdGVzdA0KKwlsb2NhbCBteW91dA0KKw0KKwl0ZXN0PSQxDQorCW15b3V0PSQyDQorDQorCWVj
aG8gInJ1bm5pbmc6ICRteW91dCBmaWxlOiAkdGVzdCINCisJZ3JlcCAkbXlvdXQ6ICR0ZXN0IHwg
c2VkIC1lICJzLy4uLiQyOiAvLyIgXA0KKwkJfCB0ciAnWzp1cHBlcjpdJyAnWzpsb3dlcjpdJyB8
IHNlZCAtZSAncy8sIC9cbi9nJyBcDQorCQl8IHNlZCAtZSAncy8gL1kvZycgPj4gYi4kbXlvdXQN
CisJZ3JlcCAtciAkbXlvdXQ6IC4uL3Rlc3RzLyogPj4gbi4kbXlvdXQgfQ0KKw0KKw0KK29uZV9z
Y2FuX2RpciAoKQ0KK3sNCisJcm0gYi4kMQ0KKwlybSBuLiQxDQorDQorCWZvciBuZmlsZSBpbiAk
VEVTVExJU1Q7IGRvDQorCQlncmVwX3Rlc3QgJG5maWxlICQxDQorCWRvbmUNCisNCisJc29ydCAt
dSA8IGIuJDEgPiBjLiQxDQorDQorCXJtIC50bXBfb25lX3NjYW4NCisJbXYgbi4kMSAudG1wX29u
ZV9zY2FuDQorCXNvcnQgLXUgPCAudG1wX29uZV9zY2FuID4gbi4kMQ0KK30NCisNCitzY2FuX2Rp
cnMgKCkNCit7DQorCXJtIGEuY29sdW1ucw0KKw0KKwlmb3IgdG9kbyBpbiAkQDsgZG8NCisJCWVj
aG8gJHRvZG8gPj4gYS5jb2x1bW5zDQorCQllY2hvICJTY2FubmluZyBuYW1lOiAkdG9kbyINCisJ
CW9uZV9zY2FuX2RpciAkdG9kbw0KKwlkb25lDQorfQ0KKw0KK2NoZWNrX3Rlc3QgKCkNCit7DQor
CVRXT1JEUz1gY2F0IGMuJDFgDQorCWlmIFsgJD8gLW5lIDAgXTsgdGhlbg0KKwkJZWNobyAiRXJy
b3I6IENvdWxkIG5vdCByZWFkIGMuJDEiDQorCQlleGl0IDk5DQorCWZpDQorDQorIwljYXQgYy4k
MiBjLiQzID4gdy4kMQ0KKyMgY2F0IGMuKiBleGNlcHQgYy4kMSBpcyBpbiB3LiQxDQorDQorCWVj
aG8gIj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0iDQorCWVj
aG8gImNoZWNraW5nOiAkMSINCisJZWNobyAiPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PSINCisNCisJcm0gLnRtcF9jaGVjaw0KKw0KKwlmb3IgdGVzdCBpbiAk
VFdPUkRTOyBkbw0KKwkJZ3JlcCAtaSAtdyAiJHRlc3QiIHcuJDEgPj4gLnRtcF9jaGVjaw0KKwlk
b25lDQorDQorCXNvcnQgLXUgPCAudG1wX2NoZWNrID4gZS4kMQ0KK30NCisNCisjIHdpbGwgdXNl
IC50bXBjb2xzIGFuZCBjcmVhdGUgdy4kMQ0KKyMgdGhpcyBpcyBjb21wbGVtZW50IG9mIGFsbCBj
b2x1bW5zIGV4ZXB0ICQxIG1ha2VfdyAoKSB7DQorCVdNSz1gY2F0IC50bXBjb2xzYA0KKwlpZiBb
ICQ/IC1uZSAwIF07IHRoZW4NCisJCWVjaG8gIkVycm9yOiBDb3VsZCBub3QgcmVhZCAudG1wY29s
cyINCisJCWV4aXQgOTkNCisJZmkNCisNCisJcm0gLnRtcF9tYWtlX3cNCisJZm9yIG9uZV9yZWMg
aW4gJFdNSzsgZG8NCisJCWNhdCBjLiRvbmVfcmVjID4+IC50bXBfbWFrZV93DQorCWRvbmUNCisN
CisJc29ydCAtdSA8IC50bXBfbWFrZV93ID4gdy4kMQ0KK30NCisNCisjIHdpbGwgdXNlIGEuY29s
dW1ucyB0byBjcm9zcy1jaGVjaw0KK2NoZWNrX2FsbCAoKQ0KK3sNCisJQ09MPWBjYXQgYS5jb2x1
bW5zYA0KKwlpZiBbICQ/IC1uZSAwIF07IHRoZW4NCisJCWVjaG8gIkVycm9yOiBDb3VsZCBub3Qg
cmVhZCBjLiQxIg0KKwkJZXhpdCA5OQ0KKwlmaQ0KKw0KKwlmb3Igb25lX2NvbCBpbiAkQ09MOyBk
bw0KKwkJZ3JlcCAtdiAkb25lX2NvbCBhLmNvbHVtbnMgPiAudG1wY29scw0KKwkJbWFrZV93ICRv
bmVfY29sDQorCQljaGVja190ZXN0ICRvbmVfY29sDQorCWRvbmUNCit9DQorDQorZWNobyAiPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PSINCitlY2hvICJzY2Fu
bmluZy4uLiINCitlY2hvICI9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09Ig0KKyMgQ2F0ZWdvcnkvU3ViLWNhdGVnb3J5L0Z1bmN0aW9uYWxpdHkvRmVhdHVyZQ0K
KyMgc2Nhbl9kaXJzIENhdGVnb3J5IEZlYXR1cmUgU3ViLWNhdGVnb3J5DQorDQorIyBNZWdhIGZl
YXR1cmUgLyBDYXRlZ29yeSAvIFN1Yi1jYXRlZ29yeSAvIEZ1bmN0aW9uYWxpdHkgIyBNZWdhLWZl
YXR1cmUgDQoraXMgbm90IHVzZWQgbm93IHNjYW5fZGlycyBDYXRlZ29yeSBTdWItY2F0ZWdvcnkg
RnVuY3Rpb25hbGl0eQ0KKw0KK2VjaG8gIj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT0iDQorZWNobyAiY2hlY2tpbmcuLi4iDQorZWNobyAiPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PSINCitjaGVja19hbGwNCisNCitlY2hv
ICI9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ig0KK2VjaG8g
IkNvbHVtbnMgYXJlIGluIGMuKiBmaWxlcyINCitlY2hvICI9PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09Ig0KK3djIC1sIGMuW0EtWmEtel0qDQorZWNobyAiPT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PSINCitlY2hvICJSZXN1
bHRzIChwb3NzaWJsZSBjb25mbGljdHMpIGFyZSBpbiBlLiogZmlsZXMiDQorZWNobyAiPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PSINCit3YyAtbCBlLltBLVph
LXpdKg0KKw0KK2VjaG8gIiINCitlY2hvICI9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09Ig0KK2VjaG8gImV4YW1wbGUgdXNlYWdlOiB0YWtlIGEgd29yZCBmcm9t
IGUuKiBmaWxlIGFuZCBncmVwIGl0IGluIGMqIg0KK2VjaG8gImdyZXAgLWkgd29yZCBjLioiDQor
ZWNobyAidG8gc2VlIHdoZXJlIGl0IGlzIHVzZWQgaW4gdGVzdHMsIHVzZToiDQorZWNobyAiZ3Jl
cCAtaSB3b3JkIG4uKiINCitlY2hvICI9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09Ig0KKw0KLS0NCjIuNDIuMA0KW0thdGFyenluYV0gTEdUTSDwn5iKIEkgY2Fu
IHVzZSBpdCDwn5iKDQpSZXZpZXdlZC1ieTogS2F0YXJ6eW5hIFBpZWNpZWxza2EgPGthdGFyenlu
YS5waWVjaWVsc2thQGludGVsLmNvbT4NCg0KS2FzaWEg8J+Yig0K
