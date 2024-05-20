Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD06BC25B77
	for <igt-dev@archiver.kernel.org>; Mon, 20 May 2024 19:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C95110E34F;
	Mon, 20 May 2024 19:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NwTjpOHQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CD910E622
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2024 19:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716234263; x=1747770263;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jgsYXBV32tngFtG7jy1rL6OSqPn0G7yInywpRiN5GWA=;
 b=NwTjpOHQWjZ9YzERnAZasp44KHExMsXfSx5xnO683Fun5M9D5VpQfDo+
 Mta+6Y4a8iWTN501HBKE3ah7r6NErRim1FbRHBxzFuS8RqYMOavFpUnYr
 o3mdc54ofaF07bfhXheXf1sjrws1zZ2GGFbI9dMzp1GC4HVO/t3GBIiS3
 SodBtNmn9uXO59w9QyOFLmW6KABIa647Z6CJAvfPn65k7MSL1CSvQZxBY
 zTvcHIobCM9BTgENiYoWuvH7EqmExRhyuo28xbPiBpX53Wn+qliLqtLkg
 x+8qM9Wp+UASMBebl5qqrbg0YR2SHOC+npUdycahz199sCiS99/U/csUs w==;
X-CSE-ConnectionGUID: g/03hegLTzCU6eocTNY9kQ==
X-CSE-MsgGUID: +rs57BSoQE+EAoW5I7nIRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12563038"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="12563038"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 12:44:23 -0700
X-CSE-ConnectionGUID: s7KkCURiSfuj6n9RN9vNzA==
X-CSE-MsgGUID: v3q9kRkTSiGRtoLrtukUEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; d="scan'208";a="32678585"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 May 2024 12:44:22 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 12:44:22 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 May 2024 12:44:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 20 May 2024 12:44:21 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 12:44:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbfrNKdZUSP3PQD+tGJPZq0gbxyiW3IpSvOExdJ2P509YRcYCiWi4am9NOeavZ2J0FLL+G7x8634yufgKVdRGqaGzPIZT8M2IcR1EPszh01lp/8p2QA0hkDTMuiHmPh+ofiXTCdT5I4O9H9Q1uSnPO+DfifKBlJmiWcRqKzHeLqeUuTvIAG9YQwI3ASfFJSwhA5SDjgGpgwom3zaeMBINooa3QN/LhZ2cIa8bdmY1aVmAea7BWQau2pqEL4dEb1UWlHdphnXeGEn/gFcrUMnehwSJvCrtw2OmfR6Lv+0yaXPaREt9b3NWHnHvsAIPOFVmeWa4kAc312gCcIuuYzw+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nF6FF8FXMNtP9Sf8IojqFlHPfXm+Qeb3tCeGmnVRFbg=;
 b=hrjZrmiERFHlH062cKMB8WbcWUORnilEMzqv8sAjEvyxje3hRmFGfn/1ciW84Em16JQeaUdmsxQeQtvtPiR6oyNBrbPhIR88lSi+cFCuTLvJnE02/iIM9x22+/0NFRfp0lKXbdEkaxqzBHhI2lWOLR/8DxLdToS0PGuK0q2KiKg10PfwKvfhDNMjTT1NghQbSNr9qDzhxhhGBKAGbtRlUUEoAWAHelyXCFB1t7RZ3jnXv7UPPYMPwNHZ05C/Rq6drvvmZsA7MUM/n8Wwtg37uH3Yhlwb/+FPUMZnTRy+JFithFZEmLWCSit2LL6L/DIG+F5JBgX/yNVQUhOmVh8LOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6102.namprd11.prod.outlook.com (2603:10b6:8:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 19:44:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 19:44:18 +0000
Date: Mon, 20 May 2024 14:44:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Patchwork <patchwork@emeril.freedesktop.org>,
 <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?Q?=E2=9C=97_GitLab=2EPipeline?= =?utf-8?Q?=3A?= warning
 for Add support for hook script
Message-ID: <r6557pxajmamz4k4elosqjsybgscx2kwfqfrj3kls33uxplanz@tytnenwdychb>
References: <20240509152442.189166-1-gustavo.sousa@intel.com>
 <171527122310.2038581.2879457245695725102@8e613ede5ea5>
 <171527425512.5772.1654105508452706087@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <171527425512.5772.1654105508452706087@gjsousa-mobl2>
X-ClientProxiedBy: MW4PR04CA0253.namprd04.prod.outlook.com
 (2603:10b6:303:88::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b277bb7-4122-4c07-630f-08dc79053ca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007|27256008;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PYlIqrinZwkenoxz3K94BKpR6nOk7H0XHK0X3VPWAitAhMKQ/scVYsXkjcwq?=
 =?us-ascii?Q?XR3iSKYbFE7z9PIBAMXinNZMtZt+zjAiIPXNHEtd/e84J+a7jw3XT97+mzzS?=
 =?us-ascii?Q?veE0G5Neokn1m6vWn/6Nqr8oZuHcDoIY3OKuE+rkHTXNDwY66n15B9q7MN8K?=
 =?us-ascii?Q?ssratKjTIcAPJypMbfGDAPmNY46aaGc10ek9PURCdTyYNcsU04XvbwELTy0O?=
 =?us-ascii?Q?Olz0LrbxGFDoxhUegKKXICK0VbzNlAPIe6eyxge3j/+zQDLuc5Tu9alBo5ft?=
 =?us-ascii?Q?LoZk5+0o2q42NYec0RX3LvGLgsGnAw6gu5FzvdlRIqlHAaLZ9P2y6ksGiOB1?=
 =?us-ascii?Q?M0YiZJ+5s+opT/VP9Ram0hESJKbbBrTv/5RDkDsETzMaz4D31WvD5ZTiyf04?=
 =?us-ascii?Q?etmaUV/6XSs5Ka9B2V57EzgnshWW1DA1MIvQQBc9AluTOhqjluuvjVwAZcx4?=
 =?us-ascii?Q?NWJX8mlWnogT5It7Z2vWjrBv5Rwvvdf8alHdm86n6ZC5L0+td7FrLonthk41?=
 =?us-ascii?Q?VXDRqIKe7VMvUXTObMoIDAEHGThVpzSO9/D0u4aDSSn7Xstc5PkRih73cXxC?=
 =?us-ascii?Q?M5CU03dKOmAN5Ct/NTyKE4oS6erhjwaAscbxzUsu70eDdHj/1TtS3KXnhFI3?=
 =?us-ascii?Q?WVLm7kvHtLQWRpJzJIQpDK28kw/nxh7PuwBTQ3z10iJVU6ZCWxMVmiba8NtB?=
 =?us-ascii?Q?VVrQHvR3bUQukOxwmNx6c/U5XIhaVfojD9zLjsV+Zse756xwNYbZLeepTEW9?=
 =?us-ascii?Q?ll1eWw73Np74C1aTC8iW8l+xpoIhRM5v8S2PAxX5LNXVJ18B7n1IbKY6THv+?=
 =?us-ascii?Q?tRFmcK1Md8Q5jjge/9rQEHUOuXIjybmgHOoGcGw2NRFckO0NXXveelT7GUXR?=
 =?us-ascii?Q?jLdajFsERFk6iWT5yZ+48FD4+oNSNNXXZjyp6A2ewq0Zss/qCGEyvxuaq1jJ?=
 =?us-ascii?Q?5ijVviokyQJwIJDU4XxxIMkUGgfLKcvfj+UlphopMHA2uJWCeTucUuuYrSfz?=
 =?us-ascii?Q?NxaG6UhljKfkgA/RA0ASa+hlSZoSXSQBTllyEJkuCmAuH3F5uuVR7j+cD084?=
 =?us-ascii?Q?eZ2LMWSnyDYHMlIZO0lMr0AJeX0qeCWK5gR+DDWfXP7OL4LM2YWPlq2rkSFm?=
 =?us-ascii?Q?v9tUdIPyyRwKap3V/FjYdPoRYjgh+hlUpo30MBd21POw+ChVphCwQ6CDUF+w?=
 =?us-ascii?Q?b8Lu15fGZtb026nZhDEBc9RzJGWn48nOiQTF4oBXOMiJ09XFLz/j7Nt4i1kA?=
 =?us-ascii?Q?cP3GnOcSB/E+RIfLL9dnNb7C6NyAHDt4OsxH39RTo6sCVaYVtfU1V7hSoUtE?=
 =?us-ascii?Q?ZO4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PH8qqwwLLe/dUD/+/GXGO1KSgPQcPUVGSlSSTIFf7NRLoWZ8p3zqP6qgrPL2?=
 =?us-ascii?Q?qwGHl3yJQNCwQZ27vEm/UiQb0PsVJwu6/qwZ4SPIrpjkkBlB46D49p9klBgR?=
 =?us-ascii?Q?EqJoCmKHw/KNJJI6FKjmODuRqkxAqL35FfGGAAeaMR6MiyQn5UnswuTvDzo8?=
 =?us-ascii?Q?IWgQUhEPqeXqLJX/yR+YBQOYARi7Be/hZMGjPNN16U5PRVsqTUClFi68CmYV?=
 =?us-ascii?Q?dqKJCH0Pa2/P8SoB+t34Ycvi/U5cmNAVj+FuzOB2dsgK/ObMDP2dVuGN0AYx?=
 =?us-ascii?Q?ApwiEUz7AthgyWKZjZ7q/hYuBh7W0Z1MGT9fOWZoC8KsxGM+Csj6USVsp9A1?=
 =?us-ascii?Q?PzIUIj+pPese1wRYxCq0lquUjVa2I06v7xMxtLAMLvc6MN8Dbaoc5F/ZAb/F?=
 =?us-ascii?Q?YUhzXtWMEL0b7G/XLK+q6O4Ril3506VRNgouqwsPlX2Fk6ctXLiiz/QnyD/u?=
 =?us-ascii?Q?yqMnCwDEVPd+m2SGtwGMvaCCyUJVHvG4PYSvB6jUK8eZSPSBfhOYBBel2SVZ?=
 =?us-ascii?Q?aCx7jjfocPybDTcvFxEH4YtNPvjzh80M/DgU5gL8n5sua0HSdDVJEh4cFt/z?=
 =?us-ascii?Q?/bmXRLqqeWGHRhabscEmeE+eodYZ3mxmPlVLdj10SHRehEyc0CIZU8CwGgks?=
 =?us-ascii?Q?V886b8HFCaK79Zdy47IrbNYnx+lJQTdKL/CGB9y08A9vePqbtdlCASaNZQYG?=
 =?us-ascii?Q?eNh23DIfjvfclk4UveIGDYmRIrXLt6S0/yPPNGdtX2num6ZRQBS38xl2eUnn?=
 =?us-ascii?Q?hDVZae993q5ygtJzUdgaKhNcfpZTNmEdw7hHcPC5fq09x/iRJBfN67a90skT?=
 =?us-ascii?Q?9TjGQ61WX9fSIfuv7v+dPLdbAcBxl3uSJ87FMuQbt8oLdQ3tZ++rgTmshXmL?=
 =?us-ascii?Q?9WYZPCQ6F/1rcYDC1p9Jb8g59X/4oyUmyiZctzMcnuNMnUq7gGEw6G1PvW9v?=
 =?us-ascii?Q?GDKW2YRYDAlSnNzObH9qyqzXLbuAm67jEC9PUfUNM1iwJFUlf76HNZfHUgjk?=
 =?us-ascii?Q?04JIYHfxDYoSDv0spLXhc50ARUSyHZVn16tFAHkMtKkdUdbYG4wolUOeJ4vF?=
 =?us-ascii?Q?PAqpnzQV5gHq0c2N+mwaesGzsHT/OBDBfvo3SDMQ2qJMfMh0P+tCNgJdKbxk?=
 =?us-ascii?Q?B2oHlCxhMS3FDtIPB5/ihwxfx5xlq5e9n52WyTewkpZVhk6uSbI5j2pCWh3W?=
 =?us-ascii?Q?zcKMFz0aQeaVz6zg2etBWlRI4Fp7FhZWJKzHjHeHZxocSZ7IBRD0/09wtq8K?=
 =?us-ascii?Q?Z5fANpe1dZxtsxJ1l3VJDL4DHyHi8x6Tq1URku+Hi9rm5+2eQIdP/ywTlUHS?=
 =?us-ascii?Q?EEtKSLYprLDwc2bgItrOyhvSQ/rj7273g4UTIZgATvzpYTZbitMzpaKrIzBW?=
 =?us-ascii?Q?3Y36tX04NTHO154h5D2RDw2QQNBlE7PqhQ5HCrJPD/SaxiewoceqKcr2S9AJ?=
 =?us-ascii?Q?+NkyWtl36ETbN7oEgv8HRoU1upu1XAzQKQCB4LYr2wLTThsF5VxyqgvsiHRI?=
 =?us-ascii?Q?TwmIPMNaVmhp+s/CHspTXatl63DB0rSCRYb7043f18XzV6AElj2YS7jpCJ9E?=
 =?us-ascii?Q?topfwcKkbwQ/g013gw28lR16veQOO5v5/xLq/Md23KDnz4I6qF6wCi4i2mpE?=
 =?us-ascii?Q?yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b277bb7-4122-4c07-630f-08dc79053ca7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 19:44:18.1769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xqe8qc0UQLFoZoYBIjqeRk7WWx+5ySXX97TRXmphk7jH/zz1Rf1U35GVU4+UHl2ICp2Vd2XlTO/uOdYadcD7dQ8+pdtbKpAkWE4YoLCkEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6102
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

On Thu, May 09, 2024 at 02:04:15PM GMT, Gustavo Sousa wrote:
>Quoting Patchwork (2024-05-09 13:13:43-03:00)
>>== Series Details ==
>>
>>Series: Add support for hook script
>>URL   : https://patchwork.freedesktop.org/series/133391/
>>State : warning
>>
>>== Summary ==
>>
>>Pipeline status: FAILED.
>>
>>see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1173738 for the overview.
>>
>>test:ninja-test-minimal has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58540606):
>>  26/30 lib i915_perf_data_alignment            OK       0.42 s
>>  27/30 lib bad_subtest_type                    EXPECTEDFAIL 0.37 s
>>  28/30 lib igt_no_subtest                      EXPECTEDFAIL 0.42 s
>>  29/30 lib igt_simple_test_subtests            EXPECTEDFAIL 0.27 s
>>  30/30 lib igt_timeout                         EXPECTEDFAIL 1.32 s
>>
>>  Ok:                   25
>>  Expected Fail:         4
>>  Fail:                  1
>>  Unexpected Pass:       0
>>  Skipped:               0
>>  Timeout:               0
>>
>>  Full log written to /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt
>>  section_end:1715270916:step_script
>>  section_start:1715270916:cleanup_file_variables
>>  Cleaning up project directory and file based variables
>>  section_end:1715270917:cleanup_file_variables
>>  ERROR: Job failed: exit code 1
>>
>>== Logs ==
>>
>>For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/pipelines/1173738
>
>Looking at the output on the page linked above, I see that the test I
>introduced (igt_hook_integration) is failing but I passes locally for
>me.
>
>Is there any way I get more details on the failure to investigate? The
>job output says:
>
>    "Full log written to
>    /builds/gfx-ci/igt-ci-tags/build/meson-logs/testlog.txt"
>
>, but I'm not sure if that is available somewhere for me to check.

GitLab.Pipeline is the one executed in fdo infra, not in the intel
infra. You use the container it's using to repro it locally:

https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58540606

	Using docker image sha256:08904a47f4efcc161569a9b7f88c458fc6e3e85a2225132246af9cf5cc6c4e5b
	for registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-c21f9e2242955d29c7bb2fd9703230bd9799eb8c
	with digest registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal@sha256:8b51a86fd81e64c501c9521c37fc8ad6f2550976931c510eb0ff4f6a328d477a ...

Note that this is the "test" phase. You should also reproduce the build
phase. From the logs:

	Downloading artifacts for build:tests-debian-minimal (58540184)...

which points to: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/58540184

The builder and test container are the same, so you can use to fetch:

	$ c=registry.freedesktop.org/gfx-ci/igt-ci-tags/build-debian-minimal:commit-c21f9e2242955d29c7bb2fd9703230bd9799eb8c
	$ podman pull $c

and to run (first line I conveniently alias to "pod" locally):

	$ podman run --rm -v $(pwd):/src --net host -w /src -it $c /bin/bash

	/src # meson -Dtests=disabled -Dlibdrm_drivers="" build
	/src # ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
	/src # meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
	ninja: Entering directory `/src/build'
	[2/2] Generating intel-ci-tests with a custom command.
	...
	13/30 lib igt_hook_integration                FAIL     0.12 s (killed by signal 11 SIGSEGV)
	...
	Full log written to /src/build/meson-logs/testlog.txt


I see a bunch of lines like

	Unexpected envline from hook:
	Unexpected envline from hook:
	Unexpected envline from hook:
	Unexpected envline from hook:
	Unexpected envline from hook:
	Unexpected envline from hook:
	Unexpected envline from hook:
	Unexpected envline from hook:
	Unexpected envline from hook:

until it's eventually killed and line is truncated:

	Unexpected envli


Given the fact it passed in some distros, I think that debian minimal
installation doesn't like something in

                 "%1$s:printenv -0 | grep -z ^IGT_HOOK >&%2$d; echo -en ---\\\\x00 >&%2$d",


Lucas De Marchi

>
>--
>Gustavo
