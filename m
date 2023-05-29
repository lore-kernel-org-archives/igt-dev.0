Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17B9F10E038
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 05:56:27 +0000 (UTC)
Message-ID: <9b88811c-1e73-e921-88f1-b28750ebff42@intel.com>
Date: Mon, 29 May 2023 11:25:43 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230526174305.319725-1-swati2.sharma@intel.com>
 <20230526174305.319725-3-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230526174305.319725-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] intel-ci: update fastfeedback
 testlist
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

Hi Swati,

On Fri-26-05-2023 11:13 pm, Swati Sharma wrote:
> Update fastfeedback testlist.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel-ci/fast-feedback.testlist | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index cfe7cb4a..40096faf 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -118,7 +118,8 @@ igt@kms_force_connector_basic@force-edid
>   igt@kms_force_connector_basic@force-load-detect
>   igt@kms_force_connector_basic@prune-stale-modes
>   igt@kms_frontbuffer_tracking@basic
> -igt@kms_pipe_crc_basic@compare-crc-sanitycheck
> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xrgb888
--------------------------------------------------^
 From patch [2/3] in this series, this must be xr24

Also, please port this change to Xe too.
"tests/intel-ci/xe.fast-feedback.testlist"

- Bhanu

> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
>   igt@kms_pipe_crc_basic@hang-read-crc
>   igt@kms_pipe_crc_basic@nonblocking-crc
>   igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
