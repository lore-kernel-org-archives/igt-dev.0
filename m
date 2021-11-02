Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749236FEE0
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Nov 2021 13:30:08 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id w15so76108811edc.9
 for <igt-dev@lists.freedesktop.org>; Tue, 02 Nov 2021 06:30:08 -0700 (PDT)
Message-ID: <d63272a8-5e09-1b95-a64c-ba3320f9052e@gmail.com>
Date: Tue, 2 Nov 2021 15:29:54 +0200
MIME-Version: 1.0
Content-Language: en-US
References: <20211026212620.2718277-1-imre.deak@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20211026212620.2718277-1-imre.deak@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 0/4] lib/igt_fb/tgl+: Remove CCS FB
 layout restrictions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Imre Deak <imre.deak@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

I didn't spot anything to specially comment about, set look ok to me 
including v2 of patch #2.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 27.10.2021 0.26, Imre Deak wrote:
> Some restrictions on the stride, offset and size of TGL+ CCS FB surfaces
> are not something the HW requires, so this patchset removes those.
> 
> On ADLP this also removes the main and CCS AUX stride restriction
> required by the CCS modifier uAPI, making the uAPI of ADLP identical to
> that of TGL.
> 
> Because of the uAPI change above the CI results for this patchset are
> only valid with the corresponding kernel changes which I'll submit later
> adding a reference to this one, so the two are tested together.
> 
> I tested these changes with the kernel upcoming kernel patchset on
> SKL/TGL/ADLP.
> 
> Imre Deak (4):
>    lib/igt_fb/adlp: Remove CCS FB stride alignment restrictions
>    lib/igt_fb/tgl+: Prevent CCS FB UV surface offset overalignment
>    lib/igt_fb/tgl+: Remove CCS FB 4 tile height alignment restriction
>    lib/igt_fb/tgl+: Prevent CCS FB AUX surface size overalignment
> 
>   lib/igt_fb.c            | 87 +++++++++++++++++++++++++++--------------
>   lib/intel_aux_pgtable.c | 66 ++++---------------------------
>   lib/intel_bufops.c      |  2 +-
>   3 files changed, 66 insertions(+), 89 deletions(-)
> 
