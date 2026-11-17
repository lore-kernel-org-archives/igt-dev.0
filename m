Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6452C606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 17:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IBz/2xqL;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Vu/U2iqY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BC010F87A;
	Tue, 17 Nov 2026 17:55:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B5810E08D
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 17:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794938067; x=1826474067;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Gf9tC2uQHcreF5sf5Q23Z+fFdvOYOyS8aosM/BN3yXM=;
 b=IBz/2xqLKx9MnoDJ1QvmCVNwX4HlFFG1F0uUEHllEfcs8nM0SZeFuyCS
 euhUkc9f1o5yj69haobUBkAq6tchazoM2uylrY60ZbvYLRDysFvrBg7mY
 R72szlJDetzdqfhEcmLVL57fXpZJyoSoGu3cwjxp4XPSYfXoS9O0o82Cm
 qBrhfED4grtrOCV8Gr8WpCQVqF/hXq2IVwafP50VPGKNLZw+TrX0xhoEC
 gfij9GRpROvnm0UqIbfHtoQpkX4awUmnzdAWK0F8CKbYCHkVgwG6WzEvD
 QrXy4pKZZAkpVgXWkgDMDRPt0521mEMmWsQPToBcL01H2MVKW+ExDW9rp Q==;
X-CSE-ConnectionGUID: wWQpJQ55RpWIXrBZ9C79ZQ==
X-CSE-MsgGUID: xoNPwBY4R9yVsaBchnaFHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3645638"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3645638"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 09:53:54 -0800
X-CSE-ConnectionGUID: xlaNmVFqQHSbM2OyLx8oGA==
X-CSE-MsgGUID: QkSKj5V3R0yDCQZ0Bbk5Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9841556"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 09:53:53 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 09:53:52 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 09:53:52 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 09:53:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vb87YCppKSWao9VH+8fZ+p69zwUR95P3IWIUBYyBz+69dAf0oMsVWvvOswYKYU73c4IBS6ynhF2O5XQkjWIuy5UkXp+0G/I25Ps7u+WbKbjZz2CHtMYkoc+FPo0K4Z1+WAPT6+FkpMdQ/mNT2kn4AT0hWCj7Y1cZoysrzGFE2DnEDAj+IHd5kqV0yGLws7Pe1kqp9Tsk9yWuLbkLnufefOMnhYBiVpSsptnikM3zf6IFZUYo9J0/+fw7smb+078zavoPGQFMCdOi2dzxPpQ3HqboQBV4kV6hUXdWVnbbznmYIFNvTHvxTPacZ2zYk+dzFV5TVPIKtI1ON5m/SAiMkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LKIBlvEmn+djBsZSUEgY5x62VcYaNCwjN6aeQR1IXM=;
 b=vApuK9HpMnL0wJHX2ogvcJ4Y0zkZlzhbbERSc0TfLP2oy0wmMvlj3e7R9B7dHaq44H3gFzeLdmH4Q8V9Wi5AwGslPOGp5NvGZnCvcZxgrGff6HHGcO4nE2tnbOakESIlfoqeJtfuLriAS5Q7cg30B+5kcAJfPgSYpIGtCe/csQb/lcIWjljb0vI90ZprW5Kg+rFdJk01b9oL6QhHwfeDCTQgTZlCBLtmvwWhnXA+WKwZjTxSauaNsIFsuF7REmlKr2EJ7UVOA83tIOpw5gBKRMQwJcYXaO0xdGYrwlmOgdZmLEUXzs5KTCOcLzx36B8EtdweqSikGEi4sy++Go8HdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LKIBlvEmn+djBsZSUEgY5x62VcYaNCwjN6aeQR1IXM=;
 b=Vu/U2iqY998JvUdiHzSbPmKUpPFDF1fQxfQjnyDZPbsVoi2ItvznpJNUpq6qxqiptXKn0dyZYC7ef+0x25VfjTS82ON2stlqNgkMc4SNCHXgC/oNXhBV9DZAMOA300vHJhJ29scYWS2KAeQvchzuQkq3IG5nCuFgcKax4HGP8Ss=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS3PR11MB088214.namprd11.prod.outlook.com (2603:10b6:8:43e::10)
 by DS4PR11MB088494.namprd11.prod.outlook.com (2603:10b6:8:509::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 17:53:49 +0000
Received: from DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3]) by DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 17:53:49 +0000
Message-ID: <91e1e755-c450-4fec-abeb-23c81070c7cc@intel.com>
Date: Tue, 17 Nov 2026 23:23:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_configfs: Avoid leaking configfs
 device groups
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <riana.tauro@intel.com>, <badal.nilawar@intel.com>,
 <kamil.konieczny@intel.com>
CC: <anshuman.gupta@intel.com>
References: <20261112061324.906135-2-soham.purkait@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20261112061324.906135-2-soham.purkait@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0284.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::9) To CH9PR11MB309436.namprd11.prod.outlook.com
 (2603:10b6:610:339::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR11MB088214:EE_|DS4PR11MB088494:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c024e5e-0b28-4a28-a602-08df44d3bbf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|261009223027099003|11063799006|56012099006|261102123227099003|261028144727099003|10067099003|261026140227099003|261021121427099003|261022105027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: vQqZtoxxedcFacSeK69FL/uCzV4nougrJwjIZ7fDj9wKvwEW+mgzpMooWrB6CLbpjV8vQfvWRrScWVYoZCc69R2Vt9wW9AikmQYNJq8/bHSU8KiV/S0y0Q1VOreFlvsMsiRdI86gy9zFtHEYy/sI4XysbypEDua1k6yo6zW4L/+W5wG3mWy+9kSpzROVM3r4ubV/6IF0Ttt6BjNb3NKNnvG+F78sdJ5T93JmMJ/H6UqVne0F9P1mCNUwG2Vj+hZY2aRQA0TyB4RdsP3x3+2P8gaeUPiplqRp2E0Suu/+QRdSMTYX9rEbB4zfmjFNsRojgFStoKR6MlrXPuVfPmejJrcT551Kuq4ZzOMbmcWToe24IMewwG2bjhwMz7gcQMAH3phPIuAx9kGrAIwiIp2kKL+wuuIrf9MX3aCSSXmNTJLAYkI0guYBSqi5dDuYiFY2i4uTzf9pEOkrKjes3BAUzzma9bONCAawWYGw/qoje1/xY2raL+Rsz7hXs0AVsf85aBiJM/5efepThVB+YDBWst8pmaYqiurrhGXnCGvT1/pdKE1TKaq8HVuomT8e3247cUPEgkRk/immZ8pI6R+YcWr9RFbQWhx8qHHt2XRm56z1g8PM8roDbJMGQSctyEbsh4p0bpouI75Yz3LqYxoV+KGhi7jYM7Ry7EYrZwoxEx0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS3PR11MB088214.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(10067099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021123027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTROTnlHV0xydTk3M2UyNmhTSHhOSjZ1anRiUkkxUjA3aHgxYkNCNzIxQmJG?=
 =?utf-8?B?bkRyaTBFd3pPNGd1ZGlqYmRpUjJGOGtOaE1rRzJ1YjdPVk8yM3VqMHBTanlv?=
 =?utf-8?B?YXVlOU1CUXlVSWtvcTkvaFI3czAwdS9hUHorTm9tektYWW92MTBPbkJBZ05i?=
 =?utf-8?B?dHNzMlFVRkZOZ3kvcmhqdjRWd2dVZGRHc2FEbEw0dzRSN2p2aXlQMFZQOFJO?=
 =?utf-8?B?SkEyK1E4Tmtpb3Z1bHg2bkVPalEzUDVsTFN1b0pIbHNJVHJoN3FYYVdrRzlG?=
 =?utf-8?B?THVnSmo0djA3TjNOSk1IVExVMy9USU1aT205eFBXZHZRWlowVFVkYW9hbTRG?=
 =?utf-8?B?NXBlOXFtZWlZU25iRTMxTFIrMG5hR3A1RTMweGVSK1hoYWVsZWorNkFTZzVP?=
 =?utf-8?B?dHVSR3M1RVU3WExoWkRnUHRhbW5PdUpxemVyRURHSUNUOVJianpxL2RDYk9O?=
 =?utf-8?B?SWRzTDM2L3VZandUZFlJT2pINXg5RVVmeGs2TElGSGdBN2VHUml3VGtIUnVG?=
 =?utf-8?B?cVdqZWlQc2l0R0RDeVpVMVQ4Z29Gd2doaTBVQitTbGpRUlBZR2hiYjhSdG0v?=
 =?utf-8?B?Q3dpdlFuVFRQY3k5WUFWUHNYZVI2L2NsZ2sxTHF0ZEhhZGNPc0laTWJqRHhG?=
 =?utf-8?B?WGlqdHhaSGZJbE01MmNwVTU1SEFmZnlBYlVlNmdTSjhBWk1ZL1dySDB6b3B5?=
 =?utf-8?B?alEvdDBVOHBHTnBxT09US0xtdHVNSWtKMzBDcExPNzZ0bzBEV0xNNVBBSGZE?=
 =?utf-8?B?YStIMjF5dnJRRDVRYkJnWGR1OFdNMlJnZUoydVZQWElXRUo2L0lnUkZrYWZV?=
 =?utf-8?B?bDlsVkZsa3FnZnJacldMSXl3N0dtcVRWbTE3YXo4Wi9NOUozcVZLcFo2bG9N?=
 =?utf-8?B?dndnZ3d2czlRdHZiL0szcDc3Y0M0d0I4MTdvTHZ0Y2tnSG9Ba3ZBUVl5ajZK?=
 =?utf-8?B?dVFJTHY4WlVDRlUxZjhGa0tsMXNWeTArM1F6TWVqUnBvSTB0c2M5SllURkk5?=
 =?utf-8?B?aXVnSjRqSnFTWjNBKzVHS1pvam9uajBkNkRuelIxbEJsbWlzYklFY3VJZjNj?=
 =?utf-8?B?aXRFTUx2d0RrOXE2MXZmZENmamhiTXFucjJwRzRFcGtMWGdCNjQ1TERyaGJG?=
 =?utf-8?B?YkVJNVpCVGlhTmdQTlg0bWFhbE5SNXlNYU03dGxoZEZ3NmdoamlqUDNlemVJ?=
 =?utf-8?B?OGFQSHpiRVN0UG9PY3FJczZFdTN3YU15YVRWYUgwM1Y4SWlhdCtTZWZhV1lC?=
 =?utf-8?B?enBqQUQ2VkRBcWpmZHR4OHA0R2h3R0U2RXkzM2xSTk5ZcnZWMVRkUFY1bUxC?=
 =?utf-8?B?a2NVMkpiaFBXMFRuQ0ZiT2hXZzVQejBwUjhaWVdsSndzR1c3aVl1bTMxWE52?=
 =?utf-8?B?ZEdkNUI1aGxGd0FyaXNMY0VtQXRLTkRpZDRTRkRjM1hSMmpHaXdoV3IwREdX?=
 =?utf-8?B?blhCSkd5dEpvZXUvK280VVpzTk9xYU5XMXBpRkZqNjFJVHNZdnlEeDc2Yndy?=
 =?utf-8?B?SWZKUytRN1IrcnUxMjUxQkduL1oyaGVralV5ZWNPMEhzZ2lrNC9LdUFHR0xC?=
 =?utf-8?B?dFJUY3JtcjFSTjgxOXpaaHMvK1hHNzNtN2RIalV4NkhsVlEybHFZdW9IWEhh?=
 =?utf-8?B?KzQzN2daQXQ4YzZxbXJvMlI1M3ZFeWp2YkJ1ZXRBSS9XenJaZWxVZzFCUzcv?=
 =?utf-8?B?d2lLRUU3YTd4UUZKSm1ITXlQQ0U0c3ZaMGxLSXR2VHpDc0xYUWQ4OFh1ZXpQ?=
 =?utf-8?B?WTlkL2k0eEFlM1BpZkJPZ1FoVU5oTDdMMnkrOWFldDFhK2xIU0VBdlZlVWp1?=
 =?utf-8?B?dFdiMWpwMlpOQmFGT3FQUmpEK1pmbVVvRGN6M3E1WFhRa0drQ084NlEyNXhy?=
 =?utf-8?B?VjBBbDBGU3RsMk41V3ZYSXFLVDExcXo3VlZpakRCRkliZGQ3Uk5jamoybFlv?=
 =?utf-8?B?ZkhtWXpXUkU5WEV5RnB5dmcyaTVkcFhuRE43SHZ0SlMyWGdMbTNuWlJGZDVY?=
 =?utf-8?B?TExSZmlIc3daVTNlOW1IRnUwNXdwL2xqSzRhODE2M1dkRmhtSkNyUGVFMi84?=
 =?utf-8?B?NksyUHVXUEF2MHllZ2FmdDQwYitFeWU5dkZwa2tEdDEvNldyVGRHZjJYbTNw?=
 =?utf-8?B?WTJjZVJIMmJjblhhN0FCUVNHaEdNcGU5aG1YMnVDVEtHL0pUMDE0cXI5ekFL?=
 =?utf-8?B?emxnUlBraHArNzAvQTBuZVdVaE1BZC94TjBMN3h1Y3E5TE53V2ZOOWhNaVIz?=
 =?utf-8?B?bXE5ODFPbko0dGp3Ym4xUklYcDFXeXhhbHpJVUFQODFjWEFMQW1OZVdxZDBJ?=
 =?utf-8?B?U3pwdk12eHpRVUh0dVhnMVlic2JiQi9WODZDOERHWTRHeU5zbjFGQT09?=
X-Exchange-RoutingPolicyChecked: D+LrkPes9hbp+skfscQyqQw96FI5ILHtezlgd5KmHKSd5QsupSuS/FxoMFSRK5EGuUXgG3TYqpW2+M6Jr4dYLANQyVa9RNC25QuX4zKDzAJU2vT3oEk3tKdUIv9NKiEpNtCkHgdSm9CUXksgdrozkkbKkUMxPT3998swp1CgTMNUZ2h/jqa9tBgpdMVgPhYJiSWQnFKDIr0wZuj2wAQw/O39toakfc4qUdpMfjZsWNEN4rCZTU4zUI5RH94mqsTr9bGZoIHYGWy9zQy61yLkzr7RvaReROcIzlJaiY/3g4GVloIOa+RnASjA+nW0VPkxMVNu5M/YgcbadcSST5LSQw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c024e5e-0b28-4a28-a602-08df44d3bbf2
X-MS-Exchange-CrossTenant-AuthSource: CH9PR11MB309436.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 17:53:49.5520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OIkWhGdC2wQGNYPe6TJORB6PFDGCZ/k8th4nzJlB2JvFcPK+zQ0CK0T7Ysi9JWyDiyQ7Kf2d3B9+jsNMbqQ+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB088494
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Soham,

On 12-11-2026 11:43, Soham Purkait wrote:
> Reuse pre-existing groups without removing them, and clean up
> test-created groups and fds in the configfs and survivability tests.
Check the patch subject as you are modifying xe_survivability.c as well 
not only xe_configfs.
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   lib/igt_configfs.c             |  3 ++
>   tests/intel/xe_configfs.c      | 86 ++++++++++++++++++----------------
>   tests/intel/xe_survivability.c | 37 ++++++++++-----
>   3 files changed, 74 insertions(+), 52 deletions(-)
>
> diff --git a/lib/igt_configfs.c b/lib/igt_configfs.c
> index 7bbeca746..ef0ba3ba5 100644
> --- a/lib/igt_configfs.c
> +++ b/lib/igt_configfs.c
> @@ -106,6 +106,9 @@ int igt_configfs_create_device_group(int configfs_fd, const char *name,
>   	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
>   	int device_fd;
>   
> +	if (preexisting)
> +		*preexisting = false;
> +
change the function description accordingly.
>   	device_fd = igt_fs_create_dir(configfs_fd, name, mode);
>   	if (device_fd == -EEXIST) {
>   		if (preexisting)
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 68daed690..534eb239d 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -25,7 +25,8 @@
>   
>   static char bus_addr[NAME_MAX];
>   static struct pci_device *pci_dev;
> -
> +static int configfs_fd = -1;
> +static int configfs_group_fd = -1;
>   static bool configfs_group_preexisting;
>   
>   static bool check_registers(const uint32_t reg[], const uint32_t val[],
> @@ -53,18 +54,37 @@ out:
>   	return ret;
>   }
>   
> +static void close_configfs_group(void)
> +{
> +	if (configfs_group_fd < 0)
> +		return;
> +
> +	igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_group_fd,
> +					configfs_group_preexisting);
> +	configfs_group_fd = -1;
> +	configfs_group_preexisting = false;
> +}
> +
> +static int create_configfs_group(void)
> +{
> +	close_configfs_group();
> +	configfs_group_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> +							     &configfs_group_preexisting);
> +
> +	return configfs_group_fd;
> +}
> +
>   static void restore(int sig)
>   {
> -	int configfs_fd;

fix the blank line here.

Thanks,
Anirban

>   
>   	igt_audio_driver_unload(NULL);
>   	igt_kmod_unbind("xe", bus_addr);
>   
> -	/* Drop all custom configfs settings from subtests */
> -	configfs_fd = igt_configfs_open("xe");
> -	if (configfs_fd >= 0 && !configfs_group_preexisting)
> -		igt_fs_remove_dir(configfs_fd, bus_addr);
> -	close(configfs_fd);
> +	close_configfs_group();
> +	if (configfs_fd >= 0) {
> +		close(configfs_fd);
> +		configfs_fd = -1;
> +	}
>   
>   	/* Bind again a clean driver with no custom settings */
>   	igt_kmod_bind("xe", bus_addr);
> @@ -373,7 +393,7 @@ static void set_bus_addr(int fd)
>   
>   int igt_main()
>   {
> -	int fd, configfs_fd, configfs_device_fd;
> +	int fd, configfs_device_fd;
>   	bool is_vf_device;
>   	bool has_survivability;
>   	const char *engine = NULL;
> @@ -409,81 +429,67 @@ int igt_main()
>   	igt_subtest("survivability-mode") {
>   		igt_require(has_survivability);
>   		igt_require_f(!is_vf_device, "survivability mode not supported in VF\n");
> -		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> -								      &configfs_group_preexisting);
> +		configfs_device_fd = create_configfs_group();
>   		test_survivability_mode(configfs_device_fd);
> -		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> -						configfs_group_preexisting);
> +		close_configfs_group();
>   	}
>   
>   	igt_describe("Validate engines_allowed with invalid options");
>   	igt_subtest("engines-allowed-invalid") {
> -		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> -								      &configfs_group_preexisting);
> +		configfs_device_fd = create_configfs_group();
>   		test_engines_allowed_invalid(configfs_device_fd);
> -		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> -						configfs_group_preexisting);
> +		close_configfs_group();
>   	}
>   
>   	igt_describe("Validate engines_allowed");
>   	igt_subtest("engines-allowed") {
> -		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> -								      &configfs_group_preexisting);
> +		configfs_device_fd = create_configfs_group();
>   		test_engines_allowed(configfs_device_fd);
> -		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> -						configfs_group_preexisting);
> +		close_configfs_group();
>   	}
>   
>   	igt_describe("Validate gt_types_allowed");
>   	igt_subtest("gt-types-allowed") {
> -		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> -								      &configfs_group_preexisting);
> +		configfs_device_fd = create_configfs_group();
>   		test_gt_types_allowed(configfs_device_fd);
> -		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> -						configfs_group_preexisting);
> +		close_configfs_group();
>   	}
>   
>   	igt_describe("Validate ctx_restore_post_bb with invalid options");
>   	igt_subtest("ctx-restore-post-bb-invalid") {
>   		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
> -		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> -								      &configfs_group_preexisting);
> +		configfs_device_fd = create_configfs_group();
>   		test_ctx_restore_invalid(configfs_device_fd, "post");
> -		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> -						configfs_group_preexisting);
> +		close_configfs_group();
>   	}
>   
>   	igt_describe("Validate ctx_restore_post_bb");
>   	igt_subtest("ctx-restore-post-bb") {
>   		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
> -		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> -								      &configfs_group_preexisting);
> +		configfs_device_fd = create_configfs_group();
>   		test_ctx_restore(configfs_device_fd, "post", engine);
> -		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> -						configfs_group_preexisting);
> +		close_configfs_group();
>   	}
>   
>   	igt_describe("Validate ctx_restore_mid_bb with invalid options");
>   	igt_subtest("ctx-restore-mid-bb-invalid") {
>   		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
> -		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> -								      &configfs_group_preexisting);
> +		configfs_device_fd = create_configfs_group();
>   		test_ctx_restore_invalid(configfs_device_fd, "mid");
> -		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> -						configfs_group_preexisting);
> +		close_configfs_group();
>   	}
>   
>   	igt_describe("Validate ctx_restore_mid_bb");
>   	igt_subtest("ctx-restore-mid-bb") {
>   		igt_skip_on_f(is_vf_device, "MMIO register readback not possible on VF\n");
> -		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> -								      &configfs_group_preexisting);
> +		configfs_device_fd = create_configfs_group();
>   		test_ctx_restore(configfs_device_fd, "mid", engine);
> -		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> -						configfs_group_preexisting);
> +		close_configfs_group();
>   	}
>   
>   	igt_fixture() {
> +		close_configfs_group();
>   		close(configfs_fd);
> +		configfs_fd = -1;
>   	}
>   }
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> index 015b22051..757ddcc6b 100644
> --- a/tests/intel/xe_survivability.c
> +++ b/tests/intel/xe_survivability.c
> @@ -39,7 +39,8 @@
>    */
>   
>   static char bus_addr[NAME_MAX];
> -
> +static int configfs_fd = -1;
> +static int active_configfs_device_fd = -1;
>   static bool configfs_group_preexisting;
>   
>   static void ignore_wedged_in_dmesg(void)
> @@ -156,17 +157,28 @@ static int find_i2c_adapter(struct pci_device *pci_xe)
>   	return i2c_adapter;
>   }
>   
> +static void close_configfs_group(void)
> +{
> +	if (active_configfs_device_fd < 0)
> +		return;
> +
> +	igt_configfs_close_device_group(configfs_fd, bus_addr, active_configfs_device_fd,
> +					configfs_group_preexisting);
> +	active_configfs_device_fd = -1;
> +	configfs_group_preexisting = false;
> +}
> +
>   static void restore(int sig)
>   {
> -	int configfs_fd;
>   
>   	igt_audio_driver_unload(NULL);
>   	igt_kmod_unbind("xe", bus_addr);
>   
> -	configfs_fd = igt_configfs_open("xe");
> -	if (configfs_fd >= 0 && !configfs_group_preexisting)
> -		igt_fs_remove_dir(configfs_fd, bus_addr);
> -	close(configfs_fd);
> +	close_configfs_group();
> +	if (configfs_fd >= 0) {
> +		close(configfs_fd);
> +		configfs_fd = -1;
> +	}
>   
>   	igt_kmod_bind("xe", bus_addr);
>   }
> @@ -210,7 +222,7 @@ static void test_spinner_after_recovery(int fd)
>   
>   int igt_main()
>   {
> -	int fd, configfs_fd, configfs_device_fd;
> +	int fd;
>   	struct pci_device *pci_xe;
>   	bool vf_device;
>   
> @@ -223,14 +235,15 @@ int igt_main()
>   		igt_device_get_pci_slot_name(fd, bus_addr);
>   		configfs_fd = igt_configfs_open("xe");
>   		igt_require(configfs_fd != -1);
> -		configfs_device_fd = igt_configfs_create_device_group(configfs_fd, bus_addr,
> -								      &configfs_group_preexisting);
> +		active_configfs_device_fd =
> +			igt_configfs_create_device_group(configfs_fd, bus_addr,
> +							 &configfs_group_preexisting);
>   		igt_install_exit_handler(restore);
>   	}
>   
>   	igt_describe("Validate i2c adapter functionality in survivability mode");
>   	igt_subtest("i2c-functionality") {
> -		test_i2c_functionality(configfs_device_fd, pci_xe);
> +		test_i2c_functionality(active_configfs_device_fd, pci_xe);
>   		drm_close_driver(fd);
>   		fd = drm_open_driver(DRIVER_XE);
>   	}
> @@ -261,9 +274,9 @@ int igt_main()
>   	}
>   
>   	igt_fixture() {
> -		igt_configfs_close_device_group(configfs_fd, bus_addr, configfs_device_fd,
> -						configfs_group_preexisting);
> +		close_configfs_group();
>   		close(configfs_fd);
> +		configfs_fd = -1;
>   		drm_close_driver(fd);
>   	}
>   }
