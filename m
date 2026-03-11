Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA311125869
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 18:53:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F65910E148;
	Wed, 11 Mar 2026 18:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jGYAkZDD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889B310E148
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 18:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773255223; x=1804791223;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=HWUxifu99bpvDZYFz4JGF37FD8XxtSLmZ2qvhsthbYY=;
 b=jGYAkZDDVKRld/KfL0CrkOB7kAM8Yzd+olA5ZxQB/a+39YyWGW38SDH8
 JBJGjspNZjS5aWIIBFLvkCr8svsnfGAMdV47ANuVgDnKbvVoR9ESqr1Mf
 wGspBliKiXQWwQDPlsygWOqPlhX4psxjXDOwU1e8txVGV8d6PfzCnvVew
 iubwHi/CThh1l8NSrb8z+T0LGekgtXtuNgAUugz3rfZPLkW9jqeox7Yc/
 PP3XFEmHIB7DjXHtV+jhIaiMSNAEMNCCE8s56nzOCr7Tvrlb6ncW3hjMS
 ufp5ff0q1HysBlXpjvkOFgv9Ie5oWj1HbZxWMM75axMqosn7LZRPPRGzn g==;
X-CSE-ConnectionGUID: tqaIsDfzSxy8lSCoHCuusw==
X-CSE-MsgGUID: mo5gm7OdRl2nJI1YgIJCgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74374826"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74374826"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 11:53:42 -0700
X-CSE-ConnectionGUID: 26DZXcH/TYuT0k8UjG0oWw==
X-CSE-MsgGUID: kHy+wnDdQMeaamk06XhWyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="225268850"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 11:53:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 11:53:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 11:53:40 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 11:53:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ro/4XMeUdOAwTGNtoWgLV4JkjV4uadFarSlAtdF9MoqbVBv+lFOckXtjr/G5qI/yETgKdoDYE5Q9DgniGHMx1gEDlO9plpsU82bl/6y+cPb96FNhoJZQdFYy7iX4LzoQuQd2gobzncM4HgW/YwE5GgW7+5QtVSxp9GAmeq7XE0p8sjMvi/ovHwSMW33FvYzenr1J8O8LhrPdR+d4VZq0MJqqz77hjy1IRKO23YewhYwpVtdtXhoVv1WMHNteObZAg4hbnuF6y67vKFnxBOj7yErwS7QULVRyhGRjt9LVF7HaNItIr4bBMgVLpwUcEdZb50BKjJf04RqLn2l2SgBBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWUxifu99bpvDZYFz4JGF37FD8XxtSLmZ2qvhsthbYY=;
 b=HXXfLw/i/K2kAEG9p3n64SiD98w8oS5XDwKZDrcQDcmxjpgVESWG067WQWRVFchnoly/7HpRqOtlX8OB/FBKM0kUsADYJH8NEWc7rqyYLATEVrjb5ukNg6saZmk0eCfaQWJVf54pEBCjMGEomMyTrMK4o3lBAxkbHPBIz2SMitZXY/Sw93I7yW3rDIIZZaBa9HkvwX039YX5KhSCZsEZJwffaEavLxYaGB+31aIiSjRHb4NvpWPdNmXATew+rlTl7GcsZLgz626M8IRt598wlM/AOhzK/KW2fbJk0N1JddvPgCQLMhqkarrdLg9C+g7N0Eilsx4GBbRH+q02xzPq5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 DM4PR11MB6067.namprd11.prod.outlook.com (2603:10b6:8:63::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.3; Wed, 11 Mar 2026 18:53:37 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%3]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 18:53:37 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib/xe: Introduce aligned buffer mapping
Thread-Topic: [PATCH i-g-t 1/2] lib/xe: Introduce aligned buffer mapping
Thread-Index: AQHcsXkZNEuFokUhBkydYEhXBV9QkrWprckA
Date: Wed, 11 Mar 2026 18:53:37 +0000
Message-ID: <aeee76de85ea852c8ab6f8e886a0046fb3bb6dec.camel@intel.com>
References: <20260311170354.475828-1-nishit.sharma@intel.com>
 <20260311170354.475828-2-nishit.sharma@intel.com>
In-Reply-To: <20260311170354.475828-2-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|DM4PR11MB6067:EE_
x-ms-office365-filtering-correlation-id: a38f3fda-cd36-48ba-b021-08de7f9f8134
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: 26DP4SFuIcTUDIf7cwFJ8wdaPUUY3hn2DWJ5nKqQASR4rpyWIyxWwMNBvguf5bDulh23d8OpU9CmhWjmO0Dasg4v3M/6mEuGBSPrNkw19DN+CFGn3t5S9gkEHnGQxrpzPnlBa9/0g+YjjdR4/361iv1o9gDKOHSN2OgLV2t0C2mErfIag77MilqjXsk8d71JS38TqMhDAMC6AyMZPw5ofqwT4id/shozL14gc4U4b0gA+rmBfxBjsc2lX1dqRkjeuGRcBwFCGJR7BEqgUZZiPhccd2U/Ever18kd7N7DqwGBjUis8Yy4+gboH9PJe2GnvRyzjtpad1ma61OyOT6ItAM+XTAorY5ltObrfzhHtel3+hBVv2UFN7FIXuJ7YxFKxrj0ntT6cMZpKS9MFFWN62VdzuqXiNdpZRVRXTRTuFaY002E8YC9BniKehJxx0owyc6j6VIINwSK4paYH1Old7oM53YgP618tUYus+C9rwkHgM9tlhxvhIySEEJPdr6iJLxlD2a04D6PBzp8wjWYdaSY403HsIQGnmy3bprLvuq3bCgGZlN7zwTYipPZiRbieLgfs54jUF6QN7zsoIoEMJ8oFymtJcADukVuKIkgxApkVvqx7ta1p2nStBfO1yh4SADuvWIr/D4TvZQtp5M+EHoZWTdHAjGyLdAOtKngZADJ9ycr/nnDUrU/kS1h1mY9/nMjVfXjQOxRP9J/mIKyey3fKGHc3XEpmf6d2VSLoRtRHd3iwntAXl1AN4P8drbumL16ze0yp/1JpLZvDa753UhgMIYw2Jvg1+T5noj4wQM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXFrcjBMSTdoSVlDZ29NczRyclBzejZZc0syTFFuQWQrczVLVldOQkxDYnJn?=
 =?utf-8?B?SWJjQmNTMHViVDNXb0JId2NMY2t4Q0E1NEhTek9YZmN1L2hGaklDSlg1aC95?=
 =?utf-8?B?d3JRWUFFbkxLeFdzUUQvV1RPWVU1ZnF2RlppVWY1c3FGMlQ4VU02ZVBDRVUx?=
 =?utf-8?B?Q1l3VVhxbzVBTll2YnR1Rk9GWVlSQlJIbWRhUWFqb29WaWwxdElUeXhmSStF?=
 =?utf-8?B?SUhubmdXb3JYRXRKcm8zM3hndVJ3ZTdQVHV4cUtjQ2JEY1FKQUpCdkhJWCs4?=
 =?utf-8?B?c1lWZWpGRC9HdHQvQUNyZE1UTk9nYlZhTzNMZU9QdjVaNHV1VGZiYXR3L3Yw?=
 =?utf-8?B?cFZraTl4eFJRdUN4bFRnZXg4cHQ5SmdjbVdWMWk4ZCt0TlQ4d05HZzdvam0r?=
 =?utf-8?B?L000bS9YT2lLaitjUXh4eEEvaWpvUEhmazBaVE0wRmh5Y2U3MCtabURaWVNm?=
 =?utf-8?B?Zk5zRFpSR1d2RTd5WkZ6cE55V3ZxL2pBTDZYRERUZi8zQ1c3ZUY1RzFpemhU?=
 =?utf-8?B?MzhtNitvNmNJTFdGZjB3NllKMk9DanNJL0VKbkxydjFqUDkvRnQrV25VL3E4?=
 =?utf-8?B?ZjNvYmpaTzFCQzBZZU5JZHZQZkVRZmZBdjBaVkFIQUVaY29rWDdRLzdnSlJr?=
 =?utf-8?B?NldOYXNuKzR1THUvOFl2MnFSYmltaFNQSXdxME41VDB6VFdhVHNMZVh2U2lF?=
 =?utf-8?B?VGJMdXNtMWMrYWlDK0VmMEFFTzRrOC81SmY5TGgzVnZpQ0xjNDRjdzJiaFJU?=
 =?utf-8?B?TUUyZ2diZFArOUpmLzd6cHRqK0QwMXhNR3UrSngraldZZVBFbERYeEpQZnA2?=
 =?utf-8?B?Mk1vVlBEVXF6dlR4TzMreWlmdCtLMm5wMGlybmJqYjhzZjc2dE9hbkNBKzdr?=
 =?utf-8?B?MFJpcDlhdDU2MmFQK3J4WUFiOXVHcElpZlRObE1ncm1jemlwc050dGJEYU1E?=
 =?utf-8?B?WGl4eERQNGRIQmFZZTNwMDNJMTRLeDRzSFV6LzhVNXBQMExlSjhaSk85aW4w?=
 =?utf-8?B?a0FwYmhldmdpejhBYldka3BRU2pFV2xFTWlUVVkvakRDRTEzL0hNcW9iVWNG?=
 =?utf-8?B?d2lLVWtjenJYVEw0eVR3RFVpbGVYc1pZYWQwTjJLWVNPbEtSOW0reW5YNW56?=
 =?utf-8?B?Q0pySzh6N21FL3Y5SGRWUVUraWtuWlZ5cHgzQ1dXSlgzeDNOWnRzdUU0aW95?=
 =?utf-8?B?WmVsQUVUN1BiRVdmdHhqYmRvN3BpNWZTN3ZUQ2ZUN3FSMENWaE9hbGk3eFNK?=
 =?utf-8?B?TUdPZW1rYW9nTUI0akZmT3pLL0xyWS9YU3BibXB1M2NDSmxuaXJ5VS8zclpw?=
 =?utf-8?B?MjlEWkxObEdUTERETHlzc1FZSytvL3d3SmY1RVVDV05KWkpmRDhYOXVWSG1C?=
 =?utf-8?B?b0NEUGp3UElGK2FBZUREWFVVbTdjMVpiV2Z5MExGNUlJRVlsZmV5dEYvRmt6?=
 =?utf-8?B?alZ0bnhLK1lmd29kMS84MmUxQWx6UzR1UjE3UnMyWnYySk5ETlRXenZBd3dn?=
 =?utf-8?B?bW5kcWQzSFFOdWFYTmgxL21PeGhMOVpGSWFCV2NiaGNEdUEwSWY4Q1NNcU1h?=
 =?utf-8?B?LzlxbGlmUi90ODhleGkzdnZPbnBUWEpnQkFJVnpnQWtBc2xrR0l5R0h3ek94?=
 =?utf-8?B?TlVYL3dQOUdTdisycm1Uei9vUUgrZWRWYmdVTmQ5WnJlTW1BKzMzMVk2M2pi?=
 =?utf-8?B?VUR0bTFrQ0lGQlFPNDhQalc5UVdaTkNUWmlaUGtzNi9wd2svcUYxSWxUZS9O?=
 =?utf-8?B?NDNreS93alJLMEhhaFlDQldUMFZlblZUOGx1a1hKNU9zZm9EaFhJVzRENTUy?=
 =?utf-8?B?NlVwV0lTNjR4b3dRbTA3MGxNQUd5RmFENC9CYmswRXJNY0cvUFc0Wk5xQ3Va?=
 =?utf-8?B?MWNkUUpnWUVYU2FNL3RyeEFRNHNRczFBZUxwOS82OHB3eWJLd25uUUI2bVdu?=
 =?utf-8?B?K1FYNVlvS25Sb1k0Q3p4M3VwMXNRVzVYQi9tUjJSTVlHdWF5UnZVUGJUVFhM?=
 =?utf-8?B?cFdwcWk2MTcvaHQra08rZnRIRE5yU2FMQ09TUmZNeGYzUzdiSHI0Ri8rR0w0?=
 =?utf-8?B?Z2pWYmJ2UWJRSGVVakdCQXEzbHZBMWh4RlAzYkdYeVJXRkZJemMzY3ZmWW1O?=
 =?utf-8?B?UUdGbjF4TVdzNFB5dUhqaXBzOCtzRjZpbEZzUGxHdUZYWktlVVl4dmdyVThr?=
 =?utf-8?B?Z1M0dXRRbkpRY3o0QWpJYVhZbklxREZUSTZETE5RS2Q5aXErVHNzOUNvclEv?=
 =?utf-8?B?Q0huZFFmUXh2ZS9iWkRwTU5rSzczK3l1SWtsbTh3OXZOdlVDaWhvaCt0YnNK?=
 =?utf-8?B?R0JhdDF4bGhwdE9ZcnRERnpNSGZsK0lQVkJQaHJ5WXF0SEpMK2ZoS2xVQnJa?=
 =?utf-8?Q?dgDPFEnHeZ3MFAXw+norLEoPk1GTJCuxp7D20?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F02DC80E5848AB4EA9EB312552C59EB9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CG5yo+qi8Ib37TQq2poSJNsW7l/qxepWErRbASXqBCDJ+5GSsbNUb+GV4pB+wWVAPBhGKbPxTA3uX+jKsrzXRuzilfOEe9oI/o+YBvvKf2E4z7ZNAMGU9YJDa2fSi8e5y3L+TP32cwwKy6pprYRF+jL+z02xuqG/emveCsEvWzRqJCyodOl+mStDwi8ZCbaWb61X99AQJrOkvdn0qtXLQ37ocxsyeAMhCN5GMwRwOb6QfXyho3OS7qIcnAh7EDFy5lynqc246XPC/pWw5MhAYraNS4BSIbOWyWZbPxQUeQkRM2j4ByVQry8aQlkxS34eApWMJvcuKpf619fuer3zFQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a38f3fda-cd36-48ba-b021-08de7f9f8134
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2026 18:53:37.7245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pu2KMG800vVU4iDlosnDdqklFPEcdBDH5ehvnOhkx7sWulpznVpxdxYYpcrbH6AaRkeLXtxR9Y9SvWtz8VjCNA+MzkgfT4Lbk9e27YqtNmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6067
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

T24gV2VkLCAyMDI2LTAzLTExIGF0IDE3OjAzICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBBZGRlZCBhbGlnbmVkIGJ1ZmZlciBtYXBwaW5nIHdoaWNoIGlzIHByb3ZpZGluZyBh
biBpbnRlcmZhY2UgZm9yDQo+IG1hcHBpbmcNCj4gYnVmZmVyIG9iamVjdHMgd2l0aCBhIHNwZWNp
ZmllZCBhbGlnbm1lbnQuIFRoaXMgQVBJIGltcHJvdmVzDQo+IGNyb3NzLXBsYXRmb3JtIGNvbXBh
dGliaWxpdHkgYW5kIHNpbXBsaWZpZXMgYmF0Y2ggYnVmZmVyIHNldHVwIGJ5DQo+IGVsaW1pbmF0
aW5nIHRoZSBuZWVkIGZvciBwbGF0Zm9ybS1zcGVjaWZpYyBhZGRyZXNzIGhhbmRsaW5nLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhvbWFzLmhlbGxzdHJvbUBpbnRl
bC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IE5pc2hpdCBTaGFybWEgPG5pc2hpdC5zaGFybWFAaW50
ZWwuY29tPg0KPiAtLS0NCj4gwqBsaWIveGUveGVfaW9jdGwuYyB8IDQwICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gwqBsaWIveGUveGVfaW9jdGwuaCB8wqAgMSAr
DQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvbGliL3hlL3hlX2lvY3RsLmMgYi9saWIveGUveGVfaW9jdGwuYw0KPiBpbmRleCAxNmFhZTA1
YzkuLjJlOWU3NTY1NiAxMDA2NDQNCj4gLS0tIGEvbGliL3hlL3hlX2lvY3RsLmMNCj4gKysrIGIv
bGliL3hlL3hlX2lvY3RsLmMNCj4gQEAgLTU3OSw2ICs1NzksNDYgQEAgdm9pZCAqeGVfYm9fbWFw
X2ZpeGVkKGludCBmZCwgdWludDMyX3QgYm8sDQo+IHNpemVfdCBzaXplLCB1aW50NjRfdCBhZGRy
KQ0KPiDCoAlyZXR1cm4gbWFwOw0KPiDCoH0NCj4gwqANCj4gKy8qKg0KPiArICogeGVfYm9fbWFw
X2FsaWduZWQoKSAtIENyZWF0ZSBhIGJvIENQVSBtYXAgcmVxdWlyaW5nIGFuIGFsaWdubWVudA0K
PiBmb3IgdGhlDQo+ICsgKiByZXR1cm5lZCBhZGRyZXNzLg0KPiArICogQGZkOiBUaGUgZGV2aWNl
IGZpbGUtZGVzY3JpcHRvcg0KPiArICogQGJvOiBUaGUgYnVmZmVyIG9iamVjdA0KPiArICogQHNp
emU6IFRoZSBzaXplIG9mIHRoZSBtYXANCj4gKyAqIEBhbGlnbm1lbnQ6IFRoZSByZXF1ZXN0ZWQg
bWFwIGFsaW5nbWVudC4NCg0Kcy9hbGluZ21lbnQvYWxpZ25tZW50Lw0KDQpSZXR1cm46DQoNCj4g
KyAqLw0KPiArdm9pZCAqeGVfYm9fbWFwX2FsaWduZWQoaW50IGZkLCB1aW50MzJfdCBibywgc2l6
ZV90IHNpemUsIHNpemVfdA0KPiBhbGlnbm1lbnQpDQo+ICt7DQo+ICsJc2l6ZV90IGFub25fc2l6
ZSA9IHNpemUgKyBhbGlnbm1lbnQ7DQo+ICsJdWludDY0X3QgYW5vbl9hZGRyOw0KPiArCXZvaWQg
KmFub25fbWFwLCAqbWFwOw0KPiArCXVpbnQ2NF90IG1hcF9hZGRyOw0KPiArCXNpemVfdCBob2xl
X3NpemU7DQo+ICsNCj4gKw0KPiArCS8qIFJlc2VydmUgYSByYW5nZSBvZiB2aXJ0dWFsIHNwYWNl
IHdoZXJlIHdlIGNhbiBmaXQgYW4NCj4gYWxpZ25lZCBtYXAgKi8NCj4gKwlhbm9uX21hcCA9IG1t
YXAoTlVMTCwgYW5vbl9zaXplLCBQUk9UX05PTkUsIE1BUF9QUklWQVRFIHwNCj4gTUFQX0FOT05Z
TU9VUywgLTEsIDApOw0KPiArCWlndF9hc3NlcnQoYW5vbl9tYXAgIT0gTUFQX0ZBSUxFRCk7DQo+
ICsJYW5vbl9hZGRyID0gdG9fdXNlcl9wb2ludGVyKGFub25fbWFwKTsNCj4gKw0KPiArCS8qIENv
bXB1dGUgdGhlIGZpcnN0IGFsaWduZWQgYWRkcmVzcyB3aXRoaW4gdGhlIHZpcnR1YWwNCj4gc3Bh
Y2UuICovDQo+ICsJbWFwX2FkZHIgPSBBTElHTihhbm9uX2FkZHIsIGFsaWdubWVudCk7DQo+ICsJ
LyogTWFwIHRoZSBibyB0aGVyZSwgcmVwbGFjaW5nIHBhcnQgb2YgdGhlIHJlc2VydmVkIHZpcnR1
YWwNCj4gcmFuZ2UuICovDQo+ICsJbWFwID0geGVfYm9fbWFwX2ZpeGVkKGZkLCBibywgc2l6ZSwg
bWFwX2FkZHIpOw0KDQpQZXJoYXBzIGFuIGlndF9hc3NlcnQoKSB0aGF0IG1hcCBpcyBpbmRlZWQg
cHJvcGVybHkgYWxpZ25lZC4NCg0KPiArDQo+ICsJLyogVW5yZXNlcnZlIHBhcnQgb2YgdGhlIHZp
cnR1YWwgcmFuZ2UgKGlmIGFueSkgKmJlZm9yZSogdGhlDQo+IGJvIG1hcCAqLw0KPiArCWhvbGVf
c2l6ZSA9IG1hcF9hZGRyIC0gYW5vbl9hZGRyOw0KPiArCWlmIChob2xlX3NpemUpDQo+ICsJCWln
dF9hc3NlcnQobXVubWFwKGFub25fbWFwLCBob2xlX3NpemUpID09IDApOw0KPiArDQo+ICsJLyog
VW5yZXNlcnZlIHBhcnQgb2YgdGhlIHZpcnR1YWwgcmFuZ2UgKGlmIGFueSkgKmFmdGVyKiB0aGUN
Cj4gYm8gbWFwICovDQo+ICsJaG9sZV9zaXplID0gYW5vbl9zaXplIC0gaG9sZV9zaXplIC0gc2l6
ZTsNCj4gKwlpZiAoaG9sZV9zaXplKQ0KPiArCQlpZ3RfYXNzZXJ0KG11bm1hcChtYXAgKyBzaXpl
LCBob2xlX3NpemUpID09IDApOw0KPiArDQo+ICsJcmV0dXJuIG1hcDsNCj4gK30NCj4gKw0KPiDC
oHZvaWQgKnhlX2JvX21tYXBfZXh0KGludCBmZCwgdWludDMyX3QgYm8sIHNpemVfdCBzaXplLCBp
bnQgcHJvdCkNCj4gwqB7DQo+IMKgCXJldHVybiBfX3hlX2JvX21hcChmZCwgYm8sIHNpemUsIHBy
b3QpOw0KPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX2lvY3RsLmggYi9saWIveGUveGVfaW9jdGwu
aA0KPiBpbmRleCAzZWE2NTEwNjMuLmI2MmQyNTlmZCAxMDA2NDQNCj4gLS0tIGEvbGliL3hlL3hl
X2lvY3RsLmgNCj4gKysrIGIvbGliL3hlL3hlX2lvY3RsLmgNCj4gQEAgLTkxLDYgKzkxLDcgQEAg
dm9pZCB4ZV9leGVjX3F1ZXVlX2Rlc3Ryb3koaW50IGZkLCB1aW50MzJfdA0KPiBleGVjX3F1ZXVl
KTsNCj4gwqB1aW50NjRfdCB4ZV9ib19tbWFwX29mZnNldChpbnQgZmQsIHVpbnQzMl90IGJvKTsN
Cj4gwqB2b2lkICp4ZV9ib19tYXAoaW50IGZkLCB1aW50MzJfdCBibywgc2l6ZV90IHNpemUpOw0K
PiDCoHZvaWQgKnhlX2JvX21hcF9maXhlZChpbnQgZmQsIHVpbnQzMl90IGJvLCBzaXplX3Qgc2l6
ZSwgdWludDY0X3QNCj4gYWRkcik7DQo+ICt2b2lkICp4ZV9ib19tYXBfYWxpZ25lZChpbnQgZmQs
IHVpbnQzMl90IGJvLCBzaXplX3Qgc2l6ZSwgc2l6ZV90DQo+IGFsaWdubWVudCk7DQo+IMKgdm9p
ZCAqeGVfYm9fbW1hcF9leHQoaW50IGZkLCB1aW50MzJfdCBibywgc2l6ZV90IHNpemUsIGludCBw
cm90KTsNCj4gwqBpbnQgX194ZV9leGVjKGludCBmZCwgc3RydWN0IGRybV94ZV9leGVjICpleGVj
KTsNCj4gwqB2b2lkIHhlX2V4ZWMoaW50IGZkLCBzdHJ1Y3QgZHJtX3hlX2V4ZWMgKmV4ZWMpOw0K
DQpPdGhlcndpc2UgbmVlZCBhbiBhZGRpdGlvbmFsIHJldmlld2VyLCBzaW5jZSBJIGNvbnRyaWJ1
dGVkIHRvIHRoZQ0KcGF0Y2guDQoNClRoYW5rcywNClRob21hcw0KDQoNCg==
