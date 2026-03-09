Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E003EFCD77
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 10:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5A710E4C5;
	Mon,  9 Mar 2026 10:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bw7+c5lo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB98A10E4C5
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 10:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773050489; x=1804586489;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C6z5vsRQpZbHu5rydFaWsrTpG7g+27BEJl1aIIMSYQI=;
 b=Bw7+c5lofh44zEdQBHJjXfySnjK4LzFPv+mG7ywM9mV5CDKnLegc6+bK
 OS0JB+9/aL4iII96TPNY9ENIOUWsj6rG64mN56iG2k4ApcibNe+RzV+sU
 gBrpgU8OJSMAyMZeIExw7ZG1MyfEZ+5mfkEY4xcwKVG5l6RyM/euQpbYn
 o9IRMv1aHrNlIUZNxAh0oLFwYOFF6Z6RY3K6zIDmc7cXP0NZS0oMcFoGI
 Y9zJGzPQNJjYe4Gy2dDLZ3t479CdOH3RvtmQmjM2ezDyBMwUnlj8nCdLP
 d7nIYeabDEuAt1GFIyMjlYr7JPl1PzXI3Q4/enM4ET/bDqQdt5kOLM12m A==;
X-CSE-ConnectionGUID: IrvJMVioQyyMIEVLOeUbsQ==
X-CSE-MsgGUID: rL+YgYBFR0OUZglZHFyq3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73263975"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="73263975"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 03:01:28 -0700
X-CSE-ConnectionGUID: gz2xbXeeRJmUxOFpzwOt6g==
X-CSE-MsgGUID: vytrWDrER9q7Fgg/9PYyyg==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 03:01:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 03:01:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 03:01:27 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 03:01:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCAs0KacCXJxZHlwVJBDwE0yho6nSY8HI2UV6N6VPOFcvvWm27yjwZAI3pKch+dlCy7W3nslORloiRD66PIjRFW6Ra09dIJG6A0GU6iv+1F5+Ff8uuRuLApJ36SAQHNQESnyKM1R7cdvc0QkwObZ+OAqogoq+PhhSZhWWne5KVyi6M3bSgqNFqyTdZ4ttYBAwgNtX+Af9GEZAjBSmPMXLlt4NODGC7mayZAjQN8aGqjdW5BamZBcJ5I32UfuEKVmBIG2V69MHFwWoDHaB69bAzg3T4JXBaDL+prdj1Z+UexBtFtXXIxXLpV31zYG7FDQnoWIEvHMMTYx2akcta0N2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLUHshz/SKtMdr4FOWOUycuFdDor5V7YlC0W81qe2hU=;
 b=kHYibIR1u1MhTi0jWYAENX0uJaksIS06C/tLnHkDVQZhIjVYcbkYqC1WDXnosks6R+1FMRYdDBpI4cu9MeOuJ+qLnJSiDDX5ISY8KerhR5nPLst0HDcV6Ere9HikY6rJSWVRAk8iKrXrO5SCQp0vrNpHKaPfmLGYyWXLOW8Ay0qgAU/YEAdO3ealjO73Juh35h3nnq8GI1IrEVaITS7N2nDXmHiFCUPjLfXK5jhr4NxIsnu5wJGy0lxJAaBx8bhMMTAmqM/wIZGNtDgMnH8R5Aq5Dfqg8TP8PI8rKT4iO8qNjDF/BkuaYyecHVwWpiDJddHs00yeOVgJQ57uZQgtuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by CH0PR11MB5219.namprd11.prod.outlook.com (2603:10b6:610:e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 10:01:25 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 10:01:25 +0000
From: "Sharma, Nishit" <nishit.sharma@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Enhance SVM
 compute test
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Enhance SVM
 compute test
Thread-Index: AQHcr34BudnAKywBU0aH9uAry30h6LWl9rsAgAAAZmA=
Date: Mon, 9 Mar 2026 10:01:25 +0000
Message-ID: <MW4PR11MB7151CD8C94745B49C62A8F3DE479A@MW4PR11MB7151.namprd11.prod.outlook.com>
References: <20260309043400.2280535-1-nishit.sharma@intel.com>
 <aa6ZELD9LR7TmcAS@fdugast-desk>
In-Reply-To: <aa6ZELD9LR7TmcAS@fdugast-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7151:EE_|CH0PR11MB5219:EE_
x-ms-office365-filtering-correlation-id: 6791a1af-1b4d-4039-ab20-08de7dc2d345
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: ZJzgyO+7qfRkYFctZjtQ8JyZk26DMNuW40RNyWhsGyzZmAjznB//dJMe0XFWQOfm4s6qfnt2rqeUW4aTSd8HC7+ngblrrj6IG0Oba31+y2zjTezUXBOJl28YYXPxt4pE2dZ8OoyiF1yVRNnZyLisqxwD3ddIzADvsKRwckri5nK/G3iyirj4JKqxYQ1A6/7NF/RFMOV7n5KtTCNfY/IsTTuxdHRaLNB3pjeXAJhvitDOj7ryIlADl/LLuBjF3tIPBDvfeN+IwcBvlHcPD6FUppbEjH5FnpatBRsPIvi2LzUZcgWusU/EMeIRYXNG+GvJ3XjW0ljSktiIdjukArJtSc6B/DuIWFS3cDOblKf4Usi5ZxTRbAydkcuZiudVZRL8Msn9vbNmZ6rC5sYtKCK7Bd7SeKT1IaHTyNlEnnjcPWHbSEYUVfUKjBjrn9jgUWt1uOzu4UBh2PsW2Qrrcenq0atUnH79kxMPxQ5Vwe+/lD5HTfKN0bdKWLlFPQyoMbdj2simZi/XiD3GCxdc7EEjh9S41ZX14eWVVyM8fh2AQzXCloEG+OCExhrmTWCAq0QlNWk9Bo9nVkYc9wxYKyPZEWMKpAgjk/HUxhDGSqU6FuJ8eJZzl3B8dau+xrH9CbCHUN5iFYKWkFh2HhBiV+7y+b/7/MF+kBBbfkq65v4gECrPepQwFtSp1iqzGllNpqz6h5HYHTYlzOXk3It8U+aqPw25NKzMd1xorWqjp8dEFB+r/B2tHTOVZbqVSkoqY2Bo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GMSnmxo5cEnRdEw+Vd/vQwduhLJDxVZ/3iSyKj1EuHNVuhcxkPtqNx1k96GM?=
 =?us-ascii?Q?NXd8j1UO9CvZhuYLfBfWdZAuHmULQ9/GQURiPZN7/DeOcPPgPU7YswbL6c27?=
 =?us-ascii?Q?ITnK3dwkppLtUdhVJmIFmYqasRoRz4Fv/KC9ldbr1x1P6QtLqYCC54N8A+Tt?=
 =?us-ascii?Q?80XDV0jPSIs6ow9gQiwBIr460//umAnpAKttz9FnFSTuOO9t1kgEeiCiZjGe?=
 =?us-ascii?Q?PmFrfxix7Aaqg+zpA0JQKviFABfni/xPcXMEF19Ov43bcdGfagdjpHyndIdr?=
 =?us-ascii?Q?P0C7nV/dMOPRlBSVVVTWJfr5XRzlCz44rxLu6WJFPXluGa+g/gSWhX3Lf3Jc?=
 =?us-ascii?Q?jkdtOFEVt8hf5TsfK5ZaK29eCno9h9xobCK/Oto3K+ka5tNZyrLgcwd2NsX4?=
 =?us-ascii?Q?ievonA8dXCpxMM8lk+5jtqNzgJ4LKiv9yl3VvsJw1/ke318wMG+UCQRSVB1M?=
 =?us-ascii?Q?BAt4fYjYBRvI5RIhM/U1/uubIYHMh0BbuB85Q3howRBx9sNRwVTCUSu7kbeM?=
 =?us-ascii?Q?7B0o/emE0ifM5OthIB6qoUVpBsqZ9HdXWxpqWFZ6ExaTvrZYqmVZ5EZlfGkM?=
 =?us-ascii?Q?MV/Ftda4LjilD6GkFeHGyxVFWLXH3U6QBqwNWjRf/yWpuPxyrLZF0MLuYJIZ?=
 =?us-ascii?Q?6xJ1MlMUo9XfLOZ/evqdBMx0MSi2P8BjH6xM7mt4cgjnPrSjG85iQH4O07Gt?=
 =?us-ascii?Q?V7gyxjkc7K9w34dgHaEIREig77uGJOkJDLoJFvWGuQuO5VAZrd0rjYIRTVp4?=
 =?us-ascii?Q?oGNzjPMPvyicSQrrrz5Waz8+koU46DqHsgKcb4KiDWottsiEcGni6YXhmB56?=
 =?us-ascii?Q?gSbks8a1+tCoPmUf9sKmPUD0051dwyIMzZiNEDCEUyH6t6PeKupArvg2DUFZ?=
 =?us-ascii?Q?ainlgMvY+PH0BfDVLgs5eXM4rlr+42la096/tIYxyVXlknEEsHisVHOC3r9Y?=
 =?us-ascii?Q?rXnyoQkd3eYkK348CuDTcs6e51Uhd+4JkaOteDkqMmbfZflczS35Jf4uHvbg?=
 =?us-ascii?Q?kwDA83ShXuD7aFgOIhU7D1gIp3+M9CA8Gdtbp4eWpJWhlUbjNVFmgMnls+yv?=
 =?us-ascii?Q?ci+KfbeAvTIKnqrEEQSxicfU8rA4pLScANwDiHqBKZ9UK3W++VbFmfmYoIR3?=
 =?us-ascii?Q?ywIt5462U4XWYhw6OPZLyAdgg9IvouKGJiB6zk8JzYkRCOExUKMSfPK7e/JJ?=
 =?us-ascii?Q?4tabTbx6JBPeTW09C8X4Ba3Ip+RIhPk3SkMk57ZueD3U861/qOHVAFZbuqDO?=
 =?us-ascii?Q?gugFhZC2fMjJZ1gk45OfQlAVhTOL/rdlIlUs9wDuhWNLut39rhfetBnBuLKM?=
 =?us-ascii?Q?li9HB78prPXeSCRh30fNgHxe8ep7VWrmxLGYbIRGHnbMlWN74BuWCGj+MI0+?=
 =?us-ascii?Q?ZLRqHey49mucsS6okkLBWIGtsH7DD6acNC0phP7CqKg/b1+L7yv/GQtqvek5?=
 =?us-ascii?Q?HpU078/ONoKAlnEkl+fTls5q34HSlvNF6uS318z9+4i3DDipeP6OSYaCcGOO?=
 =?us-ascii?Q?xZg92xgGutuwCmcfYZfQyWpbKTa2JRfEhMo5/pVt9zA6SdtSGnvsL7A/GUqb?=
 =?us-ascii?Q?0dknK0BZAN+4XnN8QW9KHBeysHQwsZ1ytsHniQTMTKEjpYJl3sMpHPZAhRFw?=
 =?us-ascii?Q?vpcX69tIirs/GcYo5OpfeSTetUy5e9GTULJYq4hX97WwceR99Vtc9LPQ6icQ?=
 =?us-ascii?Q?cOq03iUPFmBxunOvf3ZLy8Y6V0WollFBxc/3FN99zi48INqNW1G7+XtnQw4W?=
 =?us-ascii?Q?nLdC862KHA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ovsFRHjEOomvS1mrXmsMpaKOBIArqVdcg/en2HbnctgjqphCicC7ZBqxxPqX+opoXUO412K+x2DcKHWm29rkagtHu6RpncrxrTHnl+4jygKNwZAVjT8uOmks/7ywmv6Z1udK/7mmY1ZeKj0yFDBfKV5k3pmbLQKw9tWcosTTT7K7U8kzQF7EWb9rXXU975hPi7cYXN7/RvTih83sOlg8wvLPt9GV2koZSKv3GJ11B8mOJPYV3/2FpRQSxAtp+X1GCw6eYk21+Ean+ik/tuNLy58jDGVSI9gamwjbpw8nOP0GBtzkmrkcQBVJ/mLgokyM2Wmm01LN2dcDN095hqRb0g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6791a1af-1b4d-4039-ab20-08de7dc2d345
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 10:01:25.4259 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /nm3gRd4R3BHkY1YEr7Ykl7FZRG95u2MrxBikUtYYW6qeVBYEkpPV6Tez3L2eUQRrueAI/R9FvG7MrI27qlf9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5219
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

Hi,

This test is giving assertion in one of the platforms and the reason it lac=
ked output buffer support in lib/intel_compute.c
Without SVM buffer support in lib/intel_compute test executes just on GPU B=
uffer objects not on SVM buffers.
If output buffer is not used in tests/intel/xe_exec_system_allocator/comput=
e then SVM buffer requirement is not fulfilled.

Regards
Nishit

-----Original Message-----
From: Dugast, Francois <francois.dugast@intel.com>=20
Sent: Monday, March 9, 2026 3:25 PM
To: Sharma, Nishit <nishit.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org; Kempczynski, Zbigniew <zbigniew.kempczyn=
ski@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Enhance SV=
M compute test

Hi,

On Mon, Mar 09, 2026 at 04:34:00AM +0000, nishit.sharma@intel.com wrote:
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> Updated test to validate output values against expected results after=20
> workload execution. These enhancements improve test coverage,=20
> reliability, and debugging for SVM compute workloads. Updated test to=20
> validate output values against expected results after kernel execution.

Using a malloc'ed array for output and validating output in this test both =
revert what was done in this commit, for good reasons:
373a6dbfb tests/intel/xe_exec_system_allocator: Cleanup compute test

This is because the test is used to finely trigger page fault floods from c=
ompute kernel context (EUs) and we want to avoid interference with 1. extra=
 GPU page faults and 2. CPU page faults, so that we can measure the exact i=
mpact of KMD optimizations on page fault servicing latency. Please see:
https://patchwork.freedesktop.org/series/160784/#rev2

This change would bring us back to the known previous state, which prevente=
d those measurements. Can you elaborate on why we need to revert?

Thanks,
Francois

>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_exec_system_allocator.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/intel/xe_exec_system_allocator.c=20
> b/tests/intel/xe_exec_system_allocator.c
> index 14f5e358f..e670ee007 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2257,7 +2257,7 @@ test_compute(int fd, size_t size, unsigned int flag=
s)
>  		 */
>  		.array_size =3D size / sizeof(float),
>  	};
> -	float *compute_input;
> +	float *compute_input, *compute_output;
>  	int i;
> =20
>  	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |=20
> DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0); @@ -2267,19 +2267,31 @@ test_comput=
e(int fd, size_t size, unsigned int flags)
>  	xe_wait_ufence(fd, &bo_sync->sync, USER_FENCE_VALUE, 0, FIVE_SEC);
> =20
>  	compute_input =3D aligned_alloc(SZ_2M, size);
> -	igt_assert(compute_input);
> +	compute_output =3D aligned_alloc(SZ_2M, size);
> +	igt_assert(compute_input && compute_output);
> =20
> -	env.loop_count =3D (flags & TOUCH_ONCE) ? 1 : env.array_size;
> +	env.loop_count =3D (flags & TOUCH_ONCE) ? 1 : env.array_size / 2;
>  	env.skip_results_check =3D !(flags & ACCESS_DEVICE_HOST);
>  	env.input_addr =3D to_user_pointer(compute_input);
> +	env.output_addr =3D to_user_pointer(compute_output);
>  	env.vm =3D vm;
> =20
>  	for (i =3D 0; i < env.loop_count; i++)
> -		compute_input[i] =3D rand() / (float)RAND_MAX;
> +		compute_input[i] =3D (float)i + 2.0f;
> =20
>  	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
> =20
> +	for (i =3D 0; i < env.loop_count; i++) {
> +		float expected_output =3D compute_input[i] * compute_input[i];
> +
> +		if (compute_output[i] !=3D expected_output || compute_output[i] =3D=3D=
 0.0f)
> +			igt_debug("[%4d] input:%f output:%f expected_output:%f\n",
> +				  i, compute_input[i], compute_output[i], expected_output);
> +		igt_assert_eq_double(compute_output[i], expected_output);
> +	}
> +
>  	free(compute_input);
> +	free(compute_output);
>  	unbind_system_allocator();
>  	xe_vm_destroy(fd, vm);
>  }
> --
> 2.43.0
>=20
