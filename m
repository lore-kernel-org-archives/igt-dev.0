Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD19CA0FF2
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 10:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FE010E742;
	Wed,  3 Sep 2025 10:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2W0i/14";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A20C10E25E
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 10:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756896379; x=1788432379;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QQJF9giu0Z+wMW7G1b3QKIgdmzkFl6ZI+ahlKUhG1T0=;
 b=Z2W0i/14SMWoSy9VjpG/E67SZuE2Pv68qByxqy0FPMA1uPcpfbEXtc81
 lAW5K+XdsM8TIjX3JuwKydBbCbVklztuYPzuIugqfKatSWXToeMDCmfQ0
 /MHhXqNBzcdHUO5t063cYcJm2l+G59GEvEAi/sth4l56PkuoiPcF56+jt
 zwIiV7rKp9qjVN5aYrV2uqu8nP0t1wVczroZpot3na/1/2KNfgFqhoMsH
 3/XmBhf8LofEzdmcYP+4gXCpM/sltvyp4XYSk3OYxjwZ0GRFWqbSgdMN1
 4DEJCXW+7LLYe4wQAeZ/qEaxKP8alHNiWiGLeaj8lWF3/66+PwQoiwXBl w==;
X-CSE-ConnectionGUID: Ii4RA9LiSrukE4qoni+T9Q==
X-CSE-MsgGUID: dJkO9A4EQti1gTgqzu+AyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81790381"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="81790381"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 03:46:18 -0700
X-CSE-ConnectionGUID: 5A8AqlqjQcOw4Roj1SN4lw==
X-CSE-MsgGUID: VM9+CesQQFqXYVC2Zf1Oew==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 03:46:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 03:46:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 03:46:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.86)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 03:46:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/I2rY8l64gKPT7TDvj0ipKKAiX9i99J+psqy2QVqL4Zt4vJNHEr0VFbCoxJuwkUVf3WYczIWeQJ++IZhf+Fn2YVWihlw7ZzCCDgSvnokxQxJ7ESsp8+uX08BQg1CNLGay1JE0gfP21ZmGRiVPdJeMph4HZXl6fLNwNHZtjWiH5YDv15MCWEK43hBG6SRmSUWj7UWWSBV8iqS700mUyZ4bd998KmVGvTp77mOZvXW6MdhVHC505tpID6edf5YbgaGWkSIj2Xs9tnzfGFLxq8DLEbxc5Wlm2JB2qeWgXDDq4NBnQiPx7VXwNKA/b4x49+sPP+99FalYmokvGCrlnEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4swxuSz31vAk/16wWE0sdJufuOx1dDRiei96xgmcyIU=;
 b=CDVKV19eVSmtBlo/QB/p0JkA2X1tNoF7xf1Tadca3DM4sAjq8HRa5/1c36wdYmjfg/7oulPFm33e4OF2VQYvyXuqUzd1n8hJEZSk7HTegTI9FqzzSESDP5FhsD1Ecjdqp3XcOb+l85Ez+mi49IAtwbVBxgiOJxmlJazde+FFfce+bfh/EZ+/Ioo6QCQ9VTWR9AQRmx/+rfL5jYcD518RWa7cnkeEXaWqwSSmj5iU9luKX+Z57B4IEXGYO1ksRCCwelbTLwk1VCpIfNFjc31RXq/TbDvJCWZSEMnIArIXMWZ2cZeeZtcEpWo4f/2n7Q21tozzW8KRHFrXn5hD/Jl4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by BL1PR11MB5270.namprd11.prod.outlook.com (2603:10b6:208:313::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Wed, 3 Sep
 2025 10:46:14 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 10:46:14 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t v9 4/5] tests/intel/xe_exec_system_allocator: Add
 madvise-swizzle test
Thread-Topic: [PATCH i-g-t v9 4/5] tests/intel/xe_exec_system_allocator: Add
 madvise-swizzle test
Thread-Index: AQHcHL7FPVFZe1YFGkG/vK/i/vLEsLSBRhUg
Date: Wed, 3 Sep 2025 10:46:14 +0000
Message-ID: <BL1PR11MB552574D6773755D2C6BACDE48401A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250903103716.1780404-1-nishit.sharma@intel.com>
 <20250903103716.1780404-5-nishit.sharma@intel.com>
In-Reply-To: <20250903103716.1780404-5-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|BL1PR11MB5270:EE_
x-ms-office365-filtering-correlation-id: 34fee3be-ec67-48e6-dce6-08ddead71ae9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?4uMOdWSP3CgnlhzbtBWaI9i3r7ikV6DPg1fzPGZPqX9BUwFQascihqFGRCfP?=
 =?us-ascii?Q?OEb040pMZZbCUMoF7XkLO/X2MLDJs1t1JtXcrMVQEpEZgfPgdyG9FTVGU3lO?=
 =?us-ascii?Q?bnANtZ29sGi4uswah+9DfPGR83RG7eGhGjYsmSF8wo0g9ISccldzYyN4VUyM?=
 =?us-ascii?Q?PeFMhBdC1Kk70IIRh+7B+ZZ+SK5BBpIXJxv7GRbdeCf9mlQmRCOprNBJTo6K?=
 =?us-ascii?Q?veFUclteGXsgRoOMfCWxvsDDS5raNcHjEz9/WslKhEUNphy4S8S+HCy8+cAn?=
 =?us-ascii?Q?HWJboDcKzi1ZPq4O7KHGJ24HSSx+Vyi7Oy2ncXwWPum4S3u/1mtYu/hNwgi2?=
 =?us-ascii?Q?c5GTqxXCRiwMLh7l4FzeYhutqptajVt7uSA8bEZjQ6tvFYO1kX3ZflyBkFDF?=
 =?us-ascii?Q?Fp9mgmfrYWIOi1ZsYFJ2RuqLud0QOPeNM2nmLhuiTpmlRRLSzUvdKfGmTuZw?=
 =?us-ascii?Q?2CkMShyP5evV68cRs250Bkt2Ak4hcJrZknFNOhkRiYnm3x5DP1b/UU54XkrM?=
 =?us-ascii?Q?blT6bbMfMlYuVGLUjvrCbPOoQW5UoJGmrSAfHP5vFCKGDsh1Hrm6tgZQiXk2?=
 =?us-ascii?Q?n+TeRsqJDJk5nTPMgwameNZSLPKquWDRr/KVU4zywAFGX3lU3ZDbht/v7bVN?=
 =?us-ascii?Q?JKuqiEYlGjRiVe+do31tdX213/lUlaOboZU13Ap8QyzPLulYFZNSSLmtPNji?=
 =?us-ascii?Q?39SQ6Xz1UqIMl/zh71ucrLyOLx2T7IfUnBkmZAsBlCnVbiMsJ0kTY99NpZxc?=
 =?us-ascii?Q?VvS2RB9SXrVSMjUxxVcGHwPyzSTUNoewZ7m0tPjW8nZb97Yldy3h89POaGOk?=
 =?us-ascii?Q?o6Dh7o80w8H95AUZDqIGjHBO7d25NXMWCEgHRPaqHYYSC+BGXO3L/K84Ga4Q?=
 =?us-ascii?Q?Mk3Auf2ikmBcpSB5csaIeNE8Swz330zmhN/PmLQdIG+NaDrxkBG8s5X9PWRC?=
 =?us-ascii?Q?T8kJCiqUMmkMHc+duYsW8BcL1uHRAKIlOYfsskb46ikjVd9w0IHPqKywAPRU?=
 =?us-ascii?Q?IpFczxNuPLmBTfl4s3ED+uFZ+inJqp+X1Vi8DzFTe6ypmC1RLfB67R4Sru5G?=
 =?us-ascii?Q?eA8Tp8LeoaErM8HSPWP+/fb7xDMwHOsvVsK/v6ZsH+I6XzNiweO3TSHCaSMr?=
 =?us-ascii?Q?IvqhYf5I8phax/fJSEuMXmgbfklRnDB97/Q2HqR9UlFT//sYVODDhpO1XTfW?=
 =?us-ascii?Q?A7KFQDTZNrjMEaaqDj3fZbsyoQkos5D3psXXFqqBdrjj9vRvNIIempLfHnTL?=
 =?us-ascii?Q?zo2QAAOdNYQqiW9ufsfuIFYE3zJQNzlDWla3Sn2/iV00WvNCm1tZx8cO7H+p?=
 =?us-ascii?Q?p6fe3f4h8Ufu4jcDrpv7OtwIHMO7MywobO6t46g6iA9Tw6cLPjgmdNtDlKhh?=
 =?us-ascii?Q?4MMP4myK4JVajukQEydUvU2t78KQPcetVERedSPqz6H6sK+3vf3wJpYqZADj?=
 =?us-ascii?Q?b4SwVtNqOYJIK5WRndzJo+X1dRD687AEm/uwUoWh3V6off9LuZZc77n14mBD?=
 =?us-ascii?Q?WCZT/SQnmvaKvRs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xgR+otjDtNWxlmhGcVjPI9Mg4Q7abiKxM+GO2+2duFpIBLdw7fDNB+TR0OSq?=
 =?us-ascii?Q?ggHth6jO/1Lpbq5NsnDJp4kZXojDxfcMbHsgRlJN/qgIXOVJVc801+9oB0oI?=
 =?us-ascii?Q?96PHcUSJV7plAyvP8C1iPrHVtC7u2VDIjZDeuvsq7PaQNpwrtkpunD7VVAFI?=
 =?us-ascii?Q?emcn1jZyQCIRsxh437v2C7wwKU6klbv4InLNu4aaTddJcTNB5V/FaSR3NHG3?=
 =?us-ascii?Q?FzczeDSkTKDkhtrayI+/dxLI02Sa/jmXNtdqiKAPJjiME1JB4wvVX7PpRUWn?=
 =?us-ascii?Q?cBnH8CNI7MqNEva71LI3Z3kY9+aD1Ae1xLDofhQwAMSVJIwLtzUREuA0Sk2B?=
 =?us-ascii?Q?/ENDFPC2pvDMmfFPDnllp833ht1KIMq6cc3U2M85M/FjF4OItiYKZAX8EnVq?=
 =?us-ascii?Q?b8dXgA5LlItAmevmk0bJO6OZujsyQ7dKQNlQ3x/ABddcBH6N7FhHhq7LVBlj?=
 =?us-ascii?Q?NIISRRf8mQeew/NN/Vf98B18zKGFDuPjbpKByTry+C5gUjhEx2OIsLvSStu2?=
 =?us-ascii?Q?wfRJVRxmp0+SMt3zvUDnJBfpHmzkpJcORHkSlYyBqgs/cwcYlCpjobzZezA9?=
 =?us-ascii?Q?cAhDFHaDySTq5pRO0y2iupJMU9+ojkxeotrdWXiw9GFInn9z5v7gjpDIMXBa?=
 =?us-ascii?Q?z/nqAhDiXJmQ7bgzicNrXekDm/ddh/Bu+ANyXyqoK+FFdpED71p3qMr6nvLp?=
 =?us-ascii?Q?it5Z/eaGt0ldALxFrxwE3f6SqvqUlBG8gHgJCDE0jIvjalOPKKxh3t0j8DZL?=
 =?us-ascii?Q?706XFBP1vtdVf/cKS1X8dhNIhIk9JCIpGmtRvRkjrV1MI1qZpISkk4coW81A?=
 =?us-ascii?Q?l5IMBzeuevPBsRyzaOHxubU4dRBNgYvIdfHWl/5p9kRIKIz6Gj5Pr7qM8SSU?=
 =?us-ascii?Q?0NKAF3py+EQ3biH+wWoT30VORMTbViYud3nAmal8/RyWRj1BEXaPHVFLBy6V?=
 =?us-ascii?Q?YVUx9RhSVhekrEcpinAo/KDbk0mmXxAxSsMrBeWEhGshjpZ2w8PLJVtVg5rn?=
 =?us-ascii?Q?3Zq0NkS+DyTwDRuGq7Xqn79iRF9bnZgQybs6jupBhcOfrFfw2RneHRcI5H/F?=
 =?us-ascii?Q?ppjDkUyftc0ngMMgGqnFLVaD+tgktpursl40zaAZWKWpi98b+Y50Gx1tfRqJ?=
 =?us-ascii?Q?jtHaS2tGCABH1Vs2Vs4ABO2rvLYdtuEUm4bWgZJdPPJ3TcixtEMdwPyjPUVd?=
 =?us-ascii?Q?0K3Oc+/u4C+e9l7ulWnxum8Mwzyv8nDFHhDpPz9/CbQalLZpf9bmPgKWp89W?=
 =?us-ascii?Q?U6/XaeEWMbhEmGKnIAUY5m9V+pQb3KyBr3xoqhFTu67YpKUhK5tyXwc7gOHY?=
 =?us-ascii?Q?RPl5waKqs3jbxtwrIAr9oML2xVFoDFuHXu7i3n9D2MuWuAD+NmNMuaUgFnVP?=
 =?us-ascii?Q?8tVMe48hYkHTStRsl7PjLAF/duuF6RFBGYEIrb96ImweTnPDu5TdY4SisP1E?=
 =?us-ascii?Q?rALjXRf8gcjgCJ49+0QoRYN7Qixgs8f+brs83LlK9zPnxHKumUD2q2O2SQGM?=
 =?us-ascii?Q?9yJoMq9khwYSF3fPRK4EVUaNjl9nGHb7Y6VF4B+DJt/+XpjJo/XLttqVLAsr?=
 =?us-ascii?Q?J1+Adcag5YCmVXPLbT3ELHxhNas7lsDBC0LW1SpQDVwTj8eQ52sIsq4WxOPg?=
 =?us-ascii?Q?7A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34fee3be-ec67-48e6-dce6-08ddead71ae9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 10:46:14.6296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zqNg/u8mmsTDsqpep/2j3kuUU7/YxODj9EPWYYz0mvBZQv/93aYYbBZeH7+pIACD3trA6KXeY7ZwPxuTkaLBMnaqIDHTsBgCUxwYQ5ee2PU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5270
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



> -----Original Message-----
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: Wednesday, September 3, 2025 4:07 PM
> To: igt-dev@lists.freedesktop.org; Gurram, Pravalika
> <pravalika.gurram@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t v9 4/5] tests/intel/xe_exec_system_allocator: Add
> madvise-swizzle test
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> madvise-swizzle test introduced which is called in combination with other=
 tests
> as well. In this test the buffer object preferred location is system memo=
ry.
> MADVISE_SWIZZLE called in main loop to toggle between SYSTEM/DEVICE on
> each pass.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 32 ++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_system_allocator.c
> b/tests/intel/xe_exec_system_allocator.c
> index e7f3d423a..4a208f6d8 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -777,6 +777,7 @@ partial(int fd, struct drm_xe_engine_class_instance *=
eci,
> unsigned int flags)
>  #define PROCESSES		(0x1 << 24)
>  #define PREFETCH_BENCHMARK	(0x1 << 25)
>  #define PREFETCH_SYS_BENCHMARK	(0x1 << 26)
> +#define MADVISE_SWIZZLE			(0x1 << 27)
>=20
>  #define N_MULTI_FAULT		4
>=20
> @@ -885,7 +886,9 @@ partial(int fd, struct drm_xe_engine_class_instance *=
eci,
> unsigned int flags)
>   * arg[1]:
>   *
>   * @malloc:				malloc single buffer for all execs, issue
> a command which will trigger multiple faults
> + * @malloc-madvise:			malloc single buffer for all execs, issue
> a command which will trigger multiple faults, perfoems madvise operation
>   * @malloc-prefetch:			malloc single buffer for all execs,
> prefetch buffer before each exec
> + * @malloc-prefetch-madvise:		malloc single buffer for all execs,
> prefetch buffer before each exec, performs madvise operation
>   * @malloc-multi-fault:			malloc single buffer for all execs
>   * @malloc-fork-read:			malloc single buffer for all execs, fork a
> process to read test output
>   * @malloc-fork-read-after:		malloc single buffer for all execs, fork a
> process to read test output, check again after fork returns in parent
> @@ -897,6 +900,7 @@ partial(int fd, struct drm_xe_engine_class_instance *=
eci,
> unsigned int flags)
>   * @mmap:				mmap single buffer for all execs
>   * @mmap-prefetch:			mmap single buffer for all execs,
> prefetch buffer before each exec
>   * @mmap-remap:				mmap and mremap a buffer
> for all execs
> + * @mmap-remap-madvise:			mmap and mremap a buffer
> for all execs, performs madvise operations
>   * @mmap-remap-dontunmap:		mmap and mremap a buffer with
> dontunmap flag for all execs
>   * @mmap-remap-ro:			mmap and mremap a read-only buffer
> for all execs
>   * @mmap-remap-ro-dontunmap:		mmap and mremap a read-
> only buffer with dontunmap flag for all execs
> @@ -916,8 +920,10 @@ partial(int fd, struct drm_xe_engine_class_instance
> *eci, unsigned int flags)
>   * @mmap-file-mlock:			mmap and mlock single buffer, with file
> backing, for all execs
>   * @mmap-race:				mmap single buffer for all
> execs with race between cpu and gpu access
>   * @free:				malloc and free buffer for each exec
> + * @free-madvise:			malloc and free buffer for each exec,
> performs madvise operation
>   * @free-race:				malloc and free buffer for each exec
> with race between cpu and gpu access
>   * @new:				malloc a new buffer for each exec
> + * @new-madvise:			malloc a new buffer for each exec,
> performs madvise operation
>   * @new-prefetch:			malloc a new buffer and prefetch for
> each exec
>   * @new-race:				malloc a new buffer for each exec with
> race between cpu and gpu access
>   * @new-bo-map:				malloc a new buffer or map BO
> for each exec
> @@ -999,6 +1005,23 @@ static void igt_require_hugepages(void)
>  		      "No huge pages available!\n");
>  }
>=20
> +static void
> +madvise_swizzle_op_exec(int fd, uint32_t vm, struct test_exec_data *data=
,
> +		size_t bo_size, uint64_t addr, int index) {
> +	int preferred_loc;
> +
> +	if (index % 2 =3D=3D 0)
> +		preferred_loc =3D DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM;
> +	else
> +		preferred_loc =3D DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
> +
> +	xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
> +			DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			preferred_loc,
> +			0);
> +}
> +
>  static void
>  test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	  int n_exec_queues, int n_execs, size_t bo_size, @@ -1210,6 +1233,9
> @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		if (barrier)
>  			pthread_barrier_wait(barrier);
>=20
> +		if (flags & MADVISE_SWIZZLE)
> +			madvise_swizzle_op_exec(fd, vm, data, bo_size, addr,
> i);
> +
>  		if (flags & MULTI_FAULT) {
>  			b =3D 0;
>  			for (j =3D 0; j < N_MULTI_FAULT - 1; ++j) @@ -1790,7
> +1816,9 @@ igt_main
>  	struct drm_xe_engine_class_instance *hwe;
>  	const struct section sections[] =3D {
>  		{ "malloc", 0 },
> +		{ "malloc-madvise", MADVISE_SWIZZLE },
>  		{ "malloc-prefetch", PREFETCH },
> +		{ "malloc-prefetch-madvise", PREFETCH | MADVISE_SWIZZLE },
>  		{ "malloc-multi-fault", MULTI_FAULT },
>  		{ "malloc-fork-read", FORK_READ },
>  		{ "malloc-fork-read-after", FORK_READ | FORK_READ_AFTER },
> @@ -1802,6 +1830,7 @@ igt_main
>  		{ "mmap", MMAP },
>  		{ "mmap-prefetch", MMAP | PREFETCH },
>  		{ "mmap-remap", MMAP | MREMAP },
> +		{ "mmap-remap-madvise", MMAP | MREMAP |
> MADVISE_SWIZZLE },
>  		{ "mmap-remap-dontunmap", MMAP | MREMAP |
> DONTUNMAP },
>  		{ "mmap-remap-ro", MMAP | MREMAP | READ_ONLY_REMAP
> },
>  		{ "mmap-remap-ro-dontunmap", MMAP | MREMAP |
> DONTUNMAP | @@ -1828,13 +1857,16 @@ igt_main
>  		{ "mmap-file-mlock", MMAP | LOCK | FILE_BACKED },
>  		{ "mmap-race", MMAP | RACE },
>  		{ "free", NEW | FREE },
> +		{ "free-madvise", NEW | FREE | MADVISE_SWIZZLE },
>  		{ "free-race", NEW | FREE | RACE },
>  		{ "new", NEW },
> +		{ "new-madvise", NEW | MADVISE_SWIZZLE },
>  		{ "new-prefetch", NEW | PREFETCH },
>  		{ "new-race", NEW | RACE },
>  		{ "new-bo-map", NEW | BO_MAP },
>  		{ "new-busy", NEW | BUSY },
>  		{ "mmap-free", MMAP | NEW | FREE },
> +		{ "mmap-free", MMAP | NEW | FREE | MADVISE_SWIZZLE },
>  		{ "mmap-free-huge", MMAP | NEW | FREE | HUGE_PAGE },
>  		{ "mmap-free-race", MMAP | NEW | FREE | RACE },
>  		{ "mmap-new", MMAP | NEW },
Looks good to me, I let others to comment=20
--Pravalika
> --
> 2.43.0

