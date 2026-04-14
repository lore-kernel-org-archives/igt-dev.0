Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE61ED7B87
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 08:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E2710E1E8;
	Tue, 14 Apr 2026 08:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eRldjVEm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A845610E1E8
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 08:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776154028; x=1807690028;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=eemQknvJJExn6snt0Q2I5glnWaUdUCszNd14yHAD2Io=;
 b=eRldjVEmHQ9Wr7wh4CvtbJ6dtp/tOpFi4uhMzjL497saohODhd1jxL6Z
 3OC2mL+cuzE8MEpGLT6c5bF5BqFMG1kDV5+2PQIZxUFnOMe+Ul975uRDq
 4IBUm4ksSpy+paZ0AxBbgWkhRvFkTZzXmvrJ83jrN+E+NbCT0btoivUCo
 Q8KjXE2ggBZt+R2F69ojequGnD9KoNw0fZZhHTX6wNnU3fGFL/jdeU5Lc
 YYNgASVphfmPMx82E8xw07i7lVOLQwOxHJpBl7b51GyKPURL98GoDUlve
 J8BcSKXKfe1xNoOp6P+fImlWNwkJ/QKXlYMJg5ftpXb0o1LdNbQ1XpWur w==;
X-CSE-ConnectionGUID: ozBAJm0YSYmDLLx8+2PszQ==
X-CSE-MsgGUID: zF/3JwDNSOGrSsYcBUAVNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87805979"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="87805979"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 01:07:08 -0700
X-CSE-ConnectionGUID: KDTMDG5bTOeSb56L0KRG5g==
X-CSE-MsgGUID: fGQaWGcGTQC+CzACGDhThQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234990138"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 01:07:07 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 01:07:07 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 01:07:07 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 01:07:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXBCmJMtExvFMejQh9R24OaHSjm8w2WS7ygt27EMXX2mQCJhMxCls/e5bj71YcSnRQBsaYIsRlaZnSOTsO6ri7vOKgki4MIdpLCEPKfvrHs4M4NChe4cJvBYqlu8sEldZ45zJ0RFyyCPdy86iXVpwMwfxyPpXv4ohNGUDxO2d6aoIwgCnkVsO3gsPEfFFwKZtDqVqO7g9H9hfLc3AhxR2xO4PS6eehIiTAdZf+YlKgGLioLHrCrg2yR3Moeg6bm9d4guUSXOPybUErQnSnoyUjMBP6ddwpi65rjZQZEdY8hJnwVQlCpe79DQ94MVe0pHY76eTCvg+UiIMj4j+oRFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAWRVXr74LTWYLeGUcqm7rDWU2i6vdJY5cf0rrNip7Y=;
 b=oQGk4xNfKFO/t3EjzJQ6Lw+jW1yiqYnR2mOPkNY6F6Ddd822Wdm4DtiQ4ikEAD/tiF5BYvJZ+00h9af0N3Pk4YTRIRkNJHts+yePDubg0/06DOD1i3mxa1YyEPl40KCF2qflhebks/7eNoDV4Tpj6q6euL+m23YFGQqfvALgUGIyy1G7XxIcw0BI3sFdygruEH4IXnSQLkOp5lX0P3q0nAv7ed3zQKjfx1uT8nzADXPqyEto+o1lX1oXkQJOPumncF2tdtvihGUOPcyfqE2sg+gPz2pBGupj7SMpIiv+tOndNB6uGkqVOphyrB1i7QdfpYrB27vt9r4Zdv5WvMF09w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH3PPF957B3B2A8.namprd11.prod.outlook.com (2603:10b6:518:1::d39)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 08:07:03 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 08:07:03 +0000
Date: Tue, 14 Apr 2026 08:06:52 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v3 3/5] scripts/hooks: Example guc log copy script
 and allowlist
Message-ID: <jn26ku5x5vntbwlnipmy7o26eato73wi56odeghml6auke7idt@2li7wvim6jiw>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-10-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413201722.808673-10-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: TL2P290CA0010.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::8)
 To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH3PPF957B3B2A8:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ed4429-934e-4348-1dcb-08de99fcd00c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: ePTeqlFnkCY6eO01mSRotLYnZizqrnIaFTXawhXlNl1+b6fiBLkbeZrWgHo6hE7eclJHVWjdwclxf7P6M2oNLRdHHIBn/lhCWTE5sneiyGKiki0venmJjEDWeGWAVtGBL3Sfzfs69ZIU9rdxZGgWDO3caj+vP1CIfKbv1XPE9aopGIcUZ00b0o8zEbzEBnWqIgVenvghqarp1zit4sIRGV/63SaNU0NpoRObkLsa8upzcBLWI2LqFzyjaE84rZ2HDdusoIaqHAASH1jPBuUL97DW3jIjRh+8iuV+ekZ8WQ8pT+SZci9DjyAfF2RQrEOdOonMhvDaLsLentQWmqV3r3HNLoxtd9DyamqKcGW9DwpsYWNrwnZ2FjJBDorFy8Q5IgJc7zR+si0fC33+n5N/fURTuidFk87cz7rT0ZrohzebVoHMeoPzaSkT0d3v9SRYfYqNIbDRFfrPOTVBiuiuU4dNXVrqKEwM6sKWSZJxUI/DIIHwK3ikGWgompiX/ez+wjqxTUMmgtW6NLTJkqi3bZi9GSoRMR8t7Mgd29KlMF++6kaS7n2otrNXOR+YSOKxEC/ngOjJH6YX1qUy/0XrALPr3E/txEyei7GTq2qPF3u8uCPNWfsZMTnYtLjnWuY+XeHVJCFpmAE1x7s5phsm35KWZ24taijBS5EECLkF3FoSKcxLszdAncQ4cimbk6JdO6nmt+J0dJ47R4Qyiyu3rz9ywGRZTdBz1edmRjodZI0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXkwb0NYTHh2RjFsT3NlOVJLNGltMDhqZmhaRDMrRWU0emFDbFh1TUlYOUU3?=
 =?utf-8?B?TklLTHluQXY2ZndzQklYR2ZEOXpRRnU4cE5GSlhkUDlhVGhkUXh5ajhwczlo?=
 =?utf-8?B?aUIzQkdBQkJSTWRrOTJwNGRuZFBoOCtyMzNVM2xnelFqRkRyTE8zY1FGOFB3?=
 =?utf-8?B?WmovVkp5Ri82V0pseDNZcUJ4dVBxR09kSmhIK2cvVnpDQWJteXFaRFEzTXBJ?=
 =?utf-8?B?T3RhV3ZITm1nYkxhQVhUeFdiVk4wYkczclBQNHFuM09rWU5sczM3WU4rSW40?=
 =?utf-8?B?blhXYnFBR2xvSWN4WGFXcVRjYzVpd0tLY0s4VHNuOVpMOFhXTWZ1VEtJeWlC?=
 =?utf-8?B?WTF4cWpWaVRtNzhxSWNCK0tNb2EzY2piV1pjOXliTHR6YkxqR1Vtb0xuUUJ2?=
 =?utf-8?B?N1psM0NSTkNXaERHRnN0RS9CZ1BSUHBqTFpnVVJBaFRPVjZwdFVvTkZnZFZU?=
 =?utf-8?B?V0ZRcUFTZlVyTFNJZWtLNER1VllScHJ6R29ESkYzNlJwTndsL0xFb0RNV3Zl?=
 =?utf-8?B?SUVjdkcyM05GQjkyVU1iM3daS1JZK2kwRTFZTXRyNno3SGEvZ0UwQVJNb2xt?=
 =?utf-8?B?eVVJYjZDUWtHZEVzdHNZWG1yWEdyMlFwY3hrazU2MEdjenpYZENDUGU2NVM3?=
 =?utf-8?B?NUhwWGNwNlI3SW5SMnRJRnV1WDBuNTlqdjBIT1pXODJiTkpEWVhZb09jWHJE?=
 =?utf-8?B?aE9Vd1o1R1NlQW0zeFdlVmJjNEIvM2dsUXVrTlF2TmxmUFNqYTNCWXpGVVlo?=
 =?utf-8?B?czVpUlpNYXFIMWMrMVBiSTQzaSt1SXhidXdxcjFac3NOUjJUbnhLQkl6VDdJ?=
 =?utf-8?B?VFUrUW45dk0yenJOcXloSTUrN0FNeVFBeWoraHBXR0FCT1RGbE9hWVN0SFpz?=
 =?utf-8?B?N29WTmZxV0JDRHB0bnZ2dklYczgvVXNBRnZ6dXowSGVPNTI3N0FRdHBnT0pq?=
 =?utf-8?B?d3hGQ2lsQzBVSmhJUWZCZktnTjRFTHRkVytTcUxjUnNHMW9ZM281NnpuUFdC?=
 =?utf-8?B?OHUyMTF2Ujc3Y3FHbGU2VzlXTkNrcEJhN1VkMFZOMHNPdlRWVDk0aUdkY29W?=
 =?utf-8?B?bjJrd0dkMCtwOXpBdEE4eUdxTUtOMGNyM1Mxc3lrNlpzMXRkZUdVdEI1ZG1P?=
 =?utf-8?B?RG14S0tKZGx5SWVQYnZtN2tpQjAxTnhUSFdydFlrZDg4VGtGdW1ZV0NJS1Yx?=
 =?utf-8?B?ZXFkVnozNVpWUjNRUTRJeU5DQXF1ZjBmNU9Zem93R2s4U1RUU3g4QWpJTnMz?=
 =?utf-8?B?SjdWUTluRWRaREdwcDQ5dXZpWE5XTDVtMEl0MHpaVGowK0s1TFRpcWVubFY3?=
 =?utf-8?B?bXdkRG5JNzh2UnNRZzVpbWJKS0lkRXpyS0pkczc2TFE0T3UwTFhURkxObUxY?=
 =?utf-8?B?eVBZZTJRcExlRENRMklpdzR1Y0QwS1huOTBrZndXcHkxNjdSejJndldPUXJV?=
 =?utf-8?B?ckphVFVKbyswWnoyUE9adU8zL1BXbE95K2dqbE82bGFLYWprTlA4dE9ITUtT?=
 =?utf-8?B?WFJGU1JxTGgyUkNCaVBveWRTZGdpa2R3eXlqQ01vWlBQUWppS0FjR0xibDRO?=
 =?utf-8?B?RGVaMmhnNmtCcjdOR1ovaFdpNDFOVENSNXkxTUJQY05UcjF2eVFYTDR0ZURV?=
 =?utf-8?B?ZTRxV2Y4NDFXc3dNUGpaT1cveHdzV3BySEtNdXAwMnErVU5wcFgwK1ZvOXZO?=
 =?utf-8?B?am40TEs5KzNZUFdhVGNpcjVrcDBlWXlmNUpFU0wvZk9WMjJWaFdBbVVicXdN?=
 =?utf-8?B?bjB5WTcrOTZSTzRndXpJZGNQZkVicit1VEtiNjE0ZzlqM1Ntcy9jSEpKRkhy?=
 =?utf-8?B?emd0YlFxdERmUmhScFlFZlJQUkhYWjAxMVVHcnJra2JOOHEwNzExNVdoS2d1?=
 =?utf-8?B?WlVSQzV6MDJoY1BWTzhIdXZvZ05Nb0dYQnZuSGFlc1drdXpnZGdsRlJPYXJV?=
 =?utf-8?B?d2h2TzJEZmwzaVZwYlJxNzBHYlU3UkVhVGVKYithVEZIRGhOQlNOVzhYZTJF?=
 =?utf-8?B?TDdWdmJPdTBITVJ6OGRaMi92ZGtOMERmNHg5b2twV3NiU2lOTFVMRkthL2ha?=
 =?utf-8?B?T3UxQ2c3SXQ3dy9XQ0VCSUprbE9YVDBndkx5dFlnMS8zZStkS0xXd2lPQUJk?=
 =?utf-8?B?VExScm8rQVNLdkpNL0J1Q1pudW4vemRqWUlMaGZZbHcvSVpDL0tHdU1neGxM?=
 =?utf-8?B?emJUZW02OHF5OGdIUVNzZkU3UHpOdGtnNlFWaHZ6cjN6NC9LaGZqQ3lwaUZJ?=
 =?utf-8?B?RElxR0dHdlhaNi8waWFXWmNSWTBCZGN6eDlvL2Q5VWNiZVdqWDQyMHE1U2pD?=
 =?utf-8?B?V3gwTVo3N284ZWV3SzdsOEhydmJsZy9vak9YSjhiQUcycXJtZUFXRHZYOENU?=
 =?utf-8?Q?U1YDNQZ0O+z+EHG8=3D?=
X-Exchange-RoutingPolicyChecked: VhB7OLvftVLpQKgIe4GpuGaMGbwM+Nn1X9MFEks5RJlgApzoeKxXIfWr5HrBmbYXXFw4PaAPh+Xkt5GqeQD2tcZuDcLSZtIVaaVEKLY8exU54TSun8HPi1Amm7MbB7VDrSzd5i11nTXz8e0QxVOJ2/GBeY1o0cjstO1hwPwoF+JTu1O/hhza/gJ2gNv8zBfbso5t2GSDqebT01z9UniI5/0OkQAnHgDxPICWWx2xLHU2ZGpfIwSgTKirJs1cnWSgHcaJlUy5pYMMWcgD/Dz3cGjPPX6qFwbKc67gDBWjQDqpvdf4aQfuJIENTMwzU1GWSaCov7yKIgb24TK6S9q/tw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ed4429-934e-4348-1dcb-08de99fcd00c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 08:07:03.5451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XkxZUYKP6wl+Svy3ZnOkdN7AISky1LNBytqZkfxJIxV0oYDyyC0l0tieSL/go5/LR66MOV+mOYlfHjzaTOjgLkiwb8qRXX0vYdN6nEiZWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF957B3B2A8
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

Hi Zbigniew,

On 2026-04-13 at 22:17:26 +0200, Zbigniew Kempczyński wrote:
> We need to explicitly extract guc logs for failed tests so add hook
> script which does it after subtest/dynsubtest execution. As copying to
> attachments takes a lot of time do it only for failing subtests.
> 
> Adding this hook script to CI will extend execution time much and
> using allowlist is necessary. Instead of allowlist argument in the
> runner (previous attempt) now script filters such list on its own and
No need to mention development process (previous attempt,
previous version). Otherwise, it seems like you are referring
to the way this mechanism worked before your patch was
introduced, which is not true, as it did not exist yet.

I'd split this section and leave the following in the commit
message:

 Adding this hook script to CI will extend execution time much and
 using allowlist is necessary. The script filters such list on its
 own and decides when to move forward and do some post-test actions.

and move the reset to --- section:

 Using this approach, instead of previous versions, is more flexible,
 but moves decision to script what causes it to be more prone to bugs.

> decides when to move forward and do some post-test actions. Such
> approach is more flexible but moves decision to script what causes
> it is more prone buggy.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
> v2: install hook to datadir/hooks
> v3: migrate allowlist from runner to script
> ---
>  scripts/hooks/guc_copy.allowlist  |  2 ++
>  scripts/hooks/guc_copy_on_fail.sh | 47 +++++++++++++++++++++++++++++++
>  scripts/meson.build               |  3 ++
>  3 files changed, 52 insertions(+)
>  create mode 100644 scripts/hooks/guc_copy.allowlist
>  create mode 100755 scripts/hooks/guc_copy_on_fail.sh
> 
> diff --git a/scripts/hooks/guc_copy.allowlist b/scripts/hooks/guc_copy.allowlist
> new file mode 100644
> index 0000000000..04cb3f8298
> --- /dev/null
> +++ b/scripts/hooks/guc_copy.allowlist
> @@ -0,0 +1,2 @@
> +igt@xe_compute@compute-square
> +igt@xe_exec_basic@once-basic@ccs0
Are these the most prone to fail in our CI? It would be good to
mention in the commit message why you chose these particular
subtests. 

[...]

-- 
Best Regards,
Krzysztof
