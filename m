Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F59CD3436
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 09:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAFB10E528;
	Wed,  6 May 2026 09:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c5WrQ2aQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611BB10E528
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 09:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778058224; x=1809594224;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=YAKlBY0RaM7fNBKdP6trEyfnCXJVyEAQuuKHQsCVsAI=;
 b=c5WrQ2aQ+CAL01EgGRLIJAgZHCol28TBJbkodBlzmQaiPn7MGLDEESD4
 +KZH1+6udHU/A4FTUd6xoGHRvy5EahUVfDRrPFR7AffBvrDJ5fIJSPDeP
 fT5Z34tmJl6Gh4lxTcuesike2qD/iiS92EW3eP00NCfa4QWZBA9VGQIwu
 mO2i3PwaDvnCxJ7hD9LdjqPkP6Zun+BPIfVByDvBY8/a/HsuQ9L40UsmS
 o+QFoArJ4t/6wbpvo0Ab5lRuS0qt8DVYHFf5sjOYo8tpylbCwKyeRcwdp
 2lHSlpGOKjCudQwC4XKXl2DhcoPQoHqJP2+PgIFmsjc3VvbUR0U9wwfP1 Q==;
X-CSE-ConnectionGUID: fEVwowX9SCygRgxpx5CB5A==
X-CSE-MsgGUID: ++k07irUQOC+C64tGjZqRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="78963248"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208,217";a="78963248"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 02:03:44 -0700
X-CSE-ConnectionGUID: xrHiKm6ETJOAQhM3zcEtww==
X-CSE-MsgGUID: I2p8N3K9T167G2FDERyVKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
 d="scan'208,217";a="236329693"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 02:03:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 02:03:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 02:03:42 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 02:03:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEonqFs2lZDi1H3VBs4WxwGAh5MwUqyL58oWVQ1mzgVZV5TPhCI1DU6Jndz51h7V0gGtjvdRegIS8LD3031SPAL0bU9rXdCfzo4wl6OWRwUKfQXhCbqyKgytb4r64YOjil+uDKI9c7OavPjcnWxxnMY60zhdY8ou+GNUj+XLFEuF2MytovcOLTQg0vo0rEXXg1+Ttx+o1lXfthikMD5KuZNdr8TXBedilNQqScy0ujzCczGAOkjDm52FbXXKTAM23HrNj2oRyfIWrLHWO/sD6HGub//PCzURQny8h2FOsGmX+TSRn+ZyCsHP7Ozo/dJProqWxqxsX5qnxI1S8sSTGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrtggwwCQ2PzXBKPVmFo4t37th7W3oaG/4FHP5dqBUQ=;
 b=EgwAfBklnsUnT1noXWJnliCYCOXxxMyBTN8cZu/5ab2MD/GW2hWeKHqZV94g2Tlx8hFGslKnDBBCTFbSI8JLYMS3W4wDW9xBqcouL0zaQpKmYkLPdquRTKjhqQPFZYuhPGfKphrOM59W3dsYi9fXqK/R0Lu+zMQMi0/hdAhsUvRNAPRrz/fPbO9Y2e5+M+XSw4ukGY1+MYrWOqCPGGJhQYKEOjmou/YJSsvz8h2HBeyEsicSFL6zcQDwgqnE85bfbezbOfpCatN/Cu63jCIhJQWXvGmVJWlQfSpPGHcOofxzsw5vNqOA1JLFNoQvzLVK/nrq5xNUWya42TkZAtsVYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by MN2PR11MB4663.namprd11.prod.outlook.com (2603:10b6:208:26f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 09:03:39 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%3]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 09:03:39 +0000
Content-Type: multipart/alternative;
 boundary="------------quK2SLbEZAwFM5MakoIPHp60"
Message-ID: <e029b369-02b8-43e4-9b94-d91b1a0e54ea@intel.com>
Date: Wed, 6 May 2026 14:33:33 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/perf=5Fpmu=3A_Ignore_SLPC_efficient_freq_during_test?=
To: <igt-dev@lists.freedesktop.org>
References: <20260409090750.546999-2-sk.anirban@intel.com>
 <177579865683.449057.16543680608728951586@a3b018990fe9>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <177579865683.449057.16543680608728951586@a3b018990fe9>
X-ClientProxiedBy: MA0PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::11) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|MN2PR11MB4663:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed0fce7-dc9a-4837-b38a-08deab4e5cd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: mNxs/iSy7wtt6RC/C3wYkLub+DnRYSLmSM+g89D1YvVhaMzki8fG8Q571T1dO5DqSU+fHslvvoTvl3V5WE5uGY/vZh1OZHRZurOPKmYWT5otd3C5WBpjKLhUtOt19oDgoFEO4qTAARe0bHOVp9l/gpQYojtsf13q9OK6C5XXD74NqsxLSBlN1PHq2WowrfeRWQ+Qq9ANUCNIvdV1146LISgKtocoHKG3zmzHFNaNmqyNFDClXGPFsXnBpVEiaA/K9INZ7HE6stdYLrrsnKA/sZABdBMB7sIlb5CbVZTr58TYiifQgF/7X6LbWPRnweOJdpdqw46ezYWU4v29YE0FXvWsxtrfFV/oqAp3NkxgX6mHM0W2QvnmWaY/yfwuadGJCZrm7aHdyqmdmHexAJWUuhxn50d8xLsyB/ctWsiaCL5MT+d8yRIYVlxFXdW51h8ynJesipPpjisUSIdXTatO59mZrZJ+o7oQv8aa8O5Y+xveZBecnJA9Kfu4G4YVsIg50mzyD5z9nIMwrvtbMoYX428BktfPd5srR6Vs0KZX9I1i0hxECNgQraeSEDs4aNxivRvihDS+BxMwx++oaVzFriiOHmrYtey4vEEzUc+M4+6zlrx++oEzOri4uon1khhsvr6Qqyb2Y1i8zET2E9ylCA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(13003099007)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDdQdnBQQmJPNytxVk4zcnFaY2dNcDBBbkdKRWVkakMrejNWVnIrV1hySG9T?=
 =?utf-8?B?OWVacXExYjNSS1htVlE1YzNvZCtHZDViM0hUVWpSWWZtMkJNK0d2QTdHWGpa?=
 =?utf-8?B?aFo0WUtoTFR4V1NCb1RlQnhKQWpWYUdnYVdnQkNham9ibXJ3QjBZUk12cHVV?=
 =?utf-8?B?MjJWWUZPWHlsMVMzRjBtSnlOb3VCbUdQRDJSRGkvT2R5UFR2a3F6M09zcXlC?=
 =?utf-8?B?OUU0ZGl6ZTJQaDF1b3A1N01FbnU5OXZLMDBiKytjb1o0WVlOSDBnS3hLeldv?=
 =?utf-8?B?cVU4aDhNTTFad3RReTVRUndXeTJ3dG9iZHQ3alVHZXdWNDdCZVFhVUxyYVQv?=
 =?utf-8?B?c0VMdzc2dDhac3N4QWxwdUIvN1VpRHpnNjNwRWpGVndmSDFLN25yemFjV0xj?=
 =?utf-8?B?WDM1MUlzeFJ3bkFTOHdmYzdxTHZHOTZIUmt2dDRjR01BWWo3SnZ0Q2ZpVmVJ?=
 =?utf-8?B?MldJMXNqMGtxVHV3aFlSUHpxRy9LNSswbUJoRnJUMHhjVG1CUVNvSnJwNWpM?=
 =?utf-8?B?QndyTVNKVFRRNmpadStpZEZHWmNtWjJkY0FicmV1ell1ZEJjaWg1dEE5b09r?=
 =?utf-8?B?WlNmQWs4WC9hQmZ6SE5EclZZUGwvNDQzSDVDMkM5dzlRUWFZQ1Z4TDJmWUdV?=
 =?utf-8?B?V0NBZnBkeXllUmdBWkxQZHZKNXQxc1YrdTg0UXE5aHd3bjlaMnVLOWZCbytX?=
 =?utf-8?B?c3VwT2w1K2dvT251WXBiL2llVG5wWEhSRXNwTGt1NkhvSnR0eXkyM2cwY0Qy?=
 =?utf-8?B?YUkraUsxbHUvWUpaSk1mTGlFVjZ6aDBWTDA4Z3Y0MUhmUGpCNDN1bExoWEVm?=
 =?utf-8?B?NEUyVmoxV3FLRVB4OHJWbWU1MVlpMTJ5WHJFMkgrL25lNEFuOVZRc3lFQnRU?=
 =?utf-8?B?d0NWVDRGZHRwWEJWUWQ4NEN0eG5BQmZmdjJ4VU1nanQ4NUpSbDgzVk5Oc1RZ?=
 =?utf-8?B?SlVaNTRlTDRmbjB3WktPcU1RdmZMakJZMy9kZUQ0TzUyUUxMUEtCTWdnU3pn?=
 =?utf-8?B?RkNSTjNpc0x6aDQ4MXRkNGdYdDN1SDZQSWtYQ2hhWVVhWXNQMnRCcWl5V0Fn?=
 =?utf-8?B?Q0NxSFV4QURxaW5iOE5VdW9JLzFkOEViR05QNjNhNG9qUFAwa0htMWRZS2do?=
 =?utf-8?B?R1hvYUNKaWhyQWwwK3VpZURLR2N2YjRUZ1ROYU9rR3pITTJNY0wzSVpISnVM?=
 =?utf-8?B?SzJselRDMFZpZnJodU1Md2N4ajVJMG83QWo4alNqd0FmK3U4ZXJkc1NMdnpa?=
 =?utf-8?B?bnZEZ2ZUUjFpWmMrQTAxektRSFI2L1dpRDF6bitrT0FaYlRWWGJNd3pzbEps?=
 =?utf-8?B?QXRGNnluQnRiQmlQalkyTVNJOUk4T08xSDdaN1lkRU8xZU9HakpIcUZUcnI4?=
 =?utf-8?B?K3BoaEtxbVpFRnhURGhUQXlNa0xRSHBnbkp0L2ZrQkNIOTZGQmg2RCtjRFI2?=
 =?utf-8?B?bVhVTWgzWHlHRGNQZjVhbUYzRURCVUlrMUVKNnBpV2ltSW1nYnplbGNXYU1p?=
 =?utf-8?B?azE3SlhINHI3RUN3QVM5S3JrQVUxcmhQM2NmZEw0dUtXbzhEQTdiZGQ2UHkv?=
 =?utf-8?B?OERUN3ArY0FOLzhUYzZRZkJtS1hoOUtQUXZhUjIva09wcnZ1aTJjanJWREhC?=
 =?utf-8?B?TW1LU1dDR3U2aGFtdTRSYWRIZzZKYlYzSXpwOHRrWjhTNjdJSy9pdG1qUlhJ?=
 =?utf-8?B?UExjOUdUOHdXcCsreFlJYVplRFBvNkVPQlRDMXpOUzRxSWEyTGFWUFd4dldl?=
 =?utf-8?B?dU5hR0xhOHNTM2xIdDV5eFBFbmxpdjdhdGxVMytJeVhheXBRaFJGalZJV2ti?=
 =?utf-8?B?eVpwQWdDbFhIV0NTL0R3ZkZBVGZMdWhnZkZNZDlTcjV5Rk9jWmlVaFpCMHpQ?=
 =?utf-8?B?ZnJwd1MvSXVQUHVyNitMeTVSUFJzRXBGVGt5dDgySTNOeG5xek4vUk5NZWRv?=
 =?utf-8?B?L2NMUXBGZU1QZVhxbkJQUlRRTHVnb296YndEZDllYzE3YVoyTkszYUllcmVz?=
 =?utf-8?B?Ti9wTWZON0ZtclV2RjFKem5UQ3dVMFZEM3JTYnJveHVUUUliZ0lpdzhEZTlp?=
 =?utf-8?B?QkFYbGx0ODBhMHpkeDJrSlNFYm00R1Y2Q1NRYVVyMWtvcGJPQlpoNUFvMHpq?=
 =?utf-8?B?eDlLbWR6NlZsa2VKc3VmdGxqSVh4MHMwRzVLc3BBNjAzY1dZeDJReFFCQVFi?=
 =?utf-8?B?NkV4UEVtK2REQ280emlkNEVyNnlKU3hIL0Z1NFR6RFZlai8ycHk3eC9Dc2NI?=
 =?utf-8?B?MWI5WTFMd2tDYUZKU0g1SExCSU5WMEthSUF5TjZ2MldsK2RjLy93aERYNzdv?=
 =?utf-8?B?OXorZjFZQ0tleVoyUW53dml6ZFh2L2I2dWRxc2Y4WXorUTN4SmJwQT09?=
X-Exchange-RoutingPolicyChecked: hJeMo2kSJCGANKJEf5A3JbRjzsCk7DsPN+hsEs3FPL3jvggcFxrHBj9JU5AacoWCO7LO7GQyCqd7oSe/UpPW+JauZppP+2oe4tW2y8xkZ66+7ufI2KonLcGs5vlxmWjmE6OpKMH4Eoao77KSRjzrM+pMRAXsTW0V3RqwwmB0ByeLLABvgASxFoVSuN38C5A0RhPYVtVIzIqK+G9ZyhJLZKiY1NCzRhSwypZX/o9YGLRMkysSrVcUviMChX60agcbUgUelyIxy5YqvoakdO/HdTi4uohv6wbuMW644ROUW1UX1S6ytv9OYn4VFx4a3NtsI38O1m9WALWuwT0O2dDVVA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed0fce7-dc9a-4837-b38a-08deab4e5cd2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:03:39.1781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YAnfW7n3/4fW+z+zMDouSlAdwsIEl4YhXzQc17gFhvXoAOOzGx8cPKNP4jq+lpI3RFwJlCdSpWJqPirVVv9/mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4663
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

--------------quK2SLbEZAwFM5MakoIPHp60
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

these failures are not related to my changes. Could you please re-report.

Thanks,

Anirban

On 10-04-2026 10:54 am, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/perf_pmu: Ignore SLPC efficient freq during test
> *URL:* 	https://patchwork.freedesktop.org/series/164611/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14955/index.html
>
>
>   CI Bug Log - changes from XEIGT_8852_FULL -> XEIGTPW_14955_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_14955_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_14955_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_14955_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8852/shard-bmg-2/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14955/shard-bmg-6/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html>
>
>
>     Known issues
>
--------------quK2SLbEZAwFM5MakoIPHp60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>these failures are not related to my changes. Could you please
      re-report.<br>
      <br>
      Thanks,</p>
    <p>Anirban</p>
    <div class="moz-cite-prefix">On 10-04-2026 10:54 am, Patchwork
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:177579865683.449057.16543680608728951586@a3b018990fe9">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel/perf_pmu: Ignore SLPC efficient freq during
              test</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/164611/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/164611/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14955/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14955/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8852_FULL -&gt;
        XEIGTPW_14955_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_14955_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_14955_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_14955_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8852/shard-bmg-2/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14955/shard-bmg-6/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html" moz-do-not-send="true">DMESG-WARN</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
    </blockquote>
  </body>
</html>

--------------quK2SLbEZAwFM5MakoIPHp60--
