Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA89AC369C2
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 10:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7A910E1AD;
	Tue, 22 Apr 2025 10:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ExbCApL/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC9110E1AD
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 10:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745316918; x=1776852918;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ITpoTC2RMuHW0Jab+Zscq4/40DvQGxKMH1ol/wRdXfA=;
 b=ExbCApL/02okth12U9c9O/kcOy8+9R9AcUEpztmWU7GijDhcfi8SAB62
 urwaaEp95GBLq85NUEhM5uyobs8cZlfcw1ckbgIOKphryKjDcLUPSJJDF
 eZLN9pBTJOXvEckw0QsJkkUspBo0YwVTS20mTWwid9y3LnmaOz0hNxql9
 WBhVxHhDEUsmlhQ3dW3+TQKuphij5/I646Z1e8AiFSgAhlok2rmi0RXvL
 iFE6O5dbuSfY3pFMMyZFECPHJinCajML6+WO0qoM30iJpXgQLOJqNkNFl
 hAgZ3MomS6mJUE3OiVZRjIrXyvwF84pw8emiRjC8VX3JyNryofvlQTYm6 Q==;
X-CSE-ConnectionGUID: 6wwKAug8TTSeaWR8esLNzA==
X-CSE-MsgGUID: jkTESTVjT8CmB3K+d3yA+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="58236222"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="58236222"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 03:15:16 -0700
X-CSE-ConnectionGUID: KEn5qfw0Q/WrxXTcQd2jtA==
X-CSE-MsgGUID: JSANXw3LQKylgxvnlsScyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="131884912"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 03:15:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 03:15:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 03:15:15 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 03:15:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkUEHqHL8+7V3BcMJlrNThpLp0CIrZCL8xnN43Lh5JzCXew+OKRajO5EY34fDxxyK2tLx4Zpvy+HNJIlnG01WMCC35sNpTJVY9uNlUluHjAPICtkVFZEmLZzCNjVbjgWpmuHcxbmVbHXlEbVt+/z3679io06b6L18WmP9i402RpENXZmfwzcvnFOg7pblmQPwwpMIyzvqN9NyuVFD6e6IiNOxjGes6wOndWvDWnlqvfxFcnoKKnUkKx8+huTIUG3gOc+3o6BRBv1buGMsWCha8VoHMQB2sVoRc86MklHiI3Sm98Rn7do3dKDq7aXcfIrY5tOBeQsBjBm6WSICZS1OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITpoTC2RMuHW0Jab+Zscq4/40DvQGxKMH1ol/wRdXfA=;
 b=aHgvvizGoi67e10cI7zJKeGi0OGvJ/qNLXSCQ8ciSDrgMU/6IdbeJK8iAeFdEIXWZkMZUoKUpJwHNxAxfMD1IRUMmg40C160Ics7CG29ctAOHAI6hpBMKR3f77PCtBikZA7GuHog6sRub7N61cjir8JQKcXi1/J8Prbs/VpPVvtCcqweXdns/J4/lXMqjivNIdfZjVc8nHLQvuiLgnPO7tUorIVbePAigtH6Hd54YbaB1p3LJVq7LCOu1gfYTrCkqeDk4xEkugkiAGZV8wEDwr4phdFWUKk9GcAHjKLJYfTjacv/nlRxwNVzDuGaWazt6TH4LmA3nDCcq6o8I2xYSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8686.namprd11.prod.outlook.com (2603:10b6:8:1a9::21)
 by MW4PR11MB5933.namprd11.prod.outlook.com (2603:10b6:303:16a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 10:14:44 +0000
Received: from DS0PR11MB8686.namprd11.prod.outlook.com
 ([fe80::18f0:f1a2:9:1932]) by DS0PR11MB8686.namprd11.prod.outlook.com
 ([fe80::18f0:f1a2:9:1932%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 10:14:44 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t v7 3/3] tests/intel/xe_fault_injection: Do not
 assert for probe_guc_fail_* functions.
Thread-Topic: [PATCH i-g-t v7 3/3] tests/intel/xe_fault_injection: Do not
 assert for probe_guc_fail_* functions.
Thread-Index: AQHbso82iOWvCCp/YkC8h+biraNztbOvceUAgAAHk+A=
Date: Tue, 22 Apr 2025 10:14:43 +0000
Message-ID: <DS0PR11MB86869558E4E6D23029243578F9BB2@DS0PR11MB8686.namprd11.prod.outlook.com>
References: <20250421074545.5549-1-satyanarayana.k.v.p@intel.com>
 <20250421074545.5549-4-satyanarayana.k.v.p@intel.com>
 <11e9c6e9-143e-4428-893a-04e1df6735ab@linux.intel.com>
In-Reply-To: <11e9c6e9-143e-4428-893a-04e1df6735ab@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8686:EE_|MW4PR11MB5933:EE_
x-ms-office365-filtering-correlation-id: 905f9107-3e49-4285-0181-08dd818680aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aVlDbkFrOUxLVExqaGZjZFpRek1kajlDTlpWNnZyOWpDaFhVcjNwcVVGcWpR?=
 =?utf-8?B?WTdGcnBBTlFWUjVMNUhRY0F6MEcwRVZjSDZKbFNHVzMwZGcwSFBBTEJzSDlN?=
 =?utf-8?B?NHFFNHlySmtTZXMzcVkzTE5Fa3d6OHd5OWY4a3dVenhsTHdIYUlQNGdjVVEx?=
 =?utf-8?B?a3dBc0g3M2thRTdSamhhZVRGYnBPaVZSait3RXZMQkJoR1pUa0pmRHdlZTNu?=
 =?utf-8?B?ZVRZZkpZbGxmdWQwdjdVWXo2Y1p1eVBzUndqV3lNRWJMRmt0YmllUTJTbmpt?=
 =?utf-8?B?RjltV2d0b2lLN1RPYlZmMEVGMmVxMzFVNmtRMkQyeUhyTVFTNEozYndGUVVW?=
 =?utf-8?B?K2JyL2tUZGYrQUlFa0dLb0VBSVVXbDh6T25jcXQ1dTFZVyt3V1luN0xodkh0?=
 =?utf-8?B?RzZaeGJabmx1Sm1jNGhTN0xONEVyd0Z5TmwzeXZiVGQyb1ZpTWRZRHRVeTNU?=
 =?utf-8?B?RHEySzJFMXBnZFBxK3VPckdQbDlMS0Vvekc3emwvM0pEL2Q5VTJkZHZWR3BG?=
 =?utf-8?B?S1ZxSnRXTG1kUnY4VlBBU0twSlBXUy9oaUEwK1VVKzVFOTJRSFEybEw5OGk4?=
 =?utf-8?B?MjZWMkxyK29CbDRQd0gvWXdidlRzd2JJN3pZOHNrSTJZa3NFRnNDV0RTdkw0?=
 =?utf-8?B?MERaUTNtSXlZWENPenpqYXk1NHBGalBka1QyT0V5VzVUNXFQZFV3YXJNejJB?=
 =?utf-8?B?OTdtWllwTUpCTUcvSHMxSnRQZGFLQkplYTZ3ZGE1MUYxY3ZkbG1hZENqN2RB?=
 =?utf-8?B?UVNEWS8wQTViT0oxU2tnWUpyOVJtN1FxZDQvazFueld2MjFib0FGRTVTSWFG?=
 =?utf-8?B?TlJ2OXU4OWg4eTJDeFlzSk9TUi92VUJhekZkdUJCSDBlbk9IN0liZVFteDJ4?=
 =?utf-8?B?T3NPeXZuK21pRmNHV0doOEU4Q29zQ3kyTU93c3hSdzV0K3crMkg3ditKdHhQ?=
 =?utf-8?B?cVFKTkZVS2lMT0l4UllNTUswUENNcEhRaHhCb3Jyek1NRitWN1Vxc0I2amVO?=
 =?utf-8?B?YlRZSGhwZFBnTnJTWFBsVkpRQzZYMmtqWW9tZGp3RXhnZ3JxSzJKOTNvRmU5?=
 =?utf-8?B?dUNQcUd3ZEdRRGZxL0k5aXNiTFU4NktuV3REN3duNE9mMGZtc2lZYmpkYWNH?=
 =?utf-8?B?cUdIM3JQeEM3K1FLTUZ3bEJkWDFIMzJuWlBZbTE1dSsxb2Mvc2dESkw2UC9D?=
 =?utf-8?B?MjhKbXc0S00zSDNKL0ZydThTUDJ5WE5qcGJLa01jWmMzS2w0OUZXZFoxUk1K?=
 =?utf-8?B?SjFNZkEzcUl3OTBSYjJaZzhnRmh1dENPeVdldWUwUlA3cyt4V096SlcyTFRM?=
 =?utf-8?B?RHcrMzYrQXAzcmhDNkYzdHZlNXRvZGV4c0ovM3NGSEY4eHdYMWwvT2ZYMEsy?=
 =?utf-8?B?NDk4a2s2R2d2WkRYb3FFNVZSNHZqR29hUnhlNEdBT0d6WTNKUGlOaE1ZeVVO?=
 =?utf-8?B?eTZqMW94UFREcWpPWUc2cUZha2hwSTcwY2FTS0R1dEdyZllSbTNEOGhnZU9n?=
 =?utf-8?B?WTN0azhiZ05ZUHlZSW1hK3hobnZ3R3poRHc3dnBmUkhES0cvTlRFYm5QSWRm?=
 =?utf-8?B?K2Y2Z3lPS0pqdkxLa241dGkveHpsSW96SkxDTjR4ajRYRCtkU2RDUmZCY2kw?=
 =?utf-8?B?amx4KzhwNU1jeE9CMTBPb2kxSlFQb28rRWhVcWxaMG5KZ1NWU2RvY25obFIv?=
 =?utf-8?B?UTVzY3NUOWtQcGVxV21oZm4vaUkvR3ZyRHl3Z0VmenZTeURrN1k2NUZob1Rw?=
 =?utf-8?B?ZzNURWR4WEdMWjRMM2h1c2lmQ09mcDlUbURZQzlHUVlsNlBYUGpFNnhRcExR?=
 =?utf-8?B?NUtvdUphd3JvK3praHZHWGcwV1djOE1xYnBkbUpySzNjS1ZYTHNXdnRmVVFE?=
 =?utf-8?B?b2RZVVUxVDdWaElrOVc1amNINzZxcFphb28xNVJlZS9yR3BhUkRYbS84eWpV?=
 =?utf-8?B?UEppdU1TZGRvTFNtRm9JbGw1L3phbGx6bk9SN1JDekJhcGd5dUFIVVdwYXcz?=
 =?utf-8?B?enYzV1J1YzFnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8686.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anJUbXBVcG1TcjMrQmRwOFZ2Z0VBeFNSdDMrQnJQSlpvSVB6d1Z2NjhUU0Rx?=
 =?utf-8?B?Rnk2QituNkd6T2lLWko3MWVqd3RBNHRSZDJpMnRvbERQVm5qaUkxUHV5QmFQ?=
 =?utf-8?B?eXdHVmxtaWRya2txYkowcE5nMDhzUEFOTFZMa0RtNjFMeFFEOVVXWnN0RWRS?=
 =?utf-8?B?ZUNYbzVCUWUvSzdMTTVsbEFETCszenJGUFpJRHhoQjgxbE1uTSs4cFRLVEdF?=
 =?utf-8?B?RnRVbS84dUNNaEVvQjdjem9uelAxZnJueFRTWEtwZ0FBdUlPWXNMTFNwMUFr?=
 =?utf-8?B?ZE0zZWtUak5HeDduUGkreFBwaVRySWtpSVhEaG9xR2pFbS9TQUpjeWdlcVJ2?=
 =?utf-8?B?a0RWQjZUN3ZQNnBIWE9wUFh3ZFkxSWhLcU1ZSzhBbldoTTdHaUJiMHYvNHZ5?=
 =?utf-8?B?TlVGQTZpR1cxdXpJV3NRYWFFSEVyVjU3ZGVOZkJLcDRORHZjalQxK3U0R3l0?=
 =?utf-8?B?ZFhhaU1UbHV2Y3pUSzRuQ2lFc1ZCSGRhSVc0UUt0Y2plNHE4bTV0cnNYcnNx?=
 =?utf-8?B?S3JJK0hCYmdOeDlJL2FDN3A3Sk1vYm9mSDcyaVBKSDlJTENKSXRtRVVQMktP?=
 =?utf-8?B?VUpIeGV0eGV3by91U3ZkQURMV3FzbTFXczh4K2tyWnYvUDhGeUp5ZWlaM1Yy?=
 =?utf-8?B?WkgvMG1aZ2hsZmI5Q1M0WUk0MjZxUGhGK3dkMU5INjZ4eFF6RDNSbnJqMlh0?=
 =?utf-8?B?d09VZlFtZk9IbE50ZXRZQ0NtMjh2UHV5SldVNkFQTGNubmNsZXFjemtmVzZD?=
 =?utf-8?B?S3NpUkMzdlRSVWI1Z2NRVGNVaG9zbS80djNXdkFPU0hWVUhSTjJ1MXU4SFBB?=
 =?utf-8?B?cVZVNElWMktRUXgzcmJzdmRKa3BRT3J0aEpIYXVjV296NmplVkpQZkdCNVVW?=
 =?utf-8?B?KzBNVGx5RjlUWEY3UlB1R0RuTFhHeVFvVEJWTHpZZHVNS3hMcU0vV2RnWjNP?=
 =?utf-8?B?Y2tHUWdrSFVrZXFPbTBGajBFWXpFdFJieXl4d3pwVmNZSnFHWG9xcTNwam9h?=
 =?utf-8?B?cFN5SWd5MGpYUVpQcUpGZmpyc2tINTVMR0lYdUtTS1c4RzBpTnRiTU5hNkdt?=
 =?utf-8?B?QkJjWnRvRVlaMjJXQmxTWmtNcTV4eUh4NHVjRzgzMWdFZStKRzNRdHY0Qlph?=
 =?utf-8?B?b0czWndJWFJEb1FRb0hCalZDUUhiZTRMYnVyZjhOUG42RnpwVzlxTi9Ianpo?=
 =?utf-8?B?dWtlUFpNUFNGUHRrKy9haXRuMnA2bHFBT3RmNjlsUlIyU21ZTERjVE5Uckl4?=
 =?utf-8?B?cW0xOVUwc1NrNkVQOGZNUkRVUzBzNHQyOWJPZ0F5U0RlTmlRZXN0YTRVZjdW?=
 =?utf-8?B?ZEdvQlhxTGZtWEpIbXJyQUw2ZFpXQnhqZFgzb2lEVlNxQW5VOElQS2hFSnM1?=
 =?utf-8?B?K0hqTnMvK2FMckxNd2h4c3ZjOThBc3p1N2hlTVlOVzh5dDdKaTF3YXErMlNz?=
 =?utf-8?B?aUNxUlBFQ1ovRjl5Ky9od0tQWHViOFlRQW50NWdCekJjOEtnQWdGSXBJUTV0?=
 =?utf-8?B?aWdlYnVqVE5aL2JpdG15Nmk5aEJaaDIwdWdqRDQwcWlHdlVFb0RUUTNPMjNo?=
 =?utf-8?B?WjUzdmJrdzkzQThRM2l2TEkvOEZjaEtUK1JnVjMvalg3VGJ4TDc2ZlEvN1pz?=
 =?utf-8?B?Rkk2aVlGVFMvQUdZYjl6dnNsUUIxa1o5QVZnYTVTeTBpVVVxUkRHVkhCaFlW?=
 =?utf-8?B?cGlKU0E1citkRmpSbjc4T3pac1VSYTBBakJLbzdudzNvMVN5emdMTFNlbXE0?=
 =?utf-8?B?bGpSYmJpTDJhRy9KZ0JvVWdPcmxpU2VjaVJ4OHU2Z0hUdkJRMzhRTnB2dUt2?=
 =?utf-8?B?WFVzTC9pcjNkRGc4WWthZXZNZS9xbUpKVklSbHBRVWRoMXNOYjd4TGNvR2RW?=
 =?utf-8?B?Mnp5VlZmSzh2cFEvTmtpL2hRVEEwb1FSdS9KblV3WlA5UWhvZXdRMGhNNEZx?=
 =?utf-8?B?dkl2TjVjNm5sejBLa0RTVXdWMUhvMlBabDdwdEFLdVZHbDJtSys3UVFMb1B6?=
 =?utf-8?B?MVUxajhCeGZjNENrL3lvaFlHVmhCRFNsUHFaK1g3UWQxazFDQ2VRV3BGbkdD?=
 =?utf-8?B?MGRUYm9rNkpTRmtRdFovU1N6bFNHODJCOWMraE1CcDc1WXhKTkhOd2hmMUhj?=
 =?utf-8?B?YzZRZzNFRVJYdGtsUXRLKzVmTTZ2Um03NnFZT3pvU2FRN3NJay9YaXdaVHl0?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8686.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 905f9107-3e49-4285-0181-08dd818680aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 10:14:44.0502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X/JLZjN/MX3jOlCJleyHaAwivvS0IACVzXm60ohkl603Z72aPgGJh433bHqS/K5gElzK5g2NxQ9X7xPiSb+mWXIyrjSGoQLltPz4HKSTuR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5933
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

SGkNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVybmF0b3dpY3osIE1h
cmNpbiA8bWFyY2luLmJlcm5hdG93aWN6QGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogVHVlc2Rh
eSwgQXByaWwgMjIsIDIwMjUgMzoxNyBQTQ0KPiBUbzogSyBWIFAsIFNhdHlhbmFyYXlhbmEgPHNh
dHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29tPjsgaWd0LQ0KPiBkZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+IENjOiBXYWpkZWN6a28sIE1pY2hhbCA8TWljaGFsLldhamRlY3prb0BpbnRlbC5j
b20+OyBEdWdhc3QsIEZyYW5jb2lzDQo+IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIGktZy10IHY3IDMvM10gdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5q
ZWN0aW9uOiBEbyBub3QgYXNzZXJ0DQo+IGZvciBwcm9iZV9ndWNfZmFpbF8qIGZ1bmN0aW9ucy4N
Cj4gDQo+IA0KPiANCj4gT24gNC8yMS8yMDI1IDk6NDUgQU0sIFNhdHlhbmFyYXlhbmEgSyBWIFAg
d3JvdGU6DQo+ID4gSW4gdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24sIHRlc3QgYXNzZXJ0cyBp
ZiB0aGUgY2FwdHVyZWQgZXJyb3IgaXMgbm90IHNhbWUNCj4gYXMNCj4gPiBpbmplY3RlZCBlcnJv
ci4gSXQgaXMgcG9zc2libGUgdGhhdCB0aGUgZXJyb3IgcmVjZWl2ZWQgaXMgdHJhbnNsYXRlZCB0
byBvdGhlcg0KPiA+IGVycm9yIHdoaWNoIGNhbiBiZSByZXR1cm5lZCB0byBhcHBsaWNhdGlvbiBh
bmQgaW4gc29tZSBzY2VuYXJpb3MgZHJpdmVyDQo+IHJldHJpZXMNCj4gPiBpbiBjYXNlIG9mIGZh
aWx1cmUgYW5kIHNvLCBubyBlcnJvciBtaWdodCBiZSBjYXB0dXJlZC4NCj4gPg0KPiA+IENvbnNp
ZGVyaW5nIGFib3ZlIGNhc2VzLCBub3QgYXNzZXJ0aW5nIHRoZSB0ZXN0IGluIGluamVjdF9mYXVs
dF9wcm9iZSgpLCBidXQNCj4gPiByZXR1cmluZyBlcnJvciB0byB0aGUgY2FsbGVyLiBDYWxsZXIg
Y2FuIGNoZWNrIGFuZCBhc3NlcnQgaWYgbmVlZGVkLiBUZXN0IGRvZXMNCj4gDQo+IHJldHVybmlu
Zw0KPiANCj4gPiBub3QgYXNzZXJ0IGZvciBwcm9iZV9ndWNfZmFpbF8qIGZ1bmN0aW9ucyBhcyBk
cml2ZXIgc29tZSB0aW1lcyByZXRyaWVzIGluIGNhc2UNCj4gPiBvZiBmYWlsdXJlLiBUaGUgbWFp
biBpZGVhIG9mIGluamVjdGluZyBlcnJvcnMgZm9yIHRoZXNlIGd1YyBmdW5jdGlvbnMgaXMgdG8N
Cj4gPiBjaGVjayB0aGUgcm9idXN0bmVzcyBvZiB0aGUgZHJpdmVyLg0KPiANCj4gTG9va3MgZGVz
Y3JpcHRpb24gbm90IHJlbGF0ZWQgdG8gdGhlIHBhdGNoLg0KPiANCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFNhdHlhbmFyYXlhbmEgSyBWIFAgPHNhdHlhbmFyYXlhbmEuay52LnBAaW50ZWwuY29t
Pg0KPiA+IC0tLQ0KPiA+IENjOiBNaWNoYcWCIFdhamRlY3prbyA8bWljaGFsLndhamRlY3prb0Bp
bnRlbC5jb20+DQo+ID4gQ2M6IEZyYW5jb2lzIER1Z2FzdCA8ZnJhbmNvaXMuZHVnYXN0QGludGVs
LmNvbT4NCj4gPiBDYzogTWFyY2luIEJlcm5hdG93aWN6IDxtYXJjaW4uYmVybmF0b3dpY3pAbGlu
dXguaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0
aW9uLmMgfCAxMiArKysrKysrLS0tLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwv
eGVfZmF1bHRfaW5qZWN0aW9uLmMgYi90ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYw0K
PiA+IGluZGV4IGQ5NWI1MWYyZC4uYWU4Zjc5YWVlIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2lu
dGVsL3hlX2ZhdWx0X2luamVjdGlvbi5jDQo+ID4gKysrIGIvdGVzdHMvaW50ZWwveGVfZmF1bHRf
aW5qZWN0aW9uLmMNCj4gPiBAQCAtMjI0LDcgKzIyNCw3IEBAIHN0YXRpYyB2b2lkIHNldF9yZXR2
YWwoY29uc3QgY2hhciBmdW5jdGlvbl9uYW1lW10sDQo+IGxvbmcgbG9uZyByZXR2YWwpDQo+ID4g
ICAgKiBAeGVfd2FfaW5pdDoJCQkJeGVfd2FfaW5pdA0KPiA+ICAgICogQHhlX3dvcGNtX2luaXQ6
CQkJeGVfd29wY21faW5pdA0KPiA+ICAgICovDQo+ID4gLXN0YXRpYyB2b2lkDQo+ID4gK3N0YXRp
YyBpbnQNCj4gPiAgIGluamVjdF9mYXVsdF9wcm9iZShpbnQgZmQsIGNoYXIgcGNpX3Nsb3RbXSwg
Y29uc3QgY2hhciBmdW5jdGlvbl9uYW1lW10pDQo+ID4gICB7DQo+ID4gICAJaWd0X2luZm8oIklu
amVjdGluZyBlcnJvciBcIiVzXCIgKCVkKSBpbiBmdW5jdGlvbiBcIiVzXCJcbiIsDQo+ID4gQEAg
LTIzNCw4ICsyMzQsOCBAQCBpbmplY3RfZmF1bHRfcHJvYmUoaW50IGZkLCBjaGFyIHBjaV9zbG90
W10sIGNvbnN0IGNoYXINCj4gZnVuY3Rpb25fbmFtZVtdKQ0KPiA+ICAgCWluamVjdGlvbl9saXN0
X2FkZChmdW5jdGlvbl9uYW1lKTsNCj4gPiAgIAlzZXRfcmV0dmFsKGZ1bmN0aW9uX25hbWUsIElO
SkVDVF9FUlJOTyk7DQo+ID4gICAJeGVfc3lzZnNfZHJpdmVyX2RvKGZkLCBwY2lfc2xvdCwgWEVf
U1lTRlNfRFJJVkVSX1RSWV9CSU5EKTsNCj4gPiAtCWlndF9hc3NlcnRfZXEoLWVycm5vLCBJTkpF
Q1RfRVJSTk8pOw0KPiA+ICAgCWluamVjdGlvbl9saXN0X3JlbW92ZShmdW5jdGlvbl9uYW1lKTsN
Cj4gPiArCXJldHVybiAtZXJybm87DQo+IA0KPiBJdCdzIGJldHRlciB0byBzdG9yZSB0aGUgZXJy
bm8gYWZ0ZXIgdGhlIG9wZXJhdGlvbiBmb3Igd2hpY2ggdGhlIHJlc3VsdA0KPiBpcyB0byBiZSBy
ZXR1cm5lZC4NCj4gDQpGaXhlZCBhbmQgc2VudCBuZXcgdmVyc2lvbi4NCi1TYXR5YS4NCj4gPiAg
IH0NCj4gPg0KPiA+ICAgLyoqDQo+ID4gQEAgLTQ3MCw3ICs0NzAsNyBAQCBjb25zdCBjaGFyICpo
ZWxwX3N0ciA9DQo+ID4NCj4gPiAgIGlndF9tYWluX2FyZ3MoIkk6IiwgTlVMTCwgaGVscF9zdHIs
IG9wdF9oYW5kbGVyLCBOVUxMKQ0KPiA+ICAgew0KPiA+IC0JaW50IGZkLCBzeXNmczsNCj4gPiAr
CWludCBmZCwgc3lzZnMsIHJldDsNCj4gPiAgIAlzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19p
bnN0YW5jZSAqaHdlOw0KPiA+ICAgCXN0cnVjdCBmYXVsdF9pbmplY3Rpb25fcGFyYW1zIGZhdWx0
X3BhcmFtczsNCj4gPiAgIAlzdGF0aWMgdWludDMyX3QgZGV2aWQ7DQo+ID4gQEAgLTU3Niw4ICs1
NzYsMTAgQEAgaWd0X21haW5fYXJncygiSToiLCBOVUxMLCBoZWxwX3N0ciwgb3B0X2hhbmRsZXIs
DQo+IE5VTEwpDQo+ID4gICAJfQ0KPiA+DQo+ID4gICAJZm9yIChjb25zdCBzdHJ1Y3Qgc2VjdGlv
biAqcyA9IHByb2JlX2ZhaWxfZnVuY3Rpb25zOyBzLT5uYW1lOyBzKyspDQo+ID4gLQkJaWd0X3N1
YnRlc3RfZigiaW5qZWN0LWZhdWx0LXByb2JlLWZ1bmN0aW9uLSVzIiwgcy0+bmFtZSkNCj4gPiAt
CQkJaW5qZWN0X2ZhdWx0X3Byb2JlKGZkLCBwY2lfc2xvdCwgcy0+bmFtZSk7DQo+ID4gKwkJaWd0
X3N1YnRlc3RfZigiaW5qZWN0LWZhdWx0LXByb2JlLWZ1bmN0aW9uLSVzIiwgcy0+bmFtZSkgew0K
PiA+ICsJCQlyZXQgPSBpbmplY3RfZmF1bHRfcHJvYmUoZmQsIHBjaV9zbG90LAlzLT5uYW1lKTsN
Cj4gPiArCQkJaWd0X2Fzc2VydF9lcShyZXQsIElOSkVDVF9FUlJOTyk7DQo+ID4gKwkJfQ0KPiA+
DQo+ID4gICAJZm9yIChjb25zdCBzdHJ1Y3Qgc2VjdGlvbiAqcyA9IGd1Y19mYWlsX2Z1bmN0aW9u
czsgcy0+bmFtZTsgcysrKQ0KPiA+ICAgCQlpZ3Rfc3VidGVzdF9mKCJwcm9iZS1mYWlsLWd1Yy0l
cyIsIHMtPm5hbWUpIHsNCg0K
