Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B31606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 21:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=acK0Q37L;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=G/MlRGZH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 167AD10F0D3;
	Tue, 24 Nov 2026 21:45:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C71A10F0D3
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 21:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795556172; x=1827092172;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7HpTtL/CISfyklfU4aW+NQoSMdEkWFNqjefjeIflwPg=;
 b=acK0Q37Lw2UCq2qlW0dfPict40iLZ0fAgdkjKWP2258TvjNVNU5wmdod
 9P9ltFcwLi8Ug2h5ojKQVk/9YFa+KhRWLwb8UrLqaqlqnHxz08jUByKgt
 M0lOsIxsmYGuUG1zgEp6CRYUwjYEU1M23Mpkr4NTPxFqQ7e8GZTGIvxRz
 5uZbS4aYZXjfY91OgNsZwLo+LceGOZZAZaUKktjkw6UFuvly+OR1wfXF1
 nJ+sWJ/LbO4fFEJxbVLY8+L0UbUGnOqe6iw7FJWvC2uISZwU7vB9DKhIn
 A4OolhHI7XXa3LzcT2MpCuM1T2B+Eay6/DTZkBDSCN3Hw+lFttyIzcwD1 Q==;
X-CSE-ConnectionGUID: 0H/0VukKSzKiwN61boYKWg==
X-CSE-MsgGUID: 1j8ZCGuaQme/p/qFkZmJGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4343916"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4343916"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:36:04 -0800
X-CSE-ConnectionGUID: eZURTGF3TpSVfecPArBi+A==
X-CSE-MsgGUID: NglpYN7/RG+8ZIWm2Or97Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; d="scan'208";a="12022863"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 13:36:05 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:36:04 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 13:36:04 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 13:36:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y/dtFGielFHczFjB02+Z8pIQTvLvpXZRwdGZq9O2xN3wjvTuUIbpHFHw/Q8sITAGBWJyNDmB9ARHf1UTU0xge6He/MouqW5/bbOKLgPbog0e5vjaSsmSriYgJ7Q73yQzPwrlXh/m8YzxIkh8yXToAadVQ47qqaGLCEYybqPX6845M7gIZBQg2cqXx65MbydMoEXPx1X1BzhaAlR6snhuZvAteq8psps/YQihIHD/ruNDtc1G1KlmA/tj21fvynNE0zAwLTHwtDRhQRhOuRciH08JVbzv76uNa4NkYoSQ8Dl4P4e8i5xOTrdbCkcJ1JGf1i8QV3prUyTWmKSOZ6zexg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0JqTkmePkyjWb5CCaV8lmscCVjhYkHgTre3EW7AAFo=;
 b=SDzH8hBNH8bYPsSxp4no0NvrRNHdHjlOMFTBZuP7hX23jrxICZipgSsHi+O/N6k9YGJ3fcbTyKGi020TnVAYDUDixvw6/EXw338EayLNy+OQYzpHjq+g48LVeguckP719aOZl1kd4jGyNKb4bHtj1Irmpi4XdTbkE9PIeUdl9OoE+36exe0pWnOmHIw3x+JleEKi6OBYobs+aZ/IezFccOQ2L20wcr9L7LJfi3TfRQ01E6FBvvnUgArQph3aXtpsbMUBwkmtcyiTN9eM//mFmqTQbE75pvwfF0oIPcOEnpy+UBOlXmBhGRRVFIf77TjwjJgyXtp8dJzXIwLk83sztQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0JqTkmePkyjWb5CCaV8lmscCVjhYkHgTre3EW7AAFo=;
 b=G/MlRGZHw9AA6slOiQS4xrUARmVJ1soxkvPdtvLj+eV5CGOf+SG9G+P+Crt3UePdw8pe84IXIPLkLygmTtKZwLfULDxuupXhO7xjNAvae0oi2JIj14JOE1SpDyt+GY70OxhjPiuYS/n2PPgMqquTuCdZhnSDhHFNKNIHW8AYUdE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 PH7PR11MB6954.namprd11.prod.outlook.com (2603:10b6:510:205::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Tue, 24 Nov 2026 21:35:59 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Tue, 24 Nov 2026
 21:35:58 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t 9/9] tests/intel/xe_drm_ras: Test retired pages
Date: Tue, 24 Nov 2026 16:35:40 -0500
Message-ID: <20261124213532.3674338-18-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
References: <20261124213532.3674338-10-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::11) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|PH7PR11MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: afb684df-6fd5-405d-02a9-08df4a72eddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|261022075727099003|6133799003|22082099003|18002099003|261009223027099003|261022105027099003|261022113327099003|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261102123227099003|56012099006|10067099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: HNAAMRtB3YhzZip1HfL4JIEVskp82//yimLr3GYdWh8fT+XEKoHkXef44V780k2LXtFzxL3WN6wViUPlC/o+WyPHYWqkN2+RzSODM3SPTwDPXQNq+2XC8nIyMdmEwZkeN5GkZTkndWK2vdfS+rxGWhDuuk8CHW2heo3KhKZMZ3oIRxZHpgu8CDeazgYWJfAjj2iNcRIKCvtmqq1VGfX0t63Xq00tg/jK3SfzP2FPJ1lEwzxh+PF1XvAerLaTAsk4JyPb4GCyfSs9paVfYwa1G/JofPp5Qr3/MCTzBhY1ldWJ9mIXstPnZJ7nfULTu+4tR41GIb1Ak1wU3bNs16iLMlZd12CVxvN39/y6NDOistSAd0QMSnvVEEQxN6eosury8gclgqwHuZdLdsPGsX73WWuwjsc17b2Ow2g1bu90LDbFrm16l4zTskHsPaTpapGfFITbXue0ePMXzQE95Fgh28qXj975EKwZh5M/UDlEJTjoeOkbx45ck1Dugq13Xz2IlKtHRaFzQAgqBEwzsXSVdgVNavsYWt2OPnqdhyA28f30boWFcVXj83VwRmRaXaAy7Xjv/WvKxvUQ3PqFgNG9hzQB9BEYsWKrL9j7RBsyJNNAYV6i8mvzNgT8mmgOBUovnI7y5DPK52IS2SJ9Vo0O+p9CzOmUFlqIv3OBlROgmAI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(261022075727099003)(6133799003)(22082099003)(18002099003)(261009223027099003)(261022105027099003)(261022113327099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261102123227099003)(56012099006)(10067099003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE9VWmZwWGU3L0NZbko2K3FtVHA2b1JvTDNNTWZjcjVqcERNV1Q3UFdDN1Vi?=
 =?utf-8?B?Vm9EUlBhZ1NJaE5TVDByZHF2bzVScktaNStzay95YkZwdjB0c1dBYzVJQUlZ?=
 =?utf-8?B?ZUpnQkllVXZxVGZEUm93eFg5RjFrMHAzNkxqcWZzMlZIZU5HRVhPcC80cWl5?=
 =?utf-8?B?VGN6eUpxWnY0U1J1TllWVkJSSTJHNk85aTRTbkFyaXNTajBpODJKclgvbXNI?=
 =?utf-8?B?SndCMEdwdXFFU2Q0bldnTm1ncXNvbmpwdWRpajd0WHN4bzVsajYyb0V6Q1or?=
 =?utf-8?B?SmpKTzZGNWlESHBnOEVxeWIyRzlvOUM2M04rK0dJTXphVkg5ZVF4R2VncEls?=
 =?utf-8?B?bVgwa2lFSXpycXIyWTlraGtZTndHaVc2REtzZEFUaXFKeUZjUXhaQTNaK09D?=
 =?utf-8?B?UTB4QTRFMUpBdEY0VUd2RDJCRE1sZ08xUUJzdTN6dDB2T0JtTWhnTzZteEpm?=
 =?utf-8?B?MTcrRjRYOUw3eGlxbmJOcVgzZHJHNUM4a2EwbzhUQnBKNUdmM0QwZVVPeklR?=
 =?utf-8?B?V2IrUHF0VkZQblZ0b1VOQ0p1YnVLTTd5M1BvRE1mKzd2ZXFNcjlBWmhYR1Rh?=
 =?utf-8?B?R1c5aHdHZkYzOUZ1aVh3MXNrYTl1c1pTMitMQlhxSWs2Yi80aXRHK2dNeTdW?=
 =?utf-8?B?blhZelFWdm1IZ3ljYzQwTWxvSjV6Qis4WVQxREl3S3NCOGwrQU5PS3diNlJH?=
 =?utf-8?B?WkJyMzBRS09oTXZONmlCSnlDRWhNVm92UFNycC80dWdCK3piOXlXbDMwTnps?=
 =?utf-8?B?eHA4WFBhQmM2WW5jNlRxcHY4SURLYlF3TGllWGlxVnh0d3hIV3dxMytGUTlz?=
 =?utf-8?B?ZHU1NTZjdUY0U0h2L2VDT1NmVUwyQmVjNlFHUDhqWG1zSGMwSDVrMHNnS3hQ?=
 =?utf-8?B?NDB0MVg2MTkrNzBFV1hqSTRKZm9KZTF0TVBTdHlySFdDZTRSNm5RQkF3SzBh?=
 =?utf-8?B?amMxT2VoK1Z4aVhNZXFhK0JzWnRKSnJONXdKZlZFMGZ4T0VacXkzMmZNSlFY?=
 =?utf-8?B?dWJkYlhSOUNRYm5ma1hYL0JteHhuUmUzNTFkQy9ORU5tN3BCMGh3eVBIVVI3?=
 =?utf-8?B?MzVrME8yRWM1bHNZVi92UUlJaWJMRERqdk5KYm0zUkI5S3JaNjBmOWxpcWlv?=
 =?utf-8?B?RVQyd2pNaFRscUU1eEs1bUNVU3YwUDdTUzhlQnF3cEpoZ2FsYlNOYlNqL0lD?=
 =?utf-8?B?alhmVDlmZHJVTlFBeFlLTk9SaUhOTkdHK0pnZ2JYeWV6dUF3ZW5UYXRhZUts?=
 =?utf-8?B?ZW5nMDVOZEFWSDVoRDFOQUxZaW8xM0VrcS9QVkVIeXk5VFlxaG5JMVArVWoy?=
 =?utf-8?B?b0VYZ2FjdGRkRjd1VVZ6VG1vNm4rVTBWcmo0V3NiVnJYaG1UUERFS2JrOFJm?=
 =?utf-8?B?WnI2S2dGK1hoR3RJVFRkTUVRSHFTQWU5Y045NkxmQnlOMzlhM0ZMdDZvTUtX?=
 =?utf-8?B?NVkzWjcrZmUxbUQreDV1Rlp2Qjl2YjZUTk5nR2ZwbEFidnpRZ3BZSFdEd093?=
 =?utf-8?B?N05rQkNyR0pPVjNiQ1RDZHNYNnpvY0dKaThBdElyNk9Ccjl0eURjRzBXVFpp?=
 =?utf-8?B?cG4rR2ZaeFJWVlZZWVlZZFJVdEJCTWczU1UybFN1OWljK3g3NmNLb2QyZ3dQ?=
 =?utf-8?B?WTZOdXYwVTZxVmJHMDJTR1ZlL25KUXhucmxsNkVQNHpYelhGMHRDa3BwMnQ2?=
 =?utf-8?B?VG5XZ2JSRnJIZGdEK1lSNnBRcmNVY0hjYmJJTkRHV1d2SXZxeGx4K203Z3Fu?=
 =?utf-8?B?Q21BODM5aVZEcTM1SU56c3gxeHllOXU5MXZuWFozWGNtVS9kYTBUSEhiZnQy?=
 =?utf-8?B?WVM0bnAwdDB5MXB5cmovUnR4ZkhHN1dMdXN1S0w3d0ZmTzVzQ1YrWmtlSFRv?=
 =?utf-8?B?YXd2SzhpdVYwZmF1OHVaOFFsQjhrSlhaUDFlMHc1aWE0eHJUU3I3RGp2ZzBE?=
 =?utf-8?B?OVBDWVRnYWc2Y3JNYktjYTNpclkzaXhWeEZVKzE4cWNLa0xlcmZzRFcyT3Fu?=
 =?utf-8?B?N05mQ1VSQkt0UytoOVdjU3dqWm1BOEJ2a1VuSDJaaGdhSGllM0M0M0ZLVnE0?=
 =?utf-8?B?NDdPczNlTldBM2tZclpISmdCQXNPS2RESUZmTlV5VUxVdUlhenpXOGJ5TDBh?=
 =?utf-8?B?RlBBMDZsYWZmN0l2VUZHRlNTTzlLbmdrTmZPR3FGMjhMOERyVGszckxsZ2tj?=
 =?utf-8?B?akhvVGZkazVtU2twSzQwR2Q4QSs5c2d0OS9IU0p0aVp1dXd4YXZyL2kzSm1u?=
 =?utf-8?B?SVo1MVZSZE81Y0diMVI4TnpyLzhTYjd0MHgyTTJiRmhXUFdoclpxQ3l0OFQ5?=
 =?utf-8?B?ZTU2cUNDUW5ZY053dXpibk55U1hQRHRWS1E1dlYwZWhEeWpCSitLQT09?=
X-Exchange-RoutingPolicyChecked: oeFoQo0buva0fZKDLokoBIXIUN8gcFSHi4KcaLuIQkKyViXQAgqsOPeOh7rbKXgElLRgjvBg0v8ybJAMJDCFYN8vBoUe3UezqvTlowT9GQ6WBr82DHvJ2rAwC/ifkaAvWjmD4Bw0ot6UGgaYPFp1lp4QXn4Lh/CwD2qlPhg+xm6IivzeCbicZXzob3GGPW3fKE5NXoWcDguvVbBEtC6BeSiWoP0nPbDuWQ1CZ0Fn6Xr6YVu7JEH3KAfRGPCGqZflE6J+XoW+kIPMaeterC7jk2KwZzVukgnrwAAlB6xAh2jY10Ixe4BXyr7C1c2SZgzF7Yc3HeW8mNePqsJ1CE4xJQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: afb684df-6fd5-405d-02a9-08df4a72eddc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 21:35:58.9080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xa8P+U10lrfWFh3z+2Z1zGb1YyRHexCUd8m2OiskGDz4Xq4zQ+BgohPQli0VeWPYbPkon7AKtquyiV5zvUjWhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6954
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Check the retired-pages node of the device:
 - retired-pages-info: the node reports a page limit.
 - retired-pages-inject: pages injected through the VRAM page fault
   debugfs interface are listed over netlink, in address order, exactly
   as in vram_bad_pages.
 - retired-pages-invalid-node: requests on an unknown node or on a node
   of another type fail with -ENOENT.

Tested on BMG with simulated retired pages.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_drm_ras.c | 218 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 219 insertions(+)
 create mode 100644 tests/intel/xe_drm_ras.c

diff --git a/tests/intel/xe_drm_ras.c b/tests/intel/xe_drm_ras.c
new file mode 100644
index 000000000..4803623c1
--- /dev/null
+++ b/tests/intel/xe_drm_ras.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: DRM RAS netlink interface
+ * Category: Core
+ * Mega feature: RAS
+ * Sub-category: RAS tests
+ * Functionality: drm-ras
+ * Test category: functionality test
+ *
+ * SUBTEST: retired-pages-info
+ * Description: Check that the retired-pages node reports its page limit
+ *
+ * SUBTEST: retired-pages-inject
+ * Description: Inject VRAM page faults and check that the retired pages
+ *	reported over netlink match vram_bad_pages in debugfs
+ *
+ * SUBTEST: retired-pages-invalid-node
+ * Description: Check that retired pages requests fail on other nodes
+ */
+
+#include <fcntl.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "igt_debugfs.h"
+#include "igt_device.h"
+#include "igt_drm_ras_nl.h"
+#include "igt_sysfs.h"
+
+#define FAULT_INJECT_DIR	"inject_mempage_offline"
+#define TRIGGER_FILE		"inject_mempage_offline_trigger"
+#define VRAM_BAD_PAGES		"vram_bad_pages"
+#define INJECT_PAGES		5
+
+struct nodes {
+	const char *device;
+	int64_t retired_pages;
+	int64_t other;
+	uint32_t max_id;
+};
+
+struct pages {
+	struct igt_drm_ras_retired_page *page;
+	int count;
+};
+
+static void find_nodes(const struct igt_drm_ras_node *node, void *data)
+{
+	struct nodes *nodes = data;
+
+	nodes->max_id = max(nodes->max_id, node->id);
+
+	if (strcmp(node->device_name, nodes->device))
+		return;
+
+	if (node->type == DRM_RAS_NODE_TYPE_RETIRED_PAGES)
+		nodes->retired_pages = node->id;
+	else
+		nodes->other = node->id;
+}
+
+static void add_page(const struct igt_drm_ras_retired_page *page, void *data)
+{
+	struct pages *pages = data;
+
+	pages->page = realloc(pages->page, (pages->count + 1) * sizeof(*page));
+	igt_assert(pages->page);
+	pages->page[pages->count++] = *page;
+}
+
+static void netlink_pages(struct igt_drm_ras_nl_context *ctx, uint32_t node,
+			  struct pages *pages)
+{
+	*pages = (struct pages) {};
+	igt_assert_eq(igt_drm_ras_nl_list_retired_pages(ctx, node, add_page, pages), 0);
+	igt_assert(!ctx->dump_interrupted);
+}
+
+static int cmp_address(const void *a, const void *b)
+{
+	const struct igt_drm_ras_retired_page *pa = a, *pb = b;
+
+	return pa->address < pb->address ? -1 : pa->address > pb->address;
+}
+
+static void debugfs_pages(int fd, struct pages *pages)
+{
+	struct igt_drm_ras_retired_page page;
+	char *buf, *line, *save;
+	uint64_t pfn, size;
+	char flag;
+	int dir;
+
+	dir = igt_debugfs_dir(fd);
+	buf = igt_sysfs_get(dir, VRAM_BAD_PAGES);
+	close(dir);
+	igt_assert(buf);
+
+	*pages = (struct pages) {};
+	for (line = strtok_r(buf, "\n", &save); line; line = strtok_r(NULL, "\n", &save)) {
+		if (sscanf(line, "0x%" SCNx64 " : 0x%" SCNx64 " : %c", &pfn, &size, &flag) != 3)
+			continue;
+
+		page.address = pfn * getpagesize();
+		page.size = size;
+		page.status = flag == 'R' ? DRM_RAS_RETIRED_PAGE_STATUS_RETIRED :
+			      flag == 'P' ? DRM_RAS_RETIRED_PAGE_STATUS_PENDING :
+					    DRM_RAS_RETIRED_PAGE_STATUS_FAILED;
+		add_page(&page, pages);
+	}
+	free(buf);
+
+	qsort(pages->page, pages->count, sizeof(*pages->page), cmp_address);
+}
+
+static void inject_page(int fd)
+{
+	if (igt_debugfs_exists(fd, FAULT_INJECT_DIR "/probability", O_WRONLY)) {
+		igt_debugfs_write(fd, FAULT_INJECT_DIR "/probability", "100");
+		igt_debugfs_write(fd, FAULT_INJECT_DIR "/times", "1");
+	}
+
+	igt_debugfs_write(fd, TRIGGER_FILE, "0");
+}
+
+static void test_info(struct igt_drm_ras_nl_context *ctx, uint32_t node)
+{
+	uint64_t max_pages = 0;
+
+	igt_assert_eq(igt_drm_ras_nl_get_retired_pages_info(ctx, node, &max_pages), 0);
+	igt_assert_lt_u64(0, max_pages);
+}
+
+static void test_inject(int fd, struct igt_drm_ras_nl_context *ctx, uint32_t node)
+{
+	struct pages before, after, debugfs;
+	int i;
+
+	igt_require(igt_debugfs_exists(fd, TRIGGER_FILE, O_WRONLY));
+	igt_require(igt_debugfs_exists(fd, VRAM_BAD_PAGES, O_RDONLY));
+
+	netlink_pages(ctx, node, &before);
+
+	for (i = 0; i < INJECT_PAGES; i++)
+		inject_page(fd);
+
+	netlink_pages(ctx, node, &after);
+	igt_require_f(after.count != before.count, "VRAM page fault injection not active\n");
+	igt_assert_eq(after.count, before.count + INJECT_PAGES);
+
+	for (i = 1; i < after.count; i++)
+		igt_assert_lt_u64(after.page[i - 1].address, after.page[i].address);
+
+	debugfs_pages(fd, &debugfs);
+	igt_assert_eq(debugfs.count, after.count);
+	for (i = 0; i < after.count; i++) {
+		igt_assert_eq_u64(after.page[i].address, debugfs.page[i].address);
+		igt_assert_eq_u64(after.page[i].size, debugfs.page[i].size);
+		igt_assert_eq_u32(after.page[i].status, debugfs.page[i].status);
+	}
+
+	free(before.page);
+	free(after.page);
+	free(debugfs.page);
+}
+
+static void test_invalid_node(struct igt_drm_ras_nl_context *ctx, struct nodes *nodes)
+{
+	struct pages pages = {};
+	uint64_t max_pages;
+
+	igt_assert_eq(igt_drm_ras_nl_get_retired_pages_info(ctx, nodes->max_id + 1, &max_pages),
+		      -ENOENT);
+	igt_assert_eq(igt_drm_ras_nl_list_retired_pages(ctx, nodes->max_id + 1, add_page, &pages),
+		      -ENOENT);
+
+	if (nodes->other >= 0)
+		igt_assert_eq(igt_drm_ras_nl_list_retired_pages(ctx, nodes->other, add_page,
+								&pages), -ENOENT);
+
+	igt_assert_eq(pages.count, 0);
+}
+
+int igt_main()
+{
+	struct igt_drm_ras_nl_context ctx;
+	char slot[NAME_MAX];
+	struct nodes nodes = { .device = slot, .retired_pages = -1, .other = -1 };
+	int fd;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_device_get_pci_slot_name(fd, slot);
+		igt_require_f(!igt_drm_ras_nl_init(&ctx), "drm-ras netlink not available\n");
+		igt_assert_eq(igt_drm_ras_nl_list_nodes(&ctx, find_nodes, &nodes), 0);
+		igt_require_f(nodes.retired_pages >= 0, "No retired-pages node on %s\n", slot);
+	}
+
+	igt_subtest("retired-pages-info")
+		test_info(&ctx, nodes.retired_pages);
+
+	igt_subtest("retired-pages-inject")
+		test_inject(fd, &ctx, nodes.retired_pages);
+
+	igt_subtest("retired-pages-invalid-node")
+		test_invalid_node(&ctx, &nodes);
+
+	igt_fixture() {
+		igt_drm_ras_nl_cleanup(&ctx);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 806320a82..14e576ea6 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -361,6 +361,7 @@ intel_xe_progs = [
 ]
 
 if have_libnl
+        intel_xe_progs += 'xe_drm_ras'
         intel_xe_progs += 'xe_err_injection'
 endif
 
-- 
2.56.0

