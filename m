Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABCECCA468
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 11:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B5A10E58E;
	Tue, 30 Sep 2025 11:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EKAqB6os";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EBC10E594
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 11:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759230213; x=1790766213;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WSOVHMQzt8AuZwhPb7h0i+g8MWvkSeAhYReMa/NkDBE=;
 b=EKAqB6os00NtE2EvTQYT0CF8nzayCex7VxsU9FoJE1DyvSbCPec/QY/o
 dxUqL+h6aLDkNrM8fP/M2cdBWikw3418BdggXXlWJiW/F6DXLXtpulrWU
 AVpNH6U+fbWN+TXgiBPFY+zhC0n6Ciyy4zGCnukfWX10a3PJvDakVwuCS
 oJWT6d8qM2kcMH7rhL7ufZ0oi3vb0uNPbgyUfGUvayPmBVOkxOBARLtu3
 y9MJhmccrjlVnVg/Bu523Z0XVshhCNZgRJ50pzflZ0YqML5IOoB+qa3Ch
 t5FeIA+cjnwh1V1JcrTOlshgES0awSPqzYxXZ28E/NeuG7qkfBmBuMgGT Q==;
X-CSE-ConnectionGUID: KIQRMjTKRWicVtn8cYfyig==
X-CSE-MsgGUID: 84hBVLMxSgCdW9MSAXLbGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="71730920"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="71730920"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 04:03:07 -0700
X-CSE-ConnectionGUID: T7SkN6JMQqG4XcV2aU9GMg==
X-CSE-MsgGUID: nYgOslkvTx69TlPq+jWuGA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 04:03:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 04:03:06 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 04:03:06 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 04:03:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndG+ujCizBaZpfSMu3pj4eiSrVzCxvkUYMQujaBYqDE9iFPiyiKtAGAt0h/NZfJwbn+RhUAvcJREiW93SlbIK+TlF6sy05ALPUbCnxmCeTmg38jJQhOzjatETfBcDzJlkvtmcQwvXSk1TEr49+Vg3no69Y+raFTaLpAiopocyWkMkvAHbfW8VNCdk0KwhWRZyW5Xo4QvRH2jIqW4rkgdaBBwpwifb11yRZ2B9TvPRtqgpoLnk+ReFqWp0velBRqo/V7ybSVnDuKjMsAdZYAct60i+4TZDVcHeS4txNDDL2mCWjYEvCrUv86R4GsOHFn6c3F0UtMFHYRYzdzxsDjhGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSOVHMQzt8AuZwhPb7h0i+g8MWvkSeAhYReMa/NkDBE=;
 b=VI8mjN8OlGpJnz8o5PIvi8Ct6d3qD3MXeMJBvMr1V6IpWH0gyUGGJaaw4IbPIZPpDScV5NA2aw/bTamknDyci1XlWVv9QAhlsOW5ce6RoQKylxN3nmgnaTKRa35AX9/2hD2ege9djajAb9ujlumC12jlHpHlXROZjLkUBwvc6cqULB6AGRYUd82hlunXEHKkAM29a2+yMOLs6rCGZ3AVeXsb6vWwVEzAvZ2GBBd41ZiMFu9TANBn0v3ofaHLHfPrSQLufgpXZ/5NhFR+S5J+PI5atQWb3ISH/D1v1wJRH7nhfB+i63EqB6LfaJ9G8S6Tbdg1VEpZIlRDntHwONSHTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by SA0PR11MB4591.namprd11.prod.outlook.com (2603:10b6:806:9c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 11:03:01 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%3]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 11:03:01 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] intel-ci: Fix typo in Xe LNL display blocklist
Thread-Topic: [PATCH i-g-t] intel-ci: Fix typo in Xe LNL display blocklist
Thread-Index: AQHcLH56edDO6GpRUU+lPZFFQZXPXrSrmj5A
Date: Tue, 30 Sep 2025 11:03:01 +0000
Message-ID: <PH0PR11MB480622263E942B60A10CB96CE41AA@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20250923113718.78290-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250923113718.78290-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|SA0PR11MB4591:EE_
x-ms-office365-filtering-correlation-id: dcc23aa9-bb23-46d3-585c-08de0010ec4d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?pVrOIfW3+RO/872OA8ps53SEROsiWo93TPwMNJQwWE2lmqEQjLfqgQ3yMpxD?=
 =?us-ascii?Q?Z4bAH7W+i28jQ16tes+oHJksSYdnaZBnf8kVXLLWl8Zuq+Mk52po5XpK+6iG?=
 =?us-ascii?Q?Idl7j3bjjpLhkJekh7geR4HiG+W7k9JWkHM09BoKySwI4FqfYH5rW0txGgvL?=
 =?us-ascii?Q?/RD6gi05LpJRlkgSY2xqNUiB6EEegRaQoMiua1mPK9VO0qxiMvOq3F85rZ/g?=
 =?us-ascii?Q?ZIykusepoqXAMgx78S00eh31oNHuSahOd19xcxpt8JjyD/m+eh+gLtsQBGO2?=
 =?us-ascii?Q?ssKYbOuaFTZSEI8qiFOFOUJl2scVYjsuAHQ1RmghHMN3Bi9cc3jbqv9MSXEK?=
 =?us-ascii?Q?/zNjU5CWPMq2HYjz5xWOUcpbCI0t3tyLfOrjLgJyfInO1R1zgl9b6+657qAb?=
 =?us-ascii?Q?Va8/AIHWIyVc87bZ+n4K42enXCyJizW5jXielwDVMurtXo3QsxWeAxf2kskE?=
 =?us-ascii?Q?eI+0mOKcJH0IhEiFgPPdHRhoTrQraNUO9iCbmWPMl3jKKd7xqCQLLrpAJhcm?=
 =?us-ascii?Q?pZlVWDSW43iHWL4vZYqKNgv5wV0uRNI4crRtWegp39CBsr8LR+AfpUB2xaaJ?=
 =?us-ascii?Q?ZGbDcQQQKr/L6J6IQhRCD/OLO0wRRIDI6SrJOXGKDT63PDXXhe41sdtm9uKu?=
 =?us-ascii?Q?lGRZ8ppm/VF4xplQ0UkDH7/i7nvHBLvRBvY51eKi70A5p28anZeUoPhXom1j?=
 =?us-ascii?Q?JPkQydfI3dfSp7KBD1l0gkMfwF4rrfRFvaisVh+1cWPQ9M/ufhSqLHQYYDs/?=
 =?us-ascii?Q?GwyQFlnMjhixEBL3/BmEbTIE4JtkS0PZqGNMuG+o2cJxhLsoRuS0jpvtGii+?=
 =?us-ascii?Q?tCm6xZLElpELDSGMpiTMaEHwyAq3NVpRCf7+tSovnI13Q4TIRbYfDmnBZoqU?=
 =?us-ascii?Q?NnTaM4nloofQIqAOVYXuSxG4Gwryha7Maw6jftW01qxJ6Vij8bovTeyXrP8I?=
 =?us-ascii?Q?J1rdmPXmi6nIByuPuiQJgKtj6MUFgcrlt4+etfnfR+eE89wi1cBdsGC3FU4p?=
 =?us-ascii?Q?uaEUUdTbHYRdnHC/3keSHLJC1D7ASntBNYVVnwGuAX8cKSV3AGz4/vbvWG4N?=
 =?us-ascii?Q?nkvnQGPAVNfv+LKfSwM4zrs76raYBHhsNnsINcpR7PMw71Mw5iLRuw10dAgb?=
 =?us-ascii?Q?szU0JyeVNwXwEHOQ7P6XZi9ClJUXARLBJPzRWrxJelbDcBmuj+tbKclM/Qks?=
 =?us-ascii?Q?EXZWhMyO+wPAg218OWBuPDgmOJVSp3k2zLJKg3d+z8IQhRxOxNpkPj9T7zxG?=
 =?us-ascii?Q?9pNBnqZYO8sgjpzPxqDwP2REDeF9tyoDeR9mazNgewhIrFupAzxCvkbEy+31?=
 =?us-ascii?Q?KSu+zuc5GklH6lDbFSeNc+dSpaWGmrkh+oc12idhbVC3AY3wvEWF4jfk7EwH?=
 =?us-ascii?Q?QnrjGAFSQyUFvKOap5gqTIfz11MMtb5A9f61y9DRq12Q6DXOCs37oHFmNCdC?=
 =?us-ascii?Q?ciDPmy3HhygUUYZI24y41KNvGABE16UOkNOKeuL1qeAD3pg60hw5+m2UFTQj?=
 =?us-ascii?Q?eXX0gLRbKm1hRYmwMzbchJFmj021oxAQ4Auk?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aTTfWAog5bnUQySLA18lOUuQtslJpdTbZVTBFi/S1obbR/CYMUaRPdlzaK0K?=
 =?us-ascii?Q?m/VOJdFjGnXkutgf65Wzzm0NjfjU26TdRNH4qI3W8UX4cLVxGcSasIrmC4qc?=
 =?us-ascii?Q?g+DLMeZdhJaOm7FchY6p1Tv4P6vGv8OZGQc7u8BO6cWufrOKXxZD3ll+R75p?=
 =?us-ascii?Q?+gPkWzWlS3Caop24uFpg1njQ2GkYKSEG6eV9XNAC5my87zEHTGqwHJuet5N2?=
 =?us-ascii?Q?IkypjKws4x/eVYjZSmbOCpUe4OiMa+/xWxsChxKWDVMKhpDI5LjIA4RhGd9k?=
 =?us-ascii?Q?/C85ejs16hP4MucQbYiZ5jzDdzd0CCVz/vVDVaNAj9VEr87aGJl7MkGhLNVn?=
 =?us-ascii?Q?v6UwAiNFi8Kkm2H9SuGWKteTdbj6FRs43Ry8iQ7bPCasreJugHemDXEa7kv4?=
 =?us-ascii?Q?edBIIKE+HyWK8FzWNEsBZZoI8cOhGvlkOT8bHLVMZv2PeWeGJLmctnKSg38G?=
 =?us-ascii?Q?JdxnsHqJpCPpD/l0Vvs8UG9HnaozT7/egRA687XSvzz6TIF1EOt3peNvHwRz?=
 =?us-ascii?Q?3eAy41IHK0Ad+ygNd8rONXuju5qZ55awuirbNF2hbEubsEjnH4MT109WZMk+?=
 =?us-ascii?Q?ujJ3ZycKG38e+JEuxsz/Eaz5pUZ2CV29qlMSu8xQm5+7PHTNjOlEEh15uzkO?=
 =?us-ascii?Q?CI7Y9/5Tg3nQrzN6GUjyysuLt/HTnaVb5xirbk0EnWVTLhxWZvnkhuUQVYQN?=
 =?us-ascii?Q?x4hMXme9DKv6dSpncwgmizOT8Kb9mvkCiYn2TF71elfmfGM3cyMEtiFNI3gI?=
 =?us-ascii?Q?lGyJqQkwxnI5Y6ftI+AtgYlmqSJOLmqC/JGMznQR0vZ4hyum6Ai6vQ0Ivu5G?=
 =?us-ascii?Q?zixlfAy+sk5cpY95ECudViS4i780O9adN/6Be6f0O/8RAX1VYry6i+JUwm7j?=
 =?us-ascii?Q?Xoo4NWk9JnXKOxDczFdTM8mtQ5uSjILwAkVykrPCb2R6pk+DAHshffhjUaRd?=
 =?us-ascii?Q?32KGTXuJBCLYnaJPuRjTOEDwdxkj30qIuTesquZCbegSUEwoK8mnpsebxL3H?=
 =?us-ascii?Q?4sICX1zLFyzLkWE5g84mwW+o633/oV7HY8nnOX3cmu0C6Ek3uSQo+LT4IO1h?=
 =?us-ascii?Q?8fc8XURrATXYtYZrScsbE7YIpXI9PpMBsMemJBgXaKRzf6JYmZOshe24jRj0?=
 =?us-ascii?Q?+dhPB5obCWxzC04zGVxXP3vbK8+UvSInmCq83YuVxCu/1EX0TG8kLt+RKHHu?=
 =?us-ascii?Q?lKwqBy6L6fTf7lziwVPn8v+kk9hCu63sVdLL1d+4O/tMWHEeAPnu2ieEgt+B?=
 =?us-ascii?Q?Di/5YvlepEoJiwsgx8splYAlzly7Mip5KU2EdlhD+hRsxxMmLrB389GRaY0o?=
 =?us-ascii?Q?GzCG48+pCAFi+2uCJ5dbzNSiQm7Gg5jb7CpDUVXYx+3Goe5+ufAi08n8VKsX?=
 =?us-ascii?Q?jhmdZ0Sh9XSlbG66YCP3Oj0zbRkUmQfEeSnMMvvQ+2NfB2d/RdbvjUH/dLZ0?=
 =?us-ascii?Q?I5cE+xrEiFIKPDOTdYDCiS1GCU5ZwwFuu0KC4MjyRlvzMtUdqtVKvHARreGL?=
 =?us-ascii?Q?HvYxbgiuj/TfFgkZJfbax16ul5T4hSjglJK0t2Uw3OiOrGjlPMpIXAXTAOuP?=
 =?us-ascii?Q?VW2qRwurBQ3ZoQ0LgH6+pEo8Qm+Bdl3E7Zs3kQPN6sTHjGPfMKFueDZfZ5On?=
 =?us-ascii?Q?TxJbLFhmMPta2qpdFKFGaRxUcg+LV3eLAIdI8ols712Vij6Ci9VMsgNI7wic?=
 =?us-ascii?Q?B2L+3Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc23aa9-bb23-46d3-585c-08de0010ec4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2025 11:03:01.6679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FEIJcOGrMBCMSPBrU6iavGKw0CEftslekTkXS7mw6fF/Bapl/uQ9i2KzJnd8S8+XrbyF/o0Biw4887NCNyC980CBwfpMYfeUkxXM2jWZ++U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4591
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



-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil Ko=
nieczny
Sent: 23 September 2025 05:07 PM
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; B S, Karthik <karthi=
k.b.s@intel.com>; Sharma, Swati2 <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] intel-ci: Fix typo in Xe LNL display blocklist

Fix a typo in a last line for kms_psr@fbc-pr.*

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Fixes: cb77d7e82066 ("tests/intel-ci: Add platform blocklists to enable pla=
tform testlist creation")
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM.
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel-ci/xe.lnl.display.blocklist.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/x=
e.lnl.display.blocklist.txt
index 1c6ea8c14..7ae7081da 100644
--- a/tests/intel-ci/xe.lnl.display.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -168,4 +168,4 @@ igt@kms_joiner@basic-max-non-joiner
 igt@kms_psr2_sf@fbc-pr-.*
 igt@kms_psr2_sf@fbc-psr2.*
 igt@kms_psr@fbc-psr2.*
-'igt@kms_psr@fbc-pr.*
+igt@kms_psr@fbc-pr.*
--=20
2.51.0

