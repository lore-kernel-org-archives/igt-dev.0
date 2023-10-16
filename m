Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A75810E177
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Oct 2023 09:48:16 +0000 (UTC)
Date: Mon, 16 Oct 2023 11:47:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231016094755.vv2x3on5legt4lll@kamilkon-desk.igk.intel.com>
References: <CAP8JTaYSZ1-3nuc1qHzHDjk_9xqf_1SvQrykTr_s=dNkghnekw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAP8JTaYSZ1-3nuc1qHzHDjk_9xqf_1SvQrykTr_s=dNkghnekw@mail.gmail.com>
Subject: Re: [igt-dev] Request for information on the igt-gpu-tools
 intel_infoframes test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Chalil,

On 2023-10-13 at 12:14:20 +0530, chalil jitesh wrote:
> Hi,
> 
> I was trying to test and validate the Displayport Sink device behaviour to
> invalid stream packets received, while checking for some tools which we can
> use for testing, came to know about the igt-gpu-tools tests which can be
> used for testing compliance of displayport driver.
> 
> For testing I wanted to send some error DP frames packets (send some
> invalid stream data packets) to the DP sink device to check if the sink
> device is behaving correctly to error stream data frames received.
> Could you please give us information if we can use any tools/tests
> available in igt-gpu-tools package, which we can use for testing invalid DP
> frames.
> Can we use the test like intel_infoframes available in igt-gpu-tools
> package to modify/generate the DP error data frames packets which can be
> sent to the sink device (or is the test intel_infoframes only supported for
> HDMI tests).
> 
> Kindly please suggest if any of the tools/tests in igt-gpu-tools package
> can be used for testing sending error DP stream packets.
> 
> With Thanks and Regards
> Jitesh

+cc Bhanu and Juha-Pekka

Regards,
Kamil
