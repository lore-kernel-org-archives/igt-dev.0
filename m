Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CA26E528
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2019 13:26:25 +0000 (UTC)
Received: from platvala by thrakatuluk with local (Exim 4.91)
 (envelope-from <petri.latvala@intel.com>) id 1igqOD-00049f-TS
 for igt-dev@lists.freedesktop.org; Mon, 16 Dec 2019 15:26:21 +0200
Date: Mon, 16 Dec 2019 15:26:21 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20191216132621.GE25209@platvala-desk.ger.corp.intel.com>
References: <20191205130246.21695-1-petri.latvala@intel.com>
 <157605183942.30690.11947581064789413262@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157605183942.30690.11947581064789413262@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_warning_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2C1/2=5D_runner=3A_Ensure_generate?=
 =?utf-8?q?d_json_is_properly_UTF8-encoded?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 11, 2019 at 08:10:39AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: series starting with [i-g-t,1/2] runner: Ensure generated json is properly UTF8-encoded
> URL   : https://patchwork.freedesktop.org/series/70492/
> State : warning
> 
> == Summary ==
> 
> Did not get list of undocumented tests for this run, something is wrong!
> 
> Other than that, pipeline status: FAILED.


Not completely surprisingly the fancy-characters patch doesn't survive
being sent by email. The series can be seen in
https://gitlab.freedesktop.org/adrinael/igt-gpu-tools/commits/unprintable
with the build-time tests passing.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
