Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869F010E0D3
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Oct 2022 08:29:11 +0000 (UTC)
Date: Mon, 24 Oct 2022 11:29:02 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Message-ID: <Y1ZMznCsU1YtnpwA@platvala-desk.ger.corp.intel.com>
References: <Y1K8Nn/Gem9BCgg8@unerlige-ril>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1K8Nn/Gem9BCgg8@unerlige-ril>
Subject: Re: [igt-dev] Merge patches that are failing to land in the ML and
 patchworks
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Oct 21, 2022 at 08:35:18AM -0700, Umesh Nerlige Ramappa wrote:
> Hi Petri,
> 
> Reg: [igt-dev] [PATCH i-g-t v6 00/36] Add DG2 OA test
> 
> I posted this series a while ago and I have some large XML files in these
> patches that are not landing in the ML because mail servers reject it.
> Hence, it does not make it to patchworks and I am not able to run pre-merge
> CI on the kernel patches.
> 
> To resolve this, I am planning to just merge the XML files and relevant
> scripts as a separate series of 10 patches shared here:
> 
> https://gitlab.freedesktop.org/unerlige/igt-gpu-tools/-/commits/master
> 
> Once that is merged, I will post the remaining patches to the ML so that
> pre-merge can run. I did a sanity check on these patches with kbl, tgl, adlp
> (with guc) and I don't see any issues.
> 
> Requesting an Ack for this.

Acked-by: Petri Latvala <petri.latvala@intel.com>
