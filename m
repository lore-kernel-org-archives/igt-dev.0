Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BF8CC6B2A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Oct 2026 15:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCB710EC4E;
	Wed, 14 Oct 2026 15:10:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FBF10EC4E
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Oct 2026 15:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791990570; x=1823526570;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lXOzqfWk3r/Qcmagn6yEwBsM4d73QpEAurnjE7L/7Ac=;
 b=HzHmip1OQUA0y1kSbcNQtfETuf6REBDcChBJIaXpV4jZjpQVuoJW9Q8W
 ie185LEX7F5wcVoZQJq4BMim2NDzQK3Zw/n9Cu2V8wpK4E7GIkSK9Iwoa
 AzDDAObCC4xTIBMDkmbg4FFkXwKqS5gpMPVJffDwbunNUXlqDlMDZAgKL
 mPHzIEa9+MVfP9+G8BeMAPFdExfdzsDunFT0I1KS9ejnu6NNBP8Via6/y
 sm2JnAI1E+LBRhEa4GNArROWhaeoI8F38dq+wFhBaVKrz92xbpHpzStaR
 OcKFMNn/8RSVBaMA3WweXuNM9vpnyGrcgWkL+C+qXv3Jkuw4lGtNvm4iw A==;
X-CSE-ConnectionGUID: XRvOIzoCTwak0xGtMDozSw==
X-CSE-MsgGUID: +xds2xA8SburC3IRChqu/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="756684"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="756684"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 08:09:29 -0700
X-CSE-ConnectionGUID: blbdSZqpQ9GtGI1sclDDcA==
X-CSE-MsgGUID: G6/GMqR+SJGWoIdE70OhZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1895859"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2026 08:09:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 08:09:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 08:09:28 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.24)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 08:09:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZji3YczOW80QFUeQbbITE5dDt2/PJfGvOJ2RHN15G/z1axkfaZIPDHHJisqo9WpsRphLpsIRxjCUyUJpdmG82p+fUPyClc6ZX+H7H7kVDArXHgFyMOh9LtfPbZ03YUC9DyGh6cXT+I35mFvaSG7lERzGY7AhyoxyGb1qHWmm5kT7WlPIpvTwYwf0rv9M+zcEuuHMePZRImcQtARde2qxru19go0t/hG4BULTabiFOxuVPsnITDob6/6RvP8BU5J2UXnWE9cLJoLMqkkqc2QJRvh6rHyaDoyGffgU94FWbR5rKBWSPS27oA1sOBiBmgM2sCVjk4BYS55UegZdwOUzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUtDHlO9upXYlwzNOxuS89udIR/dl4Qb+kRZAqxYniw=;
 b=Abts0OFotAWDQedToa73fq44EyI76vrhFiw6p18Xk7dJfdMryU3wSFpSWfPhD006ETvuJ0JovN2PZS5TO/XQz3zppdw04rTJ9x0eWcxB9I6+sr/1HFxqr+NcI1ST5q1xY6Ev2E6pbGES2QFycHsLXLBhG4ysVx7Rh/wi32syQQuGIe/TD7ZiebwPuClckMSeUrRbPaGnRVXLOx5/Zr66evLmQGtL706KeIfPDx7hwc0+ZVDSC2WgNoqXTt5mTcM1zy803ZhrA6OGlLgNc4vt2vWXnKPDaktefwtLgvvEQZk+CqSU+VaskN1SlaQ0wfFiILB221Jf+hFoLIIOCmRNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6)
 by PH8PR11MB6657.namprd11.prod.outlook.com (2603:10b6:510:1c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 15:09:20 +0000
Received: from CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490]) by CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490%5]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 15:09:19 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Maslak, Jan" <jan.maslak@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Dong, Zhanjun" <zhanjun.dong@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Maslak, Jan"
 <jan.maslak@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/1] tests/intel/xe_exec_capture: Add coredump decode
 validation subtests
Thread-Topic: [PATCH 1/1] tests/intel/xe_exec_capture: Add coredump decode
 validation subtests
Thread-Index: AQHdLaqViCNDRyAc9k2I5rtf0CtEJ7b9doUA
Date: Wed, 14 Oct 2026 15:09:18 +0000
Message-ID: <CH0PR11MB53955FFEBDF6F99506698165E59D2@CH0PR11MB5395.namprd11.prod.outlook.com>
References: <20260816180906.884247-1-jan.maslak@intel.com>
 <20260816180906.884247-2-jan.maslak@intel.com>
In-Reply-To: <20260816180906.884247-2-jan.maslak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5395:EE_|PH8PR11MB6657:EE_
x-ms-office365-filtering-correlation-id: d49b35d5-c6f5-4cc3-bd9b-08df2a051ed9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|10070799003|366016|6133799003|18002099003|22082099003|10067099003|3023799007|38070700021|11063799006|4143699003|261009223027099003|56012099006;
x-microsoft-antispam-message-info: hyytPG3ln8RM6Z6KcuDDpjbovlKIIqqorijYnoa08jc5UrprFchBoAZ60JY5REIKOGaMSrxYfkzcDawVUQ1hieyI0csXlXevw6LTqxTztp3Kb2CUdM/zjL0oaqKAt+TbAYM4XDaYTKx3sRbFKwkA1+Ey3H71J6nti8VLvpL+lsi6/cpTX8RKqsTDLaQkl59sS9a7zMK++3wuiztaGTb1GLTa4C/QWm9p3SxIELv3JltQc4bLi0se/oOHbeLv523C5/6LUy9eFq41D3ye4nS9Jw0JUMuMinVL61XfFb/uUrtsxuTNoZf2pjO/eVsP0R8al5vN/flabvgGW45cHcuNUvb099NnDRaDBJI501GJtJslrnyVKPEYZKr/JsXsizhPKdiAoUHydoPdTIBR3lUP7G0FXtx/TYdzEVhRPnA/87L4H7Wh0qs+d2uJ9/oqn7fo526+2bh5vP2SB7a3tgwUF1V1xWm08zbZlQQ2AQMvJA4ODnEMNQ4/wYl6/sKR5hoSD6HWcKW+rks1pHriZ3auA6Wg7/IGLuXr6Lo3sPMCTzU1SEInm0/Z6reRqiIcp/L/XI817UuHLHI1tSD55hhBbOi429alMSb6qBbcpPL7CRPc5p2QZJ0jKIt+kXX14PCYMa0MM3ntEdtCal7tDOGp+D3bzTzLIu0LgD3BDTpfK4v2E1USMg+ABhYpV1rZn5wYhNLt7tRdCg+uXApkA7M/BVfxWq575FmzUnDqwzxSTxM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5395.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(10070799003)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(3023799007)(38070700021)(11063799006)(4143699003)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cbflB1mdJAk2xgbQV4SU2e5uEyzkQdusIr9tVeBuSq8LQA7PtYQQHs7Qe+on?=
 =?us-ascii?Q?1LkB3HSleHYM+XGCENbfMgooHL6l/N6bnhXQjpow2Usy2feDgoqqjUEH4Ygq?=
 =?us-ascii?Q?T4F4tmc/15GrQp1bLSC0Z9bRrkR4ezYI1KKveDFGoi82rhcs85X65knguZiq?=
 =?us-ascii?Q?qmpSKMDy0PjfY4+P+xHOyDfCiBfz7KqZ9CfAPDRjYpXHhCtqJVzSA2qNUszg?=
 =?us-ascii?Q?cK3mNKyFFj8lFxBK0ty1CJua2qWsz1FZOTIrcWOu26c20/wG/W/GWM+ZMqKf?=
 =?us-ascii?Q?kYfK025kOc1MLEvzpunWPHRYydEA6E7bqAICFEK94jBAcpms2f8s71V/TjJJ?=
 =?us-ascii?Q?iIoUvf+8wrOpDKxbTFJfx5jaGCXLMUM8c6hsYHJBn5cFrQXg9+3b5RVpXxQx?=
 =?us-ascii?Q?GmGcYDGREv65iTDGwAuDYZR35miDdLfCrR7946Lc6Kr+p8YBtKrKq+U98jta?=
 =?us-ascii?Q?Vf5NhyjOrdKbMZmyjDF728+44947YsNtuTCGSethN8347yRagaJJYkz1xnAC?=
 =?us-ascii?Q?E2jb7ecgIrf/7A8676ptJJb04/Lp8MW4ZYN7Ill2V4w45OU0f9WWvhcvNCyX?=
 =?us-ascii?Q?nMvXk/PmZ77LEHE288GhyQXBI7GQp9m++lfaBUpLkS7+oacqCpOSPxwjCkdu?=
 =?us-ascii?Q?3sSkUkdwfY0MGy91q5MfSsn2E0tQPC66RvzupYXdvBVxIdp/0GkC+C6tYr4Y?=
 =?us-ascii?Q?uj+N1VkkDeWCMrNV37uPIiTO3bLin2wkC7P2kP6jM+eN13jDVk1LGuQEmrCL?=
 =?us-ascii?Q?WiXFQqWUQDxCS8A8bB1+p2ulRk2nV+tOs6bLSdAhPdHNjymBxk38affVu6bm?=
 =?us-ascii?Q?FcwDEN7sUk5Q7EAEwxW+nHZWXlOEvRWwKrCtf8h7OOWWlSJp2LWBoBiHj7GT?=
 =?us-ascii?Q?xnu58rhodZxzhyVVA2jVcIGbxr8uIY5LK4RzkR9vWVDi2bz/FPJbzxnaB2rd?=
 =?us-ascii?Q?wGUOM9T4Wjo2a24ayzIaOGAiT46y6nuIXupaGH5tDUjt9Iwo9iRe024ZY6H5?=
 =?us-ascii?Q?h650d9G+d2K71p3ZXMuYpyCKm3+cLRRYGNbLsx/Ro7Le+8O0wLFlVtLQvd9X?=
 =?us-ascii?Q?8KWHRskQUA3gvZbl7L6aFJgepA8Lw27wePgYlV7euwrX8BYTnc2oNINwUENN?=
 =?us-ascii?Q?KmYLeJQoIQYEYhqn2PqD7aWjXFcsvuSy6me49WhFXEDGxkLGfDCgYpMordmd?=
 =?us-ascii?Q?J/ejXjq7HmDOKaucs52Ln2r17Yqk9gQURzVYgpr2cX+dKTasGuPvo4TW8c+E?=
 =?us-ascii?Q?kq4J90wWn6lL4REikkjUTfRjEt3qBoqP9DKn/lSwYXgISkoz7eObjZDGxGrK?=
 =?us-ascii?Q?kdBmGULU8I9GZBf25ZwUBAMJpe0WEXnEyN0YxxKZYDuNd7iEDDG6j1mPR8HA?=
 =?us-ascii?Q?BL1Hn8hQTzjv0faFYaf8fISg3YXP0fO/b1CpRz/sFF33c4WMkQGHW8rYKXyo?=
 =?us-ascii?Q?MCwjraNUD/hkotcpo+hULwWvw+fYfbBI2FhrjwIMdNOlgAuq3dLgXrgMfsj5?=
 =?us-ascii?Q?chyolROrD8YFbMEbRafdSsND3+zHA/6iD5bhUsdWrfI75lfafJhW/qwJeTAG?=
 =?us-ascii?Q?7GFcCldugpIfblBahHAlB+At2iKKaacdGI7Wwt9Q/KNpdupdAWpPpGWqrPOE?=
 =?us-ascii?Q?iC+UXdMUoE57SgdcJT5kZmZbYuHvN+vrcgQB9pK0q1MySbIK1P3eGLoOocoh?=
 =?us-ascii?Q?c962cg71CSBycINNQNnc56+ojIMPt5A2ANxON97DjSefGwMUnakv9zTzDJaD?=
 =?us-ascii?Q?ayZUtciX5eX+hlyVLIWMiEy/+8APjWzIxBCZAshgscVcVioVVeLwo4MQpxyX?=
x-ms-exchange-antispam-messagedata-1: TnOf3S/TN6iiJw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qQ7ddkcU5ifIhLMgiD7Q5UAlYjOFSlRlIJEEoRr0aV0h8nABWAdEi3cywhP0Fejm6YtFzG3c+u0MoYx6wsyA+cxttC6k/UJItJkbM1Jy0KVcr7NIA9sp00KTez9v1lGZNItdN6/Ktmdkh02d6AkOifkb0Pgl8HY9oYBQBaqAsKXpIaqaB+kGOz7oYk9PKtXb0K8nigWT9JNOm2uN5iREd1FCPTSPMiTx1j+ECowCR2CcT7nLB/DP5pxWRdch0NtXZie23m3Q95ls8hy8846q2Li3/HZqgVUKnEtmOmpFl1VBONHlEIz7aoJdsuVqhB92mcmhRRpxJBUNyRX5OkYtcg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5395.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d49b35d5-c6f5-4cc3-bd9b-08df2a051ed9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 15:09:19.0391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1OndR5xiqykUAgO6CRYZNRrvaXzd5NPQVJ6YYYxt7OvT8uvs9VOArn7UUluWf0MmnLu/wAySR8cX1aimjlyuI5gbHNAels3dAdsZ8SsD/QU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6657
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jan Masl=
ak
Sent: Sunday, August 16, 2026 11:09 AM
To: igt-dev@lists.freedesktop.org
Cc: Brost, Matthew <matthew.brost@intel.com>; Maslak, Jan <jan.maslak@intel=
.com>
Subject: [PATCH 1/1] tests/intel/xe_exec_capture: Add coredump decode valid=
ation subtests
>=20
> Add decode-data and decode-data-large subtests that create dumpable VM
> buffers with deterministic contents, hang an engine, and validate the
> resulting devcoredump.
>=20
> Decode every ASCII85 blob and verify its decoded size matches the
> advertised length. For test-created VM blobs, also verify the decoded
> contents. The large variant crosses the kernel coredump chunking
> threshold and legacy rendering limit.
>=20
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>

I don't see anything wrong with this patch that warrants immediate attentio=
n.
I mean, could some of the ASCII decoding and payload/blob parsing code
be separated out into a separate lib file?  Sure.  But I don't think that's=
 strictly
necessary for this patch.
There's also the minor concern of what happens if the devcoredump file is e=
mpty,
but I'm going to work under the assumption that an empty devcoredump file i=
s
impossible (I.E. the file would just not open), and as such adding extra ha=
ndling
for that case is unnecessary.
And, of course, it's good that the new tests have already been validated lo=
cally.

Of course, I'm not exactly an expert on devcoredump protocol, so I'd recomm=
end
getting a second/third opinion on this before merging.  I'm tagging Zhanjun=
 to
handle that, but maybe Rodrigo could also help here.
I'll give this my RB if they don't have any revision notes.
-Jonathan Cavitt

> ---
>  tests/intel/xe_exec_capture.c | 549 +++++++++++++++++++++++++++++++++-
>  1 file changed, 548 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.=
c
> index 6e454cfff3..2d726cabf9 100644
> --- a/tests/intel/xe_exec_capture.c
> +++ b/tests/intel/xe_exec_capture.c
> @@ -17,10 +17,13 @@
>  #include <inttypes.h>
>  #include <regex.h>
>  #include <stdio.h>
> +#include <stdlib.h>
>  #include <string.h>
> +#include <sys/mman.h>
> =20
>  #include "igt.h"
>  #include "igt_device.h"
> +#include "igt_os.h"
>  #include "igt_sriov_device.h"
>  #include "igt_sysfs.h"
>  #include "lib/igt_syncobj.h"
> @@ -82,6 +85,43 @@
>  #define INDEX_VM_LENGTH			2
>  #define INDEX_VM_SIZE			3
> =20
> +/*
> + * Binary sections of the dump are encoded with the kernel's
> + * include/linux/ascii85.h: a zero dword becomes a single 'z', every oth=
er
> + * dword becomes 5 characters in the '!'..'u' range.
> + */
> +#define ASCII85_ZERO			'z'
> +#define ASCII85_MIN			'!'
> +#define ASCII85_MAX			'u'
> +#define ASCII85_GROUP_LEN		5
> +
> +#define LENGTH_SUFFIX			"].length:"
> +#define DATA_SUFFIX			"].data:"
> +#define ERROR_SUFFIX			"].error:"
> +#define MAX_BLOB_NAME_LEN		64
> +
> +#define CAPTURE_SPIN_ADDRESS		0x1a0000ull
> +#define CAPTURE_PAYLOAD_ADDRESS		0x100000000ull
> +
> +/* Largest dump size the kernel could render before it learned to chunk =
(VLK-71080) */
> +#define DEVCOREDUMP_LEGACY_MAX_SIZE	((uint64_t)INT_MAX)
> +
> +/*
> + * The test payloads contain no zero dwords, so their ASCII85 size is ex=
actly
> + * 5/4 of their binary size. The decoder still supports zero dwords.
> + */
> +#define ASCII85_ENCODED_SIZE(bytes)	((bytes) / 4 * 5)
> +
> +/* Small, but already far past any line-oriented parser */
> +#define DECODE_PAYLOAD_SIZE		SZ_2M
> +#define DECODE_PAYLOAD_COUNT		2
> +
> +#define LARGE_PAYLOAD_SIZE		SZ_64M
> +/* One extra buffer makes the encoded payload exceed the legacy cap */
> +#define LARGE_PAYLOAD_COUNT		\
> +	((int)(DEVCOREDUMP_LEGACY_MAX_SIZE / \
> +	       ASCII85_ENCODED_SIZE(LARGE_PAYLOAD_SIZE)) + 1)
> +
>  static u64
>  xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance =
*eci)
>  {
> @@ -224,6 +264,323 @@ static bool rm_devcoredump(char *path)
>  	return false;
>  }
> =20
> +static bool devcoredump_exists(char *path)
> +{
> +	return access_devcoredump(path, NULL, NULL) !=3D 0;
> +}
> +
> +/**
> + * struct payload_bo - A buffer object the test fills with known dword v=
alues
> + * @handle: GEM handle
> + * @addr: GPU virtual address the buffer is bound at, which is also the =
name the
> + *	  dump gives it, i.e. "[<addr>].data:"
> + * @size: buffer size in bytes
> + * @payload_index: zero-based payload index, used to generate this buffe=
r's
> + *		   dword values
> + * @seen: set once the dump has been found to carry this buffer intact
> + */
> +struct payload_bo {
> +	uint32_t handle;
> +	uint64_t addr;
> +	uint64_t size;
> +	uint32_t payload_index;
> +	bool seen;
> +};
> +
> +/* Keep each payload's dword values distinct and non-zero. */
> +#define PAYLOAD_INDEX_STRIDE		0x04000000u
> +
> +/**
> + * payload_dword - Return the expected dword at a payload offset
> + * @payload_index: zero-based payload index
> + * @dword_index: dword offset in the payload
> + *
> + * Returns: expected dword value
> + */
> +static uint32_t payload_dword(uint32_t payload_index, uint64_t dword_ind=
ex)
> +{
> +	return (payload_index + 1) * PAYLOAD_INDEX_STRIDE + (uint32_t)dword_ind=
ex;
> +}
> +
> +/**
> + * struct ascii85_decoder - Position within one encoded blob
> + * @pos: next character to consume
> + * @bad: set once a group is found that no encoder could have produced
> + * @truncated: set when the blob ends part way through a group
> + */
> +struct ascii85_decoder {
> +	const char *pos;
> +	bool bad;
> +	bool truncated;
> +};
> +
> +/**
> + * ascii85_next_dword - Decode the next dword of a blob
> + * @dec: decoder positioned at the start of a group
> + * @out: filled with the decoded value
> + *
> + * Returns: false at the end of the blob, on the first malformed group o=
r on a
> + * group cut short, the last two reported through @dec->bad and @dec->tr=
uncated.
> + */
> +static bool ascii85_next_dword(struct ascii85_decoder *dec, uint32_t *ou=
t)
> +{
> +	uint64_t acc =3D 0;
> +	int i;
> +
> +	if (!*dec->pos || *dec->pos =3D=3D '\n')
> +		return false;
> +
> +	/* A zero dword is abbreviated to one character */
> +	if (*dec->pos =3D=3D ASCII85_ZERO) {
> +		dec->pos++;
> +		*out =3D 0;
> +		return true;
> +	}
> +
> +	/* Otherwise five base-85 digits, most significant first */
> +	for (i =3D 0; i < ASCII85_GROUP_LEN; i++) {
> +		if (!dec->pos[i] || dec->pos[i] =3D=3D '\n') {
> +			dec->truncated =3D true;
> +			return false;
> +		}
> +		if (dec->pos[i] < ASCII85_MIN || dec->pos[i] > ASCII85_MAX) {
> +			dec->bad =3D true;
> +			return false;
> +		}
> +		acc =3D acc * 85 + (dec->pos[i] - ASCII85_MIN);
> +	}
> +
> +	/* 85^5 exceeds 2^32, so not every group is encodable */
> +	if (acc > UINT32_MAX) {
> +		dec->bad =3D true;
> +		return false;
> +	}
> +
> +	dec->pos +=3D ASCII85_GROUP_LEN;
> +	*out =3D acc;
> +
> +	return true;
> +}
> +
> +/**
> + * parse_blob_field - Split a "[<name>]<suffix> <value>" devcoredump lin=
e
> + * @line: line to match, e.g. "[4e4800000].length: 0x4000000"
> + * @suffix: LENGTH_SUFFIX, DATA_SUFFIX or ERROR_SUFFIX, matched literall=
y so that
> + *	    "].replay_length:" does not look like "].length:"
> + * @name: filled with the bracketed name on success
> + * @name_size: size of @name
> + * @value: set to the first character of the value on success
> + *
> + * Returns: true when @line carries @suffix, false otherwise.
> + */
> +static bool
> +parse_blob_field(const char *line, const char *suffix, char *name, size_=
t name_size,
> +		 const char **value)
> +{
> +	const char *open =3D strchr(line, '[');
> +	const char *close;
> +	size_t len;
> +
> +	if (!open)
> +		return false;
> +
> +	open++;
> +	close =3D strchr(open, ']');
> +	if (!close || strncmp(close, suffix, strlen(suffix)))
> +		return false;
> +
> +	len =3D close - open;
> +	if (len >=3D name_size)
> +		return false;
> +
> +	memcpy(name, open, len);
> +	name[len] =3D '\0';
> +
> +	*value =3D close + strlen(suffix);
> +	while (**value =3D=3D ' ' || **value =3D=3D '\t')
> +		(*value)++;
> +
> +	return true;
> +}
> +
> +/**
> + * payload_by_name - Find the payload a blob name refers to
> + * @name: bracketed blob name, e.g. "4e4800000" or "HWSP"
> + * @payloads: buffers the test bound before hanging, or NULL
> + * @n_payloads: number of entries in @payloads
> + *
> + * Returns: the matching payload, or NULL when @name is not one of them.=
 The
> + * dump also uses labels such as "HWSP" and "CTB" for driver-owned secti=
ons;
> + * names that are not entirely hexadecimal never match, which keeps "CTB=
" from
> + * resolving as the address 0xc.
> + */
> +static struct payload_bo *
> +payload_by_name(const char *name, struct payload_bo *payloads, int n_pay=
loads)
> +{
> +	uint64_t addr;
> +	char *end;
> +	int i;
> +
> +	if (!payloads)
> +		return NULL;
> +
> +	addr =3D strtoull(name, &end, 16);
> +	if (end =3D=3D name || *end)
> +		return NULL;
> +
> +	for (i =3D 0; i < n_payloads; i++)
> +		if (payloads[i].addr =3D=3D addr)
> +			return &payloads[i];
> +
> +	return NULL;
> +}
> +
> +/**
> + * check_blob - Validate one ".length"/".data" pair of a devcoredump
> + * @name: bracketed blob name, a hex VMA address for VM state sections
> + * @length: byte count advertised by the ".length" line
> + * @data: encoded payload of the ".data" line
> + * @payloads: buffers the test bound before hanging, or NULL
> + * @n_payloads: number of entries in @payloads
> + *
> + * Asserts that the blob is valid ASCII85 and decodes to exactly @length=
 bytes.
> + * Test-created payloads are also checked against their expected content=
s.
> + */
> +static void
> +check_blob(const char *name, uint64_t length, const char *data,
> +	   struct payload_bo *payloads, int n_payloads)
> +{
> +	struct ascii85_decoder dec =3D { .pos =3D data };
> +	struct payload_bo *expected_payload;
> +	uint64_t expected_dwords =3D 0;
> +	uint64_t dwords =3D 0;
> +	uint32_t val;
> +
> +	expected_payload =3D payload_by_name(name, payloads, n_payloads);
> +	if (expected_payload) {
> +		igt_assert_f(length =3D=3D expected_payload->size,
> +			     "[%s]: .length reports 0x%" PRIx64
> +			     " bytes, bound VMA is 0x%" PRIx64 " bytes\n",
> +			     name, length, expected_payload->size);
> +		expected_dwords =3D expected_payload->size / sizeof(uint32_t);
> +	}
> +
> +	/*
> +	 * Decode every blob for structural validation. Only test-created paylo=
ads
> +	 * need the additional content comparison.
> +	 */
> +	while (ascii85_next_dword(&dec, &val)) {
> +		if (expected_payload) {
> +			igt_assert_f(dwords < expected_dwords,
> +				     "[%s]: .data contains more dwords than the bound payload\n",
> +				     name);
> +			igt_assert_f(val =3D=3D payload_dword(expected_payload->payload_index=
,
> +							  dwords),
> +				     "[%s]: decoded dword %" PRIu64
> +				     " differs from the content written to the buffer\n",
> +				     name, dwords);
> +		}
> +		dwords++;
> +	}
> +
> +	igt_assert_f(!dec.truncated,
> +		     "[%s]: .data ends mid-ASCII85 group after %" PRIu64 " of %" PRIu6=
4
> +		     " dwords, the dump was cut short\n",
> +		     name, dwords, length / sizeof(uint32_t));
> +
> +	igt_assert_f(!dec.bad,
> +		     "[%s]: .data is not valid ASCII85 at dword %" PRIu64
> +		     " of %" PRIu64 " announced by .length\n",
> +		     name, dwords, length / sizeof(uint32_t));
> +
> +	igt_assert_f(dwords * sizeof(uint32_t) =3D=3D length,
> +		     "[%s]: .length reports 0x%" PRIx64 " bytes but .data decodes to"
> +		     " 0x%" PRIx64 " bytes\n",
> +		     name, length, dwords * sizeof(uint32_t));
> +
> +	if (!expected_payload)
> +		return;
> +
> +	expected_payload->seen =3D true;
> +	igt_debug("Cross-validated 0x%" PRIx64 " bytes of VMA [%s]\n", length, =
name);
> +}
> +
> +/**
> + * validate_devcoredump - Check every ASCII85 blob of a devcoredump
> + * @path: path of the devcoredump data file
> + * @payloads: buffers the test bound before hanging, or NULL
> + * @n_payloads: number of entries in @payloads
> + *
> + * Walks the whole dump, checks each blob's decoded size, and verifies t=
hat all
> + * test-created payloads are present with the expected contents.
> + */
> +static void
> +validate_devcoredump(const char *path, struct payload_bo *payloads, int =
n_payloads)
> +{
> +	char pending_name[MAX_BLOB_NAME_LEN] =3D {0};
> +	char name[MAX_BLOB_NAME_LEN];
> +	uint64_t pending_length =3D 0;
> +	bool have_pending =3D false;
> +	bool read_error;
> +	size_t line_size =3D 0;
> +	char *line =3D NULL;
> +	const char *value;
> +	int n_blobs =3D 0, read_errno, i;
> +	FILE *f;
> +
> +	f =3D fopen(path, "r");
> +	igt_assert_f(f, "Failed to open %s, errno=3D%d\n", path, errno);
> +
> +	/* .data lines can be megabytes long, so let getline() grow the buffer.=
 */
> +	while (getline(&line, &line_size, f) > 0) {
> +		if (parse_blob_field(line, LENGTH_SUFFIX, name, sizeof(name), &value))=
 {
> +			pending_length =3D strtoull(value, NULL, 0);
> +			memcpy(pending_name, name, strlen(name) + 1);
> +			have_pending =3D true;
> +			continue;
> +		}
> +
> +		if (parse_blob_field(line, ERROR_SUFFIX, name, sizeof(name), &value)) =
{
> +			if (have_pending && !strcmp(name, pending_name))
> +				have_pending =3D false;
> +
> +			igt_assert_f(!payload_by_name(name, payloads, n_payloads),
> +				     "[%s]: kernel could not snapshot the buffer: %s",
> +				     name, value);
> +			continue;
> +		}
> +
> +		if (!parse_blob_field(line, DATA_SUFFIX, name, sizeof(name), &value))
> +			continue;
> +
> +		igt_assert_f(have_pending && !strcmp(name, pending_name),
> +			     "[%s].data is not preceded by a matching .length line\n",
> +			     name);
> +
> +		have_pending =3D false;
> +		n_blobs++;
> +		check_blob(name, pending_length, value, payloads, n_payloads);
> +	}
> +
> +	read_error =3D ferror(f);
> +	read_errno =3D read_error ? errno : 0;
> +	free(line);
> +	fclose(f);
> +
> +	igt_assert_f(!read_error, "Failed to read %s, errno=3D%d\n", path, read=
_errno);
> +	igt_assert_f(!have_pending,
> +		     "[%s].length has no matching .data or .error line\n",
> +		     pending_name);
> +
> +	igt_assert_f(n_blobs, "No ASCII85 blob found in %s\n", path);
> +	igt_debug("Validated %d ASCII85 blobs\n", n_blobs);
> +
> +	for (i =3D 0; i < n_payloads; i++)
> +		igt_assert_f(payloads[i].seen,
> +			     "VMA 0x%" PRIx64 " missing from the devcoredump VM state\n",
> +			     payloads[i].addr);
> +}
> +
>  static char
>  *get_coredump_item(regex_t *regex, char **lines, const char *tag, int ta=
g_index, int target_index)
>  {
> @@ -392,6 +749,8 @@ static void test_card(int fd)
>  		check_item_u64(&regex, lines, "length:", addr,
>  			       addr + BATCH_DW_COUNT * sizeof(u32), INDEX_VALUE, INDEX_KEY);
> =20
> +		validate_devcoredump(path, NULL, 0);
> +
>  		/* clear devcoredump */
>  		rm_devcoredump(path);
>  		sleep(1);
> @@ -404,10 +763,183 @@ static void test_card(int fd)
>  	regfree(&regex);
>  }
> =20
> +/**
> + * hang_with_payloads - Hang @eci with dumpable buffers of known content
> + * @fd: xe device file descriptor
> + * @eci: engine to hang
> + * @payloads: buffers to create, fill and bind; handles are returned to =
the
> + *	      caller, which owns them
> + * @n_payloads: number of entries in @payloads
> + *
> + * Submits a batch that spins forever, so the job timeout fires and the =
driver
> + * writes a devcoredump. The payloads share the address space of that ba=
tch and
> + * are bound DUMPABLE, which is what tells the driver to copy their cont=
ents
> + * into the dump, giving us blobs whose expected bytes are known exactly=
.
> + */
> +static void
> +hang_with_payloads(int fd, struct drm_xe_engine_class_instance *eci,
> +		   struct payload_bo *payloads, int n_payloads)
> +{
> +	struct drm_xe_sync sync =3D {
> +		.type =3D DRM_XE_SYNC_TYPE_SYNCOBJ,
> +		.flags =3D DRM_XE_SYNC_FLAG_SIGNAL,
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(&sync),
> +	};
> +	struct xe_spin_opts spin_opts =3D { .addr =3D CAPTURE_SPIN_ADDRESS };
> +	uint64_t spin_size =3D xe_bb_size(fd, sizeof(struct xe_spin));
> +	uint32_t vm =3D xe_vm_create(fd, 0, 0);
> +	uint32_t spin_bo, exec_queue, bind_syncobj, exec_syncobj;
> +	struct xe_spin *spin;
> +	int i;
> +
> +	spin_bo =3D xe_bo_create(fd, vm, spin_size, vram_if_possible(fd, eci->g=
t_id),
> +			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	spin =3D xe_bo_map(fd, spin_bo, spin_size);
> +
> +	bind_syncobj =3D syncobj_create(fd, 0);
> +	sync.handle =3D bind_syncobj;
> +
> +	__xe_vm_bind_assert(fd, vm, 0, spin_bo, 0, CAPTURE_SPIN_ADDRESS, spin_s=
ize,
> +			    DRM_XE_VM_BIND_OP_MAP, DRM_XE_VM_BIND_FLAG_DUMPABLE,
> +			    &sync, 1, 0, 0);
> +	igt_assert(syncobj_wait(fd, &bind_syncobj, 1, INT64_MAX, 0, NULL));
> +
> +	for (i =3D 0; i < n_payloads; i++) {
> +		uint32_t *map;
> +		uint64_t j;
> +
> +		/* Use system memory so the large capture does not require large VRAM.=
 */
> +		payloads[i].handle =3D xe_bo_create(fd, vm, payloads[i].size,
> +						  system_memory(fd), 0);
> +		map =3D xe_bo_map(fd, payloads[i].handle, payloads[i].size);
> +		for (j =3D 0; j < payloads[i].size / sizeof(*map); j++)
> +			map[j] =3D payload_dword(payloads[i].payload_index, j);
> +		munmap(map, payloads[i].size);
> +
> +		syncobj_reset(fd, &bind_syncobj, 1);
> +		__xe_vm_bind_assert(fd, vm, 0, payloads[i].handle, 0, payloads[i].addr=
,
> +				    payloads[i].size, DRM_XE_VM_BIND_OP_MAP,
> +				    DRM_XE_VM_BIND_FLAG_DUMPABLE, &sync, 1, 0, 0);
> +		igt_assert(syncobj_wait(fd, &bind_syncobj, 1, INT64_MAX, 0, NULL));
> +	}
> +
> +	exec_queue =3D xe_exec_queue_create(fd, vm, eci, 0);
> +	exec_syncobj =3D syncobj_create(fd, 0);
> +
> +	xe_spin_init(spin, &spin_opts);
> +
> +	sync.handle =3D exec_syncobj;
> +	exec.exec_queue_id =3D exec_queue;
> +	exec.address =3D CAPTURE_SPIN_ADDRESS;
> +	xe_exec(fd, &exec);
> +
> +	xe_spin_wait_started(spin);
> +
> +	/* The job timeout resets the queue, which is what creates the dump */
> +	igt_assert(syncobj_wait(fd, &exec_syncobj, 1, INT64_MAX, 0, NULL));
> +
> +	syncobj_destroy(fd, exec_syncobj);
> +	syncobj_destroy(fd, bind_syncobj);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +	munmap(spin, spin_size);
> +	gem_close(fd, spin_bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +/**
> + * SUBTEST: decode-data
> + * Description: Create payloads with known contents, hang an engine, and
> + * 		verify the resulting coredump's blob lengths and payload
> + * 		contents before removing it
> + *
> + * SUBTEST: decode-data-large
> + * Description: Same as decode-data, but with enough data to exercise ke=
rnel's
> + * 		coredump chunking and the legacy size limit
> + */
> +static void
> +test_capture_payload(int fd, struct drm_xe_engine_class_instance *eci,
> +		     int n_payloads, uint64_t payload_size)
> +{
> +	char path[MAX_SYSFS_PATH_LEN];
> +	struct payload_bo *payloads;
> +	int i;
> +
> +	/* Every buffer needs its own slice of the 32-bit value space */
> +	igt_assert(payload_size / sizeof(uint32_t) <=3D PAYLOAD_INDEX_STRIDE &&
> +		   n_payloads <=3D UINT32_MAX / PAYLOAD_INDEX_STRIDE);
> +
> +	payloads =3D calloc(n_payloads, sizeof(*payloads));
> +	igt_assert(payloads);
> +
> +	for (i =3D 0; i < n_payloads; i++) {
> +		payloads[i].addr =3D CAPTURE_PAYLOAD_ADDRESS + i * payload_size;
> +		payloads[i].size =3D payload_size;
> +		payloads[i].payload_index =3D i;
> +	}
> +
> +	get_devcoredump_path(igt_device_get_card_index(fd), path);
> +	rm_devcoredump(path);
> +
> +	/* Wait for the previous coredump to disappear before creating another.=
 */
> +	igt_assert_f(igt_wait(!devcoredump_exists(path), 5000, 100),
> +		     "Devcoredump not removed, errno=3D%d.\n", errno);
> +
> +	hang_with_payloads(fd, eci, payloads, n_payloads);
> +
> +	/*
> +	 * Close our BO handles; the snapshot holds BO references until it copi=
es
> +	 * their contents into kernel-owned buffers for the coredump.
> +	 */
> +	for (i =3D 0; i < n_payloads; i++)
> +		gem_close(fd, payloads[i].handle);
> +
> +	igt_assert_f(igt_wait(devcoredump_exists(path), 5000, 100),
> +		     "Devcoredump not created, a previous dump may still be held\n");
> +
> +	validate_devcoredump(path, payloads, n_payloads);
> +
> +	free(payloads);
> +
> +	rm_devcoredump(path);
> +
> +	/* Wait for the dump to disappear so its large buffers can be released.=
 */
> +	igt_assert_f(igt_wait(!devcoredump_exists(path), 5000, 100),
> +		     "Devcoredump not removed, errno=3D%d.\n", errno);
> +}
> +
> +/**
> + * require_capture_memory - Skip unless the machine can hold the whole c=
apture
> + * @n_payloads: number of buffers the subtest binds
> + * @payload_size: size of each buffer
> + *
> + * Upper bound on the footprint: the payloads, the snapshot copy the ker=
nel
> + * takes of them, the chunk the kernel renders and the longest line getl=
ine()
> + * has to buffer. Not all of them peak at the same instant. The renderin=
g buffer
> + * is sized for the unfixed kernel, which is the one this has to survive=
.
> + */
> +static void require_capture_memory(int n_payloads, uint64_t payload_size=
)
> +{
> +	uint64_t payload =3D (uint64_t)n_payloads * payload_size;
> +	uint64_t encoded =3D ASCII85_ENCODED_SIZE(payload);
> +	uint64_t rendered =3D encoded < DEVCOREDUMP_LEGACY_MAX_SIZE ?
> +			    encoded : DEVCOREDUMP_LEGACY_MAX_SIZE;
> +
> +	igt_require_memory(1, 2 * payload + rendered +
> +			   ASCII85_ENCODED_SIZE(payload_size), CHECK_RAM);
> +}
> +
>  int igt_main()
>  {
>  	int xe;
> -	struct drm_xe_engine_class_instance *hwe;
> +	/*
> +	 * The payload tests exercise VM capture and need one engine to trigger=
 it.
> +	 * The reset subtest separately iterates over every available engine.
> +	 */
> +	struct drm_xe_engine_class_instance *hwe, *hang_hwe =3D NULL;
>  	u64 timeouts[DRM_XE_ENGINE_CLASS_VM_BIND] =3D {0};
> =20
>  	igt_fixture() {
> @@ -416,6 +948,8 @@ int igt_main()
>  			/* Skip kernel only classes */
>  			if (hwe->engine_class >=3D DRM_XE_ENGINE_CLASS_VM_BIND)
>  				continue;
> +			if (!hang_hwe)
> +				hang_hwe =3D hwe;
>  			/* Skip classes already set */
>  			if (timeouts[hwe->engine_class])
>  				continue;
> @@ -433,6 +967,19 @@ int igt_main()
>  	igt_subtest("reset")
>  		test_card(xe);
> =20
> +	igt_subtest("decode-data") {
> +		igt_require(hang_hwe);
> +		test_capture_payload(xe, hang_hwe, DECODE_PAYLOAD_COUNT,
> +				     DECODE_PAYLOAD_SIZE);
> +	}
> +
> +	igt_subtest("decode-data-large") {
> +		igt_require(hang_hwe);
> +		require_capture_memory(LARGE_PAYLOAD_COUNT, LARGE_PAYLOAD_SIZE);
> +		test_capture_payload(xe, hang_hwe, LARGE_PAYLOAD_COUNT,
> +				     LARGE_PAYLOAD_SIZE);
> +	}
> +
>  	igt_fixture() {
>  		xe_for_each_engine(xe, hwe) {
>  			u64 store, timeout;
> --=20
> 2.43.0
>=20
>=20
