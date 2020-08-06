Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD726E8B0
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2020 10:20:44 +0000 (UTC)
Date: Thu, 6 Aug 2020 13:20:40 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200806102040.GY20883@platvala-desk.ger.corp.intel.com>
References: <20200806124450.29360-1-bhanuprakash.modem@intel.com>
 <20200806180426.31343-3-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200806180426.31343-3-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [PATCH v1 2/2] intel-ci: Add compare CRC sanity test
 to BAT
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
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 06, 2020 at 11:34:26PM +0530, Bhanuprakash Modem wrote:
> We need to sanity-check for the CRC mismatches, otherwise
> the display validation tests are flawed.
> 
> This patch will add CRC compare mismatch subtests to the
> fast-feedback list to make sure the CRC mechanism is clean
> from the platform.
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Jeevan B <jeevan.b@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/intel-ci/fast-feedback.testlist | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index b796b264..b9d769d8 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -110,6 +110,9 @@ igt@kms_force_connector_basic@force-edid
>  igt@kms_force_connector_basic@force-load-detect
>  igt@kms_force_connector_basic@prune-stale-modes
>  igt@kms_frontbuffer_tracking@basic
> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a
> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b
> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c

Add pipe-d as well.

Acked-by: Petri Latvala <petri.latvala@intel.com>

Swati and Karthik provided comments on the first patch, so as soon as
they say it's good now we can merge this.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
