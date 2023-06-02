Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3091910E676
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jun 2023 11:58:07 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-96f5685f902so278573666b.2
 for <igt-dev@lists.freedesktop.org>; Fri, 02 Jun 2023 04:58:07 -0700 (PDT)
Message-ID: <46bfe09d-a673-196b-dc19-999d1903a772@gmail.com>
Date: Fri, 2 Jun 2023 14:58:00 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20230531074530.367036-1-swati2.sharma@intel.com>
 <20230531074530.367036-4-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230531074530.367036-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/3] intel-ci: update fastfeedback
 testlist
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
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 31.5.2023 10.45, Swati Sharma wrote:
> Update fastfeedback testlist.
> 
> v2: -fixed typo, renamed xrg888 to xr24 (Bhanu)
>      -updated xe fastfeedback testlist too (Bhanu)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel-ci/fast-feedback.testlist    | 3 ++-
>   tests/intel-ci/xe-fast-feedback.testlist | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
> index cfe7cb4a..31639c89 100644
> --- a/tests/intel-ci/fast-feedback.testlist
> +++ b/tests/intel-ci/fast-feedback.testlist
> @@ -118,7 +118,8 @@ igt@kms_force_connector_basic@force-edid
>   igt@kms_force_connector_basic@force-load-detect
>   igt@kms_force_connector_basic@prune-stale-modes
>   igt@kms_frontbuffer_tracking@basic
> -igt@kms_pipe_crc_basic@compare-crc-sanitycheck
> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
>   igt@kms_pipe_crc_basic@hang-read-crc
>   igt@kms_pipe_crc_basic@nonblocking-crc
>   igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 7242c8d8..bdd12e57 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -259,7 +259,8 @@ igt@kms_flip@basic-plain-flip
>   igt@kms_force_connector_basic@force-connector-state
>   igt@kms_force_connector_basic@force-edid
>   igt@kms_force_connector_basic@prune-stale-modes
> -igt@kms_pipe_crc_basic@compare-crc-sanitycheck
> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
>   igt@kms_pipe_crc_basic@hang-read-crc
>   igt@kms_pipe_crc_basic@nonblocking-crc
>   igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
