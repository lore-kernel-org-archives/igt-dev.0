Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EFCC54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 04:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C3110E956;
	Thu, 21 Mar 2024 04:28:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EWAf8aKR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5023D10E956;
 Thu, 21 Mar 2024 04:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710995327; x=1742531327;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2TyCmbSNKg5b96Saw+SJq7fvqCjZ2t3ISNAsMSTKWh4=;
 b=EWAf8aKRZTaANAZHbvns3C/I7gBXXpdqFHpXjiiBg4FviDh+ABjiWTD8
 kk2VHo5ozAO8JEYy4bxydJzVwHTfWv3PGcEI35RmBdh6rhz/R1HqzS12I
 nXE0NP2fei04dX5Tuayw3e3eLTLYaepElg0ESBHRfWTu3aG0FLscIQkCX
 K4mfgclfr1B69/1JdX1z2AeTJ4SkH/2+SBicmOrAE6a2kqw8dsN0GZP/f
 n1/DQ/HXyAMAuD0EO89dbLWkijwSgKvCozxRzQSuKQ/lz9OqHg1f2r22v
 /hLMAO9d3H8vDPXUZJ4rdtHfZWpFlxM6/loxb4961txy6sgEaNOajsz/a A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5792839"
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; 
   d="scan'208";a="5792839"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 21:28:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,141,1708416000"; d="scan'208";a="19021333"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 21:28:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 21:28:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 21:28:45 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 21:28:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkHKrVYI8w8pmrzOOTaNvLOoeFn3A3L5ZpuXjsHHbMzbmuiHdZMZiahAxQ6X4yDo3+UmZ1t8TmtV9imJw9BYWcFn56ofh6t+zt+l4DIRXtgcyus1gWsR4ZJBxHRB85xgSPvgGPoFUnrNm33CXqSphUXAMHCmjA3AaOgQbAIFBIljdWUBVHcFEbxHeG1G/9eAINe5fgCAvFtW8XChdr42OXtN6zhtGPTaQYRUI0hoD1T87YOg4DqcPoN0OEcsZ0CtDRQcGkxvRmI2On4OPkloJzZgpgNjJu8cgh11grqkHlYdZYLVCAhvC/0xaPHlfnDtCVZk1/YtaI2bXD/4jNGvzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TyCmbSNKg5b96Saw+SJq7fvqCjZ2t3ISNAsMSTKWh4=;
 b=iFsP1L1URgCEzEM0wrz/tiTCyRtnfrA2n/68w8qsJIiQ3pg+uhdrRNWt50q7EC8yQlZbxDbTJThE2Y6Itr3pYOVcwDKXfkPI7RmEr3Y7coY6kVpvsS/MH0lS3516tdm/W1Q20bBGspVSLWq5qEeDJLX7Ee6RA/7UqGZXvRbJ6I8gXWmwhH7muoJBIzWwgKQSaaVvZ4MRg3ONvUEXtrYjxcoMWjcZV6ZO8aYkIiU1ZWCkNzKSC+DosbrPV8vvmwsGzI3sryu4Kw+3Buzr35izkM/OEF9dhjoYIg0zsVYCuV4vM4A2PvVZGxttkDvSZT/iA6WlGodiCzvO3nFtl+YwVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6753.namprd11.prod.outlook.com (2603:10b6:510:1c8::22)
 by DS0PR11MB8206.namprd11.prod.outlook.com (2603:10b6:8:166::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Thu, 21 Mar
 2024 04:28:43 +0000
Received: from PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::872:479f:4c28:21b5]) by PH8PR11MB6753.namprd11.prod.outlook.com
 ([fe80::872:479f:4c28:21b5%6]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 04:28:43 +0000
From: "Illipilli, TejasreeX" <tejasreex.illipilli@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Louis Chauvet <louis.chauvet@bootlin.com>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>,
 LGCI Bug Filing <lgci.bug.filing@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5CQVQ6IGZhaWx1cmUgZm9yIENPTlRSSUJVVElORzog?=
 =?utf-8?Q?Add_coding_style_guidelines?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQ09OVFJJQlVUSU5HOiBBZGQg?=
 =?utf-8?Q?coding_style_guidelines?=
Thread-Index: AQHadvmIrnnWI3aNB0iYj6qeYqHiY7E9ZVgAgAQ5HEA=
Date: Thu, 21 Mar 2024 04:28:43 +0000
Message-ID: <PH8PR11MB67539C76BC94AD9A54E51004F2322@PH8PR11MB6753.namprd11.prod.outlook.com>
References: <20240315-add_coding_style-v1-1-50ad93cfa250@bootlin.com>
 <171052169182.795787.252679567301376195@8e613ede5ea5>
 <20240318114434.zbqvi637ook5pv3o@kamilkon-desk.igk.intel.com>
In-Reply-To: <20240318114434.zbqvi637ook5pv3o@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6753:EE_|DS0PR11MB8206:EE_
x-ms-office365-filtering-correlation-id: 1e7e5a40-af6c-4ee8-b3e5-08dc495f6464
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ufkDr7/gW/8PHcjLgJbZg+I0cBAc4aqsPdO9UtZK966oe9rbFcjML5pSLPZprJQPTrUqY1IPTZaKyFHluFZWI03eyKK5QLQv25BDzsDujYxMwgTRKslzOHIRr6NYaYnx37AUAeS7ygrQdIw6SVBiym1BNRQJiHi8mmkbMEBEcAeqJN2G0M/GaYTKvfIx8wWdPH01tcofI1CL30QwcK6nd0xOARLEuqU9inf/r2TkWeWoEGZZJ6ezBa3DvLsAtItz/5qsPMV876A6bSSUvY8BXmrj5wXM6XonaKySrUP+bFXjPMT2A7cOjtzjmo5bK7xAfhvF7ih/Lj8b4OMuHsDHCHTP0UvWDaD/T4AvClnmTI4CXv5DJfFrZs7NszAXhAdx9bOJybOfxkftpFsk3dYqlM7nKBrUwChY5ejaoOJUjyEFYlASa/OYJMl6XJpkumIzfwpjCnSijAhE8SwNiG+Om4OzijNLoIibi4Z8G1WCos17/Y/fqcYSVnYoEkN6RWOBK+NEiAXaS5on2drrFLPoDctfYH1LQ+NSvevXlqlbdywfCdiSMfFhJEUTax7IEDwy71tIXbVbS3BlzYLvaEBqzBHjdR+6I299T8x8QpNK7Kt5rwgt+dCy8NPsKdAYFCk8hwqAC4VBWlenSHeMvAtLJnRsoWNvbCqGnxMINSsiyQc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6753.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWNNeGNFR1FlckE0WjRrUUJTbVFkVi9rb3c4T1BTK1dES00rYS9RV3NrK3Nl?=
 =?utf-8?B?L0NFcGdBQThuQUM2clZnazVGbm9mOWU3cy9OSVNVcE9mNG5qMDNsUnhaWDY5?=
 =?utf-8?B?Vkhnd1hWcXQ0K1FSdnplbXVMeUUrT0k3UVIvR1pKRVdjMXRBN1FCZURsa0pT?=
 =?utf-8?B?eHVkRUVZS0pzVzRhMmVDU2RITnVROFk1c2lJK1lrbExiVWlacUFFKzNleTlJ?=
 =?utf-8?B?QzZWV3VLbzFXdld4cDQzaG9XWUFpU0NzNEd4Q1U3dTlwVnJ3OEhIbVRxZk1k?=
 =?utf-8?B?T1VWelJxRUdRcStMT2N3MGJqakN1VFJENHVaKzE4NEF3ejAxbmxxMldlaGpS?=
 =?utf-8?B?cC9MRElEVnlOWHR0bUVxYVhXR2VxMUc2UnVpS2tDUlFDK2VtZVZJR0JDREdm?=
 =?utf-8?B?bjlTbUUxVzhLZHhMdVh5dVM1OE16eHlZVTJGZzYybXo0blU0L3R2dld5RlZZ?=
 =?utf-8?B?MnR3MjZ4c0lPM0YrTXAvVGd2VW1Sa3ZQZ1MrcnlsYlliTHpuRTZLQ1dEMS9V?=
 =?utf-8?B?bWdxTUhEWGFoa3JLekUwSUg0eGJkYms4eGNQcHZ2NnkvVXBMdWQ1Q3JGUncy?=
 =?utf-8?B?RnpGbWMyb0wzY0d3eVNaUzluazBpbEhrbmk2UGhocTdZSVRaR3NDazlkWmpO?=
 =?utf-8?B?L0FGdE5HYkFXdHJqWGg5M1J3TTVFVURvaVZablpmVlNESDhySXFWNTZXMldy?=
 =?utf-8?B?bWhVcURNQUhkc3gzYktHdkJVWXpXMno5OFQvUG5IWlRUbjEvZy9LQ1AvMWFY?=
 =?utf-8?B?NkZ0WVh3WkI4TFlRc1JhWlhBS2lBNm1EQ2c0UlAyeVhZa0g2RXhIM3c4ejh3?=
 =?utf-8?B?NFBoZFZLaGVIc1RxMzRRdkgzc2l3dGJWVG5tMlN6SjFPZzlxb0ZGYjh1TWRS?=
 =?utf-8?B?a1c3WFM1ZzRYV3NaZlU3Q28wQnFGaFhLRVd3cE1hNXNrVUFGOFJyYzh5YVIv?=
 =?utf-8?B?VXJsM3BNdHg1aVI2OFoxYkZTdEY0bXpwRzdpbmxxVFkya2s3U1B6T0UyS0pB?=
 =?utf-8?B?VXJyWkNPMCsvSEk2VUJ2Z1lTWlhXYWFUc1FSdnJ4YUtRWHIxU2tqVzBMTnVu?=
 =?utf-8?B?WEdhY0hGdkl2U3ZGM0l6clRSZkFnUWg0YWo1MzdZSU0xcnJoS1RkSHFwK1pK?=
 =?utf-8?B?NWwyOFA1MEw3SURNNEg5ZVhmZDZWM2NYeEdoT3BpNFFBTndqT0dhanlwL0gy?=
 =?utf-8?B?Um5iQVFURUVpbmR1eldPdUcxdkJ4U0xFTWdtdjJlYnZIbmlJWm1TNGdtZmpq?=
 =?utf-8?B?UUNabm8vUFJSNS9obkRSRitIKy9oUXVGcjFQV0NYM3MyTUFMTDhoU01LQnE5?=
 =?utf-8?B?QS9uVTBROUN0Z3JzbENnRFJzNm5ndGJVQ0t5R1lsTXFzclgrbThxSXZLYUp4?=
 =?utf-8?B?ZmI2UkQrUG9IMHYrS09tVk12N005YXNaMHVZQkV1aVg2ZGdTeXdrdXpadWVE?=
 =?utf-8?B?aUptdkxJclFSSEVxNEhXNHUwOC9uVHZrTnRkeGt3QmVleWVBRzZTV3ZGS0pT?=
 =?utf-8?B?SXFkRkNwbzM5VzNpNHJSTmxkSHR5N21welhVbDh0QmUySExjRFhuUVlvVUxp?=
 =?utf-8?B?MWllVWpEWkFjZjlLejdXemJGN0JMbXFTKzJHVFFMNm5PL3pieDhOUjVvVExG?=
 =?utf-8?B?RERuQWUza2ZWWVIxZkh0R0RXUVF2dTIvNWRVNnFwUnBLeHh2cmk0QVFKa0Yv?=
 =?utf-8?B?eTRRUFpmZXQvM3VZdFNiL0hqcDk1RWpOd0lSQlU5WlNIVWFRM0tPZVROcUo4?=
 =?utf-8?B?U05ReFBmOWtBRDVUREV6M1pBS3J5U3V6NXVYUXFMelJuNllCWGZvcEx5d1Br?=
 =?utf-8?B?WEdiUnI1Y0ZUUFcyREFrMFVaZWJaWDNUZ0ljMzROeVlRZ0J3cjcySWY3TjNn?=
 =?utf-8?B?U3RhSTBTNmNDVmprcGlocFM0VUxnMlAvTUdyeEtxcWluL1liK2xZR3g5d0I5?=
 =?utf-8?B?QjVqdUtzZ2R4UC9KRk5Nc2ZZeHVzZGhpMXI3bGsvZ0Z2WFdZTmRqTkV5SXBQ?=
 =?utf-8?B?Wk9HY0FBLzR2UGZPNVZBRGlRdDE4VkNqQW9leGVRcloyY25Gb3RURW5YUnpo?=
 =?utf-8?B?ZFhUQkJ5MkRiT0Z2VGh3eExsdFhWMURLNXNxQkM0NUFCa0ZINEt6dm1jczVL?=
 =?utf-8?B?ZXROblhVWVRaZFpKczVNWVpxUTQwN3pjOGtPRE1nMk15ODg3azErVjJhQkFv?=
 =?utf-8?B?UlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7e5a40-af6c-4ee8-b3e5-08dc495f6464
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 04:28:43.4211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kUI4lsNyiM0CLcznFP494L0oRjdxH/w2LFIIx6MmGJ0Q8m8sokj+t1tXGDUZUicgzwByJY09DY5qN8X5Gf3hr3OLemZiI4yE7WhLs13j4Dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8206
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTMxMTkyLyAt
IFJlLXJlcG9ydGVkLg0KDQpUaGFua3MsDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4g
DQpTZW50OiBNb25kYXksIE1hcmNoIDE4LCAyMDI0IDU6MTUgUE0NClRvOiBpZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KQ2M6IExvdWlzIENoYXV2ZXQgPGxvdWlzLmNoYXV2ZXRAYm9vdGxp
bi5jb20+OyBJOTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTEdDSSBCdWcgRmls
aW5nIDxsZ2NpLmJ1Zy5maWxpbmdAaW50ZWwuY29tPjsgSWxsaXBpbGxpLCBUZWphc3JlZVggPHRl
amFzcmVleC5pbGxpcGlsbGlAaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IOKclyBGaS5DSS5CQVQ6
IGZhaWx1cmUgZm9yIENPTlRSSUJVVElORzogQWRkIGNvZGluZyBzdHlsZSBndWlkZWxpbmVzDQoN
CkhpIGlndC1kZXYsDQpPbiAyMDI0LTAzLTE1IGF0IDE2OjU0OjUxIC0wMDAwLCBQYXRjaHdvcmsg
d3JvdGU6DQo+ID09IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IENPTlRSSUJVVElO
RzogQWRkIGNvZGluZyBzdHlsZSBndWlkZWxpbmVzDQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xMzExOTIvDQo+IFN0YXRlIDogZmFpbHVyZQ0KPiAN
Cj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSBDSV9EUk1f
MTQ0NDAgLT4gSUdUUFdfMTA4NDYgDQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+IFN1bW1hcnkNCj4gLS0tLS0tLQ0KPiANCj4gICAq
KkZBSUxVUkUqKg0KPiANCj4gICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCBJ
R1RQV18xMDg0NiBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxseS4N
Cj4gICANCj4gICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5n
IHRvIGRvIHdpdGggdGhlIGNoYW5nZXMNCj4gICBpbnRyb2R1Y2VkIGluIElHVFBXXzEwODQ2LCBw
bGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnKSB0byBhbGxvdyB0aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBt
b2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+IA0KPiAgIEV4
dGVybmFsIFVSTDogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAv
SUdUUFdfMTA4NDYvaW5kZXguaHRtbA0KPiANCj4gUGFydGljaXBhdGluZyBob3N0cyAoMzUgLT4g
MzQpDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBNaXNzaW5nICAg
ICgxKTogZmktc25iLTI1MjBtIA0KPiANCj4gUG9zc2libGUgbmV3IGlzc3Vlcw0KPiAtLS0tLS0t
LS0tLS0tLS0tLS0tDQo+IA0KPiAgIEhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBt
YXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gSUdUUFdfMTA4NDY6DQo+IA0KPiAjIyMgSUdUIGNo
YW5nZXMgIyMjDQo+IA0KPiAjIyMjIFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMjIyMNCj4gDQo+ICAg
KiBpZ3RAaTkxNV9tb2R1bGVfbG9hZEBsb2FkOg0KPiAgICAgLSBiYXQtZGcyLTk6ICAgICAgICAg
IFtQQVNTXVsxXSAtPiBbRE1FU0ctV0FSTl1bMl0NCj4gICAgWzFdOiBodHRwczovL2ludGVsLWdm
eC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0NJX0RSTV8xNDQ0MC9iYXQtZGcyLTkvaWd0QGk5MTVf
bW9kdWxlX2xvYWRAbG9hZC5odG1sDQo+ICAgIFsyXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA4NDYvYmF0LWRnMi05L2lndEBpOTENCj4gNV9t
b2R1bGVfbG9hZEBsb2FkLmh0bWwNCj4gDQoNClRoaXMgaXMgdW5yZWxhdGVkIHRvIGNoYW5nZSBp
biBkb2N1bWVudGF0aW9uLCBubyBuZWVkIGZvciByZXNwaW4uDQoNClJlZ2FyZHMsDQpLYW1pbA0K
DQo+ICAgDQo+IEtub3duIGlzc3Vlcw0KPiAtLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUg
dGhlIGNoYW5nZXMgZm91bmQgaW4gSUdUUFdfMTA4NDYgdGhhdCBjb21lIGZyb20ga25vd24gaXNz
dWVzOg0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiANCj4gIyMjIyBQb3NzaWJsZSBmaXhl
cyAjIyMjDQo+IA0KPiAgICogaWd0QGk5MTVfcG1fcnBtQG1vZHVsZS1yZWxvYWQ6DQo+ICAgICAt
IHtiYXQtbXRscC05fTogICAgICAgW0NSQVNIXVszXSAtPiBbUEFTU11bNF0NCj4gICAgWzNdOiBo
dHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0NJX0RSTV8xNDQ0MC9iYXQt
bXRscC05L2lndEBpOTE1X3BtX3JwbUBtb2R1bGUtcmVsb2FkLmh0bWwNCj4gICAgWzRdOiANCj4g
aHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMDg0Ni9iYXQt
bXRscC05L2lndEBpOQ0KPiAxNV9wbV9ycG1AbW9kdWxlLXJlbG9hZC5odG1sDQo+IA0KPiAgIA0K
PiAgIHtuYW1lfTogVGhpcyBlbGVtZW50IGlzIHN1cHByZXNzZWQuIFRoaXMgbWVhbnMgaXQgaXMg
aWdub3JlZCB3aGVuIGNvbXB1dGluZw0KPiAgICAgICAgICAgdGhlIHN0YXR1cyBvZiB0aGUgZGlm
ZmVyZW5jZSAoU1VDQ0VTUywgV0FSTklORywgb3IgRkFJTFVSRSkuDQo+IA0KPiANCj4gDQo+IEJ1
aWxkIGNoYW5nZXMNCj4gLS0tLS0tLS0tLS0tLQ0KPiANCj4gICAqIENJOiBDSS0yMDE5MDUyOSAt
PiBOb25lDQo+ICAgKiBJR1Q6IElHVF83NzY4IC0+IElHVFBXXzEwODQ2DQo+IA0KPiAgIENJLTIw
MTkwNTI5OiAyMDE5MDUyOQ0KPiAgIENJX0RSTV8xNDQ0MDogMjJiYTEyYTZlZGVkMzNkNDBmYmE1
OGI0ZGFjMjRhMWUyYmRjNGIyNSBAIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2dmeC1j
aS9saW51eA0KPiAgIElHVFBXXzEwODQ2OiAxMDg0Ng0KPiAgIElHVF83NzY4OiA3NzY4DQo+IA0K
PiA9PSBMb2dzID09DQo+IA0KPiBGb3IgbW9yZSBkZXRhaWxzIHNlZTogDQo+IGh0dHBzOi8vaW50
ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTA4NDYvaW5kZXguaHRtbA0K
