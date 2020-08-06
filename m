Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161816E8B4
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2020 10:45:23 +0000 (UTC)
References: <20200806180749.31464-3-bhanuprakash.modem@intel.com>
 <20200806182414.31672-1-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Message-ID: <423efe58-4bea-f90b-8d24-332925d148fa@intel.com>
Date: Thu, 6 Aug 2020 16:15:18 +0530
MIME-Version: 1.0
In-Reply-To: <20200806182414.31672-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH v2] intel-ci: Add compare CRC sanity test to
 BAT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 06-Aug-20 11:54 PM, Bhanuprakash Modem wrote:
> We need to sanity-check for the CRC mismatches, otherwise
> the display validation tests are flawed.
> 
> This patch will add CRC compare mismatch subtests to the
> fast-feedback list to make sure the CRC mechanism is clean
> from the platform.
> 
> V2:
> * Add pipe-d as well (Petri)
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Jeevan B <jeevan.b@intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Acked-by: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel-ci/fast-feedback.testlist | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index b796b264..b98cdb24 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -110,6 +110,10 @@ igt@kms_force_connector_basic@force-edid
>   igt@kms_force_connector_basic@force-load-detect
>   igt@kms_force_connector_basic@prune-stale-modes
>   igt@kms_frontbuffer_tracking@basic
> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-a
> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b
> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c
> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d
>   igt@kms_pipe_crc_basic@hang-read-crc-pipe-a
>   igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a
>   igt@kms_pipe_crc_basic@nonblocking-crc-pipe-a-frame-sequence
> 

-- 
~Swati Sharma
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
