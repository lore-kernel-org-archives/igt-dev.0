Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC11DB48B
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Aug 2022 04:07:55 +0000 (UTC)
Date: Tue, 16 Aug 2022 07:06:45 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Mark Yacoub <markyacoub@chromium.org>
Message-ID: <YvsX1XjiogXpHSCW@platvala-desk.ger.corp.intel.com>
References: <20220715164302.1631538-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715164302.1631538-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH] docs: Update Chamelium doc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, anson.jacob@amd.com, seanpaul@chromium.org,
 ihf@google.com, markyacoub@google.com, khaled.almahallawy@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 15, 2022 at 12:43:02PM -0400, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> 1. Introduce Chamelium V3 hardware
> 2. Update Chamelium ports map
> 3. s/ChromiumOS/Chromium OS which the standard way.
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  docs/chamelium.txt | 76 ++++++++++++++++++++++++++++++++++------------
>  1 file changed, 56 insertions(+), 20 deletions(-)
> 
> diff --git a/docs/chamelium.txt b/docs/chamelium.txt
> index 7484a3f8..c3ae8d57 100644
> --- a/docs/chamelium.txt
> +++ b/docs/chamelium.txt
> @@ -16,7 +16,13 @@ IGT without external hardware.
>  The platform was developed by Google in order to test display and audio-related
>  features of ChromeOS devices. It was initially developed internally by Google as
>  part of the ChromeOS effort under the name Chameleon and was later made external
> -as part of the ChromiumOS effort, under the name Chamelium.
> +as part of the Chromium OS effort, under the name Chamelium.
> +
> +A new Chamelium V3 (Cv3) was released in 2022, which is built with different
> +hardware while maintaining software backwards compatibility with v2.
> +
> +Chamelium V2
> +------------
>  
>  It consists of a custom-made display emulator board connected to an Arrow SoCKit
>  via a flexible cable, with two DisplayPort connectors, one HDMI and one VGA.
> @@ -25,16 +31,28 @@ The SoCKit uses a Cyclone V SoC, with both a FPGA and an ARM CPU. While the FPGA
>  is used for logic control, the CPU runs daemons that allow the board to be
>  controlled over the network via a XMLRPC interface.
>  
> -Documentation
> +Chamelium V3
> +------------
> +It consists of a custom-made display emulator board that has an Enclustra FPGA
> +module mounted on it, with two DisplayPort and two HDMI connectors.
> +
> +The Enclustra FPGA Module uses a Arria 10 SoC, with both a FPGA and an ARM CPU.
> +While the FPGA is used for logic control, the CPU runs daemons that allow the
> +board to be controlled over the network via a XMLRPC interface.
> +
> +[Current limitation] Cv3 hardware uses an ITE chip which allows only 1 port to
> +be plugged in a time. This limitation will be fixed in the upcoming iteration. 
> +
> +Chamelium V2 Documentation
>  -------------

Make the --- the same length as the section title.

>  
>  Documentation about the Chamelium is made available by Google through the
> -ChromiumOS projet wiki: https://www.chromium.org/chromium-os/testing/chamelium
> +Chromium OS projet wiki: https://www.chromium.org/chromium-os/testing/chamelium
>  
> -Deploying the Chamelium With IGT
> +Setting up Chamelium V2
>  --------------------------------

Same here.

With those changed, this is
Reviewed-by: Petri Latvala <petri.latvala@intel.com>


>  
> -Instructions from the ChromiumOS wiki detail how to setup the Chamelium:
> +Instructions from the Chromium OS wiki detail how to setup the Chamelium:
>  https://www.chromium.org/chromium-os/testing/chamelium#TOC-Setting-up-Chamelium
>  
>  The should be followed up until the "Setup your Linux host, DUT and the FPGA"
> @@ -57,6 +75,9 @@ and then configure eth0 like so:
>  This document supposes that target PC's network IP has "192.168.1.1/24" and
>  the Chamelium's network IP has "192.168.1.2/24".
>  
> +Deploying the Chamelium With IGT
> +--------------------------------
> +
>  Chamelium support requires setting up dedicated IGT configuration, as explained
>  in the Core and Chamelium parts of the IGT API Reference in the documentation.
>  
> @@ -99,16 +120,11 @@ example (only Chamelium.URL is mandatory):
>  
>      # The name of the DRM connector
>      # The DP-1 of [Chamelium:DP-1] and the HDMI-A-1 of [Chamelium:HDMI-A-1] indicate
> -    # "connector info type" of /sys/kernel/debug/dri/0/i915_display_info.
> +    # "connector info type" of /sys/kernel/debug/dri/0/i915_display_info on the DUT.
>      [Chamelium:DP-1]
>      # The ChameliumPortID indicates physical port (device) id of a Chamelium Board.
> -    # A Chamelium daemon program defines these port ids as
> -    # - DP1 (located next to the HDMI port) = 1
> -    # - DP2 (located next to the VGA connector) = 2
> -    # - HDMI = 3
> -    # - VGA = 4
> -    # The port ids are defined at:
> -    # https://chromium.googlesource.com/chromiumos/platform/chameleon/+/master/chameleond/utils/ids.py
> +    # For Chamelium daemon program definition of these port IDs, check the Port IDs sections below.
> +    # You should only assign the ports that are physically connected to the DUT.
>      ChameliumPortID=1
>  
>      [Chamelium:HDMI-A-1]
> @@ -125,6 +141,21 @@ example (only Chamelium.URL is mandatory):
>      [Chamelium:VGA-1]
>      ChameliumPortID=4
>  
> +Chamelium V2 Port IDs
> +---------------------
> +defined at: https://chromium.googlesource.com/chromiumos/platform/chameleon/+/master/chameleond/utils/ids.py
> +DP1 (located next to the HDMI port) = 1
> +DP2 (located next to the VGA connector) = 2
> +HDMI = 3
> +VGA = 4
> +
> +Cv3 Port IDs
> +---------------------
> +DP1 (top left) = 0
> +DP2 (top right) = 1
> +HDMI1 (bottom left) = 2
> +HDMI2 (bottom right) = 3
> +
>  Running the Chamelium With IGT
>  ------------------------------
>  
> @@ -144,12 +175,18 @@ The XML-RPC Chamelium interface is described here:
>  https://chromium.googlesource.com/chromiumos/platform/chameleon/+/refs/heads/master/chameleond/interface.py
>  
>  Logs that may be useful for debugging can be obtained either by connecting to
> -the board via SSH or serial console and looking at the daemon logs from
> +the board via SSH or serial console and looking at the daemon logs/
> +On V2:
> +------
>  /var/log, such as:
>  $ tail -f /var/log/chameleon*
> +On V3:
> +------
> +Chameleon v3 uses systemd to manage the chameleond service. The logs can be
> +accessed using  `$ journalctl -u chameleond`, or the  .GetChameleonLogs()  XMLRPC call.
>  
> -Daemon Source, Build and Deploy
> --------------------------------
> +Daemon Source, Build and Deploy [V2 only]
> +-----------------------------------------
>  
>  Source code for the daemon running on the Chamelium is available at:
>  https://chromium.googlesource.com/chromiumos/platform/chameleon/
> @@ -185,12 +222,12 @@ file.
>  Contributing Changes to the Daemon
>  ----------------------------------
>  
> -Contributions to the Chamelium daemon, just like any contribution to ChromiumOS,
> +Contributions to the Chamelium daemon, just like any contribution to Chromium OS,
>  are submitted and reviewed at: https://chromium-review.googlesource.com/
>  
> -The ChromiumOS project provides an extensive developer guide:
> +The Chromium OS project provides an extensive developer guide:
>  https://chromium.googlesource.com/chromiumos/docs/+/master/developer_guide.md
> -It assumes running within the ChromiumOS build system. Since this is likely not
> +It assumes running within the Chromium OS build system. Since this is likely not
>  the case for contributing to the Chamelium daemon, only the part about
>  uploading changes is relevant:
>  https://chromium.googlesource.com/chromiumos/docs/+/master/developer_guide.md#Upload-your-changes-and-get-a-code-review
> @@ -225,7 +262,6 @@ Future Developments
>  With the current generation of the hardware platform, support for testing a
>  number of additional display features could be included as future developments,
>  including:
> -* Audio capture from HDMI
>  * Check all channels are independent from each other
>  * Playback using more than 2 channels, different sampling rates and different
>    sample sizes
> -- 
> 2.37.0.170.g444d1eabd0-goog
> 
