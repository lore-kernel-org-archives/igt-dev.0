Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DA3CA0FE7
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 14:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC84010E25C;
	Mon, 25 Aug 2025 14:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jvKqKX98";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14B110E25C
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 14:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756130983; x=1787666983;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bTsoREgozYjrWwO/jFiKV41xTTzWJTW4Ehw3kzTOeaU=;
 b=jvKqKX98EU6sl8zS+RzRNWuQrPzkU9R5f8+bQk+Sxo5UPNUEkW2LgfQC
 YjjMMGWBet9DCm10T1aAbjFpuDmQfH3PpNGzF0WNNprmxIYhgGwqx09wE
 ouepz2de9IRMjEl95eDLrWLsVj9+v0m7+iIXYAqicEnsxddFpY4DjaFKm
 GvPZIoqZ6+QulloUhNvWssMWNOakJG/VoyZb26iE5XDebJY7BehbvUX2M
 +ksVtSfUsg5Yi1icB8ltCi/Qp0Mf5JOLwmoOS28S47+qpxrx+oKT6QNwf
 ecwGTbsRqY0bKghJ9hjgl0NApo9WKtgpAfeTllC8uoemwQ3K8SdsMNAJE Q==;
X-CSE-ConnectionGUID: FmftnT2tS8OTx2qVULBYBw==
X-CSE-MsgGUID: 5zU9bdUmTomoAIRFw83sHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="68939059"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="68939059"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 07:09:42 -0700
X-CSE-ConnectionGUID: KS+iF7GET9mz1v8s8jUNmw==
X-CSE-MsgGUID: m7DcEEtoRtK3DqMnK1PZyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168550103"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 07:09:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 07:09:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 07:09:41 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 07:09:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXUBmIT2qZkrp+oqdaVDLRNNseOII6oTtyEvCDLSbcsvWiLkQKZPB3lJecGjTBNDkmBM1PDYHSaDOcEOhhxBzi2aIr91TaB9v+R1Pfkr9JmSt8G/1Nig1aQo0ykU2pU2VdJBO2abmNYdNpNZbvRfaTLhdW9mazj0OOkZODBl1a6Pv2CUXOZB2Rfv/puYFTK31N7aov0pi9MYpld6z8cj95uCXeqlkWK5j7pnu/WYk+XXFBFOeULgGUn7Hpg0FyKnIlPkw8aSR/M3gGqARTZ4jPBoeSBdjhYxsuV3Z9omvdbVf48ZGMZgp4T/7XjIqwRLe/mQNoBrhlrpLwWwhNKphQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygzLg5ofQ5I7Hm1uuI9Qh3A2LTB0W6DoWUHQbQppR1E=;
 b=rEH7Uja02ajix21UxZt6fbzZ/8EfqiQ1N+E+6Zo8GBmbbgCz+qhdULQridXUwWhsqRdPbkC7czQw0nMZcRmDesvBVXO5hbWvNIvT/Oru5Y4V5tViVF8T/7IgUqOA5HutqLpP++aCPZ6EU6LdNvZIYxI85sBawKcGq6V9MTfq5SWJbm3qXrcLCn+2+ZCrcKDJpnY6XCNAAhp9jFSN3Cu1xjEovzRPmJSIEWgnf+Bk++upctyU+C5AJJ2REJHVm8tQV9odeplQEFVz0pGXiV5nmCOw08uSUoMylGfMoIi1mdEH1aaC3mrahZld3y/cAJalBrxeS/7kdEQBvNWQbzvy/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA3PR11MB9064.namprd11.prod.outlook.com (2603:10b6:208:57f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Mon, 25 Aug
 2025 14:09:39 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.9052.013; Mon, 25 Aug 2025
 14:09:39 +0000
Date: Mon, 25 Aug 2025 16:09:34 +0200
From: Michal Winiarski <michal.winiarski@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_sysfs_file_perm: Verify sysfs file
 permissions for security
Message-ID: <tt62zjh6s72wxgz2eozbnm34ewxob323gcxfzwrm5sjv6l6e3y@u5dhkues2i4d>
References: <20250813131948.573785-1-peter.senna@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813131948.573785-1-peter.senna@linux.intel.com>
X-ClientProxiedBy: VI1P190CA0044.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA3PR11MB9064:EE_
X-MS-Office365-Filtering-Correlation-Id: fa007065-c53c-4d29-d67c-08dde3e10743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXBDN21YSkxOZUpUNDl1ellhV011eVZFN3BuUStPcm16ckQ5UzAzTHdEZUxv?=
 =?utf-8?B?S0lScXlnbUY1eWRmRHBBK2k4R01nMnlQakRENTh6dytsNEYxcFNJYWFZamVR?=
 =?utf-8?B?NVdQcDUza1g5S3NsakwvRkhPejFBU0ZBcDhGd1pOdVo0ZjZTcmFsUE1KSEV3?=
 =?utf-8?B?UmZZR0hEZThPZ0pZUUJSZ3QxYnJubWxQQzBHRkM5QkdVaWlyTFVYZzlwM20z?=
 =?utf-8?B?SFFXWlBpUm4xcmgxTENkREw2dFQzc0NzYXF6WkdsRkFtcS9uaGVHR09lVmVG?=
 =?utf-8?B?SUgvQTF1dmtxVTNCT1dzb3A1V3J3UnRvYkZrV203MkVpYVRkLzVNejhMb2JU?=
 =?utf-8?B?bS8yRXlVYTRhdk9sYVNqTC9sZTJQU201Ti93ajJRbXZ0bVlqWkhUUWMxUlc0?=
 =?utf-8?B?cjRpa1BSMUYzeDUrYS9ZS0dERmQ5L3Bmb1NmMStCQkY5bDAwNVFEd3JmVGk1?=
 =?utf-8?B?bkxsRmlPZGJERklTaWVEdC9oRks4NnBsRkl4c2w3U1VRYVUyRnorbVBJdXMv?=
 =?utf-8?B?SXFhdFZQV0VMbCtpQU1zQWdERDlSOVRzcG43UG8rMjZNVXF3d1RuTVJxY21H?=
 =?utf-8?B?RjljaWRZdHA4Zlo4VmtaZ3JWbVJqMTBBb0I0VUE4d0w2M1NBWGpkdDNmdDhT?=
 =?utf-8?B?TzFGTFNJK0VWd1JoVzZCRG5KbTVHWlIzN3RFQnZlaFVoVzdROXNkOFh6Umx5?=
 =?utf-8?B?SE5Cdm1neERTRlhvbHU0MjBwZ1hIWTFxYXl4MGR4WTllNFByRElkYnBGZ2JJ?=
 =?utf-8?B?UHhUaDUwOHJvQ3prV3NmeTA2TkZLWWRZODNWOEFnSGpid0NNSGZERFlCc01x?=
 =?utf-8?B?R0ErNHRMZWI5V2hyOVFUMXdvQWtDZDZxTkRWRVp4T2dPL3JoTlFyMkRLd0NP?=
 =?utf-8?B?MjVHRFR4eVpSQWkweFNWTlJPTllaSmNlMUFHNS8yMlpEVGt4MU0vaHlvK1Qx?=
 =?utf-8?B?MlprcEVWWE9kMFE2VDNPZ3R3ZzlFMXdDL2s5TE1pMHhGV2E4WkdwR1RJa3R5?=
 =?utf-8?B?cVRTd3c2WFJEZGhVTDlzeFhwM0VjSUNSSmpqQitYS2N0MmhoOThDT09qZWdJ?=
 =?utf-8?B?bmExbi9GaFUvTWprYkNXNmpDUTRwY09qZnUxYTNHR0xyMU5tNjc2Z0V2cWJ2?=
 =?utf-8?B?YWVtTEFycS84ZDJZNVA1MGk5UGhYQlNPWXNJVUNVaUhzdHBPZHR4TlNYYUdQ?=
 =?utf-8?B?UjhLanRPYnlyVUIzdmxKdHVHYnNVWFBJWXg1TDM2NTV4QUJtenFTUmRHQm0v?=
 =?utf-8?B?QVA0RHpZR2pDS0d2bXg0eVBZNVhpZFVnKzQyWE04b05SbXVQaVlUV2VsdnJ6?=
 =?utf-8?B?MWFwL2Q5cmtCNlNtL1FWbVlxaFBxYjY2d2RRRGZPdy9paTlteVlGYjYzUE1D?=
 =?utf-8?B?SXhmQkt0ak9YWll3RHBweEQzR3Zxall1QTlWbW5VL29ISjBoTGFGaG9mc2ZK?=
 =?utf-8?B?YU1VMEd4eGZNRzdhRnZUK2pwS0JSVzBlcTI1OUs0Y3hOeENJVDJhTnRCR3Vk?=
 =?utf-8?B?Vk9ackhHcEg5aDQ0ZWplaWp6QVpRU0Q0TE1kYTA3Q0E4bTltUXdMZ2ozNkpi?=
 =?utf-8?B?T3g1NDQzNnZWMlgvbHpuRG5zNGliYTNQZkVTSnF4b05SNmpSdGdCRDNDZE0w?=
 =?utf-8?B?cmRRY3NGakphTXpsVWJXSmJaQlFNOVREM2R3djV4Mk5URklZQm9rVUVPd3Yw?=
 =?utf-8?B?WEwzazY5SDlwSm50LzBRQ0NyNTNNKy83WHNaN0dSTTlla0QweVpHWEUxNmsr?=
 =?utf-8?B?ZlkxWDJXNVpndXVqek4zVlFhZmd1WkI5NWwxVldTVXdYU2hsZjVVekRwWFdr?=
 =?utf-8?B?dVdtYVpjd3J2aS8yVUxxUVBlTmpkcWs1eGw4SVppc0RZa2tMb3d4REJTbVlN?=
 =?utf-8?B?NkZEb1p1NDQxMnFNZVVLWnlvaEZ2ZFVMSTkxYUhRbXluM1A0dTg2SXRXc00x?=
 =?utf-8?Q?oxQ9f7GhSME=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3NtRE8wZVZ4K1Evb04vd1ppTCtJV0xoMk1pazg5U1RtSkI4OXMwOXNTWHRG?=
 =?utf-8?B?dDlSdDNJd1prS0FkME1MWHpaNFV4eE14aWFLVXNQSkFvYW1jekFDalJ4S3V2?=
 =?utf-8?B?UStLUkVMSVEyVUJnalgreEs0U05tK1l3UGpVdjVHWmUxSngzd3drR0h0dnFl?=
 =?utf-8?B?Q3cxUGwwbGxiMnZBczNUSng0NHEzMHhlVjZWSGlFWHdGS21KMC82TmViVDg1?=
 =?utf-8?B?eU1KY1VmTUR1NXZDOThucTlwUjhhUHRQOTRwb3p0akxPVFlVTXVhbkxTN1Nm?=
 =?utf-8?B?RlcybjlSUWRoL0FEZWxnRDIwelhvRXVoUEZtSy84SFBXOXBpZnkzWkxVKzRs?=
 =?utf-8?B?MXpuV0JVWnFBTkwyVVcrcmZrZFpVMFh4RndFUFhjYWdXcWpVSmtMd3J6Q2ti?=
 =?utf-8?B?TUN2UjUrdmFrWU9aWDQyUXFpeUNjaUFqSk8xNHYvZ2htcEp0QVozaDNKajlO?=
 =?utf-8?B?NVEzaXBzUmFaUXY2Y0tRQjBZRS9qUTBrOUU3M0pUZjBVelBrZHlKRWFiN0pB?=
 =?utf-8?B?THpERDl3RVN5cmNoOVdGdWVSaDZiY0ZBenVHMWcxSTlzYi9pejJ3MHJQOEFJ?=
 =?utf-8?B?SE5lbjVyL25mVERZd2E0Sy9SdDl1RnVpSWVMdHQwckRGNmw3TGpnM3NFbzUv?=
 =?utf-8?B?N2tjdmxYazZXYVF1ZzFYK1VuREQrUmxCMVB4WlNWbEpuTFRFQmZTNE5lYitJ?=
 =?utf-8?B?TVVqUVRodmcyRUlLR0Z5cFV0TG1YREJYOUFPK0l5blVieEk0TlVmc1dJMG9G?=
 =?utf-8?B?cy9QTWNHNmdOTkxPZWJCSG9VbWR0b2IxSmhITkV4Q0ZHWnRNbTF1ckpWN2Zm?=
 =?utf-8?B?em00S2hieUJjRi9mdUVxNTFRR1QzL1JJYWZMWVcvdHljck8yWWRmMFV6T1Jj?=
 =?utf-8?B?czgvYjhkMG45cWd1MDdYZDZYUjBuWks3VHlWczJHSm9NR0JKYlRwL01BN08v?=
 =?utf-8?B?Z3ZUQ0w3K1dKK3c2a0JsVTJhRzgyamE0V2gyRU9Uck1SaXFMRGh1WHN3YlRy?=
 =?utf-8?B?QllhN0NhWElsWlBxVnA2Z1hDUERxaWpPWURyeDF6ekJyQytiSHVJTTc1MCtn?=
 =?utf-8?B?N05JNXRrWW9WMW9MUllnc0szQU5ydW1qcjJXbXM5Uk13YmpXdVZ3OFcwRTJj?=
 =?utf-8?B?UTlNdVNnK0ZLQTd5Rm5ndXpiVGFiMGVuODVRdEpKNVVRWGQ4ZEM0azQwRWkv?=
 =?utf-8?B?VUQzRTFSa05RNldwWFAzM1grWXFVUDZJR1hhSW8xNnBYcWVEMGhmQjZDVG93?=
 =?utf-8?B?WGYrMEJUVXAyTWFzQ25SdXZPVVBFTnhkQUl6NUJ5YXV1M2dJcmI4TVhiYjVD?=
 =?utf-8?B?MnlOeExMcHJRRmVVUFBmQ1ZVNDZ2c0tsdFRMbDVVNU9VaW1oQk55YXlhTUEv?=
 =?utf-8?B?YVV5aDd0SmtRVVhyakNPbXhDUTF5aGg3VVI1cnlhU2IyN2NMcTM4WUNMei9Q?=
 =?utf-8?B?bzgvbWpKbWtSaXg2cU43d0RHU0dmb1VjdXRzN3l2bkR4ODc1RnhqcFZ4UzhU?=
 =?utf-8?B?c1IyZUNiWWhIN3JxVVhiQ2EzaXpWQ0o5c1dtazA4VjdXQ1IzRG9BZWE5ZzNo?=
 =?utf-8?B?QThkMXduVVdtUHhSNVQvbmNod3BhRFc0ZFNwTFVWcitMaFFqY1ZyRFpaTlli?=
 =?utf-8?B?eXJCRDhaQUU2dmZURW82elA2amF4dzhNQ0xFclFsMmdrRTBnMXRwZVJ0T0hP?=
 =?utf-8?B?aytMcGdkRmdyRjBjOGtRb1ZJYlNTaEM0bEYwMGYwSUJjMnNrMDhMV1BUWEUz?=
 =?utf-8?B?TTd5QzFKN2ZNRnMydkdtMktNQW9OaWVFSFV4UWhvYVZHUUY4TkZvMTcvZ0xS?=
 =?utf-8?B?d1dOd25OQmliR2o2QzlHUFBRNzcxZHRyVGo2UU9oc0lNeWlTYm5CdDNQK1Bw?=
 =?utf-8?B?bmJWeGRnTWFqZU9nbEFpT2hlMTZBeEJTYkMvbkVYandhS0hBaGp5a1FmNzIr?=
 =?utf-8?B?bkQzTWNBdWpWVG1iQkJ1bUdxN01zazFTcHJsMUUwWXpQOVRXcW9GcW8xZUVm?=
 =?utf-8?B?UE4wMCsxVEgwL1VtQUswWTFvNUdmeEt0T1JZY04zL050UUxRK0E1WjFFVTFT?=
 =?utf-8?B?U0xHTjdLOWR3MEw1TWJwa3BjMHp4N3FOUGpHNkxXK05zN1NXSDFHaFlJME5F?=
 =?utf-8?B?YS9Da2NEOVJidXV1WnFBZERubGFDcVB3VmpmR2Q4VEdWM29yNTBlazR2L2xP?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa007065-c53c-4d29-d67c-08dde3e10743
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 14:09:39.1026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDCW7kx+o7MQ4+HFcZW7knjUw+TJ0DrOQnYmvMJe2OtJehAaGOdFZ+8Cnk2clab+6XWK3rqSV1fN26DtLtzCC9nt7Fl9eSRvT4cWRu470+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9064
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

On Wed, Aug 13, 2025 at 03:19:47PM +0200, Peter Senna Tschudin wrote:
> This IGT adds checks for the 13 sysfs files identified in the Xe threat
> model, ensuring they are only writable by the root user. If any of these
> files are writable by non-root users, a warning is issued.

As sysfs is a proper uAPI, I'd expect we already have tests that
excercise those sysfs'es from functional angle.

> 
> When files are not present in the system, only informational messages
> are logged. No warnings or test aborts occur in such cases.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
>  tests/intel/xe_sysfs_file_perm.c | 578 +++++++++++++++++++++++++++++++
>  tests/meson.build                |   1 +
>  2 files changed, 579 insertions(+)
>  create mode 100644 tests/intel/xe_sysfs_file_perm.c
> 
> diff --git a/tests/intel/xe_sysfs_file_perm.c b/tests/intel/xe_sysfs_file_perm.c
> new file mode 100644
> index 000000000..2833de10c
> --- /dev/null
> +++ b/tests/intel/xe_sysfs_file_perm.c
> @@ -0,0 +1,578 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +

[...]

> +
> +igt_main
> +{
> +	struct igt_list_head fds_list;
> +	struct igt_list_head files_list;
> +	struct igt_list_head pattern_list;
> +
> +	/**
> +	 * Do not change the list below without checking the Xe threat
> +	 * modeling first. You can contact peter.senna@intel.com or
> +	 * michal.winiarski@intel.com for questions and support.
> +	 */
> +

And indeed - it looks like we do have at least one existing test for
each of those files.

> +	/* DO NOT CHANGE START */
> +	static const char * const gt_patterns[] = {
> +		"ccs_mode",

xe_compute

> +		"engines/[a-zA-Z0-9]+/job_timeout_ms",
> +		"engines/[a-zA-Z0-9]+/preempt_timeout_us",
> +		"engines/[a-zA-Z0-9]+/timeslice_duration_min",
> +		"engines/[a-zA-Z0-9]+/timeslice_duration_max",
> +		"engines/[a-zA-Z0-9]+/timeslice_duration_us",

xe_sysfs_scheduler

> +		"freq0/max_freq",
> +		"freq0/min_freq"

xe_gt_freq

> +	};
> +
> +	static const char * const hwmon_patterns[] = {
> +		"power[0-9]+_crit",
> +		"curr[0-9]+_crit",
> +		"power[0-9]+_max",
> +		"power[0-9]+_max_interval"

intel_hwmon

> +	};
> +
> +	static const char * const devices_patterns[] = {
> +		"vram_d3cold_threshold"

xe_pm

Access rights are just a property of some functionality, and I would
prefer to test it in the right context.
This could be handled as a subtest in a functional test (checking
whether the API being used has proper access rights), instead of having
a test that tries to check the access rights of everything that the
driver exposes.

Thanks,
-Michał

> +	};
> +
> +	struct dir_input dir_inputs[DIR_COUNT] = {
> +		{ GT_DIR, gt_patterns, ARRAY_SIZE(gt_patterns) },
> +		{ HWMON_DIR, hwmon_patterns, ARRAY_SIZE(hwmon_patterns) },
> +		{ DEVICES_DIR, devices_patterns, ARRAY_SIZE(devices_patterns) }
> +	};
> +	/* DO NOT CHANGE END */
> +
> +	igt_fixture {
> +		IGT_INIT_LIST_HEAD(&fds_list);
> +		IGT_INIT_LIST_HEAD(&pattern_list);
> +		IGT_INIT_LIST_HEAD(&files_list);
> +
> +		igt_require(prepare_patterns(dir_inputs, &pattern_list));
> +
> +		igt_require(fds_open_all(&fds_list));
> +		igt_require(search_files(&fds_list, &pattern_list, &files_list));
> +		igt_require(fds_close_and_free_list(&fds_list));
> +
> +		/* We do not warn or abort if not all patterns match
> +		 * because not all nodes are always available
> +		 */
> +		check_pattern_match(&pattern_list);
> +	}
> +
> +	igt_describe("Check if only root can write to important sysfs files.");
> +	igt_subtest("check-file-permissions")
> +		igt_assert(check_files_permissions(&files_list));
> +
> +	igt_fixture {
> +		struct pattern_node *pattern_node, *pattern_tmp;
> +		struct file_node *file_node, *file_tmp;
> +
> +		igt_list_for_each_entry_safe(pattern_node, pattern_tmp, &pattern_list, link) {
> +			/* pattern_node->pattern is static and const and
> +			 * should not be freed
> +			 */
> +			regfree(&pattern_node->regex);
> +			igt_list_del(&pattern_node->link);
> +			free(pattern_node);
> +		}
> +
> +		igt_list_for_each_entry_safe(file_node, file_tmp, &files_list, link) {
> +			free(file_node->full_path);
> +			igt_list_del(&file_node->link);
> +			free(file_node);
> +		}
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 5c01c64e9..d904dffcd 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -330,6 +330,7 @@ intel_xe_progs = [
>  	'xe_sriov_flr',
>  	'xe_sriov_scheduling',
>  	'xe_sysfs_defaults',
> +	'xe_sysfs_file_perm',
>  	'xe_sysfs_preempt_timeout',
>  	'xe_sysfs_scheduler',
>          'xe_sysfs_timeslice_duration',
> -- 
> 2.43.0
> 
